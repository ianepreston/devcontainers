# [Choice] Ubuntu version (use jammy on local arm64/Apple Silicon): jammy, focal
ARG VARIANT="jammy"
FROM ianepreston/base-devcontainer:${VARIANT}

# Install latex
RUN	export DEBIAN_FRONTEND=noninteractive && \
	apt update && \
	apt install -y \
	texlive-full

# Install nbdev
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y \
      python3-dev \
      python3-pip \
      python3-venv \
      python3-virtualenv && \
	python3 -m pip install --upgrade pip && \
	python3 -m pip install nbdev

# Install pre-commit
RUN python3 -m pip install pre-commit