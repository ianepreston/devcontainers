# [Choice] Ubuntu version (use jammy or bionic on local arm64/Apple Silicon): jammy, focal, bionic
ARG VARIANT="jammy"
FROM ianepreston/base-devcontainer:${VARIANT}
# Have to set it again to be included in the build
ARG VARIANT

LABEL dev.containers.features="common"

# Pyenv dependencies: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y \
	make \
	build-essential \
	libssl-dev \
	zlib1g-dev \
	libbz2-dev \
	libreadline-dev \
	libsqlite3-dev \
	# wget \
	# curl \
	llvm \
	libncursesw5-dev \
	xz-utils \
	tk-dev \
	libxml2-dev \
	libxmlsec1-dev \
	libffi-dev \
	liblzma-dev

# Install pyenv and python versions
RUN export PYENV_ROOT=/usr/share/pyenv && \
	curl https://pyenv.run | bash && \
	export PATH="$PYENV_ROOT/bin:$PATH" && \
	eval $(pyenv init --path) && \
	pyenv install 3.11 && \
	pyenv install 3.10 && \
	pyenv install 3.9 && \
	pyenv install 3.8 && \
	pyenv install 3.7 && \
	echo 'export PYENV_ROOT=/usr/share/pyenv' >> ~/.bashrc && \
	echo 'export PYENV_ROOT="/usr/share/pyenv"' >> /home/vscode/.bashrc && \
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
	echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> /home/vscode/.bashrc && \
	echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> ~/.bashrc && \
	echo 'export PATH="$PYENV_ROOT/shims:$PATH"' >> /home/vscode/.bashrc && \
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc && \
	echo 'eval "$(pyenv init -)"' >> /home/vscode/.bashrc && \
	chmod -R 777 /usr/share/pyenv/shims 
