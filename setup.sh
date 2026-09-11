#!/usr/bin/env bash

set -euo pipefail

# Automated set-up of the environment.
# Requires either:
# - Astral's uv, or
# - Python 3 + pip

echo "=== SYSTEM DEPENDENCIES ==="

if command -v uv >/dev/null 2>&1; then
    echo "uv is installed."
    USE_UV=true
elif command -v python3 >/dev/null 2>&1 && python3 -m pip --version >/dev/null 2>&1; then
    echo "uv is not installed; pip is available."
    USE_UV=false
else
    echo "Neither uv nor a usable Python/pip installation was found."
    echo "Install Astral's uv or Python 3 with pip."
    exit 1
fi

echo "=== INSTALLING DEPENDENCIES INTO .venv ==="

if [[ "$USE_UV" == true ]]; then
    uv sync
else
    python3 -m venv .venv
    .venv/bin/python -m pip install --upgrade pip
    .venv/bin/python -m pip install -r requirements.txt
fi

echo "=== INSTALLING pre-commit AND RUNNING ALL HOOKS ==="

if [[ "$USE_UV" == true ]]; then
    uv run pre-commit install
    uv run pre-commit run --all-files
else
    .venv/bin/pre-commit install
    .venv/bin/pre-commit run --all-files
fi

echo "=== ENVIRONMENT IS READY! ==="
