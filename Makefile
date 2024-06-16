SOURCES := whisper-typer
POETRY_VERSION := 1.7.0

.PHONY: lint
lint:
	poetry run autoflake --recursive --in-place --expand-star-imports --remove-all-unused-imports $(SOURCES)
	poetry run isort $(SOURCES)
	poetry run black $(SOURCES)
	poetry run mypy $(SOURCES) --explicit-package-bases
	poetry run flake8 --max-line-length=120 $(SOURCES)



################ Helper targets ################
.PHONY: tools
tools: #### Install tools needed for development.
	pip3 install poetry==${POETRY_VERSION}
	poetry install
