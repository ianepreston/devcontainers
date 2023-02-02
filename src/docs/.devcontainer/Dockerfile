# [Choice] Ubuntu version (use jammy on local arm64/Apple Silicon): jammy, focal
ARG VARIANT="jammy"
FROM ianepreston/base-devcontainer:${VARIANT}

# Install latex
RUN	export DEBIAN_FRONTEND=noninteractive && \
	apt update && \
	apt install -y \
	texlive-full