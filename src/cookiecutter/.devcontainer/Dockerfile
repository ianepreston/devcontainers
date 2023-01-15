# [Choice] Ubuntu version (use jammy on local arm64/Apple Silicon): jammy, focal
ARG VARIANT="jammy"
FROM ianepreston/base-devcontainer:${VARIANT}

# Install cookiecutter and cruft
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y \
      python3-dev \
      python3-pip \
      python3-venv \
      python3-virtualenv && \
	python3 -m pip install --upgrade pip && \
	export PIPX_HOME=/opt/pipx && \
	export PIPX_BIN_DIR=/usr/local/bin && \
	python3 -m pip install pipx && \
	python3 -m pipx ensurepath && \
	python3 -m pipx install cookiecutter && \
	python3 -m pipx install cruft