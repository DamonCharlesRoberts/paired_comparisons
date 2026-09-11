# Documentation for Developers in this repository

## Contributing

At this time, the owners of this repository are not open to contributions.
If you stumble across this repository and have feedback, please feel free to open an issue on the Github repo.
Please do not use bots to contribute to this repository -- I have a day job and I really hate the effects of AI on the open source community; it has disuaded me significantly, don't ruin this for me.

## Environment set-up

### The quick path

In your terminal, execute:

```
./setup.sh
```
This will automatically configure the environments listed below.
For this script to execute successfully, the following are required pre-requisites:

- Installation of Astral's `uv` for Python dependency management.

### Python

To configure your Python environment, it is recommended that you use Astral's `uv` to install the Python dependencies and to create your `.venv`.
If you use `pip`, you can use the `requirements.txt` file with the following command in your terminal:

```
pip install -r requirements.txt`
```

The `requirements.txt` *should* be synchronized with the `pyproject.toml` and `uv.lock` files (which are the primary sources of information about the current dependencies being used).

If using `uv`, you can run the following in your terminal:

```
uv sync
```

This should then install all of the Python dependencies and store it into a directory at the root called `.venv`.
To ensure that this is activated so that you can access the dependencies, you can use:

```
source .venv/bin/activate
```

or you can use the `uv run` command in your terminal.

Before committing any code, there will be checks that are automatically executed and formatting that will be automatically applied to the code using hooks specified in the `.pre-commit-config.yaml` file.
If any of those hooks fail, the git commit will not be successful and the hooks will need to successfully run before the commit is completed and code can be pushed to the repository.
