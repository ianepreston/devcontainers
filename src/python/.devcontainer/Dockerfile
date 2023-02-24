# [Choice] Ubuntu version (use jammy or bionic on local arm64/Apple Silicon): jammy, focal, bionic
ARG VARIANT="jammy"
FROM ianepreston/base-devcontainer:${VARIANT}

# Pyenv dependencies: https://github.com/pyenv/pyenv/wiki#suggested-build-environment
RUN apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y \
	make \
	build-essential \
	pkg-config \
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
	liblzma-dev &&\
	# Install pyenv here, then we'll remove dependencies
	export PYENV_ROOT=/usr/share/pyenv && \
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
	chmod -R 777 /usr/share/pyenv/shims && \
	# Make sure pyenv version file is writable
	touch /usr/share/pyenv/version && \
	chmod 777 /usr/share/pyenv/version && \
	export PYENV_VERSION="" && \
	apt remove -y \
	make \
	# build-essential \
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
	liblzma-dev &&\
	apt autoremove -y

# Install python tools with pipx (and install pipx)
RUN export PIPX_HOME=/opt/pipx && \
	export PIPX_BIN_DIR=/usr/local/bin && \
	export PYENV_ROOT=/usr/share/pyenv && \
	export PATH="$PYENV_ROOT/bin:$PATH" && \
	export PATH="$PYENV_ROOT/shims:$PATH" && \
	pyenv global 3.11 && \
	python -m pip install --upgrade pip && \
	python -m pip install pipx  && \
	python -m pipx ensurepath && \
	python -m pipx install cookiecutter && \
	python -m pipx install cruft && \
	python -m pipx install poetry && \
	# Have to put virtualenvs in the project directory or they'll be created in the container
	# and won't persist
	mkdir -p /root/.config/pypoetry && \
	mkdir -p /home/vscode/.config/pypoetry && \
	chown -R vscode:vscode /home/vscode/.config && \
	printf '%s\n' '[virtualenvs]' 'create = true' 'in-project = true' > /root/.config/pypoetry/config.toml && \
	printf '%s\n' '[virtualenvs]' 'create = true' 'in-project = true' > /home/vscode/.config/pypoetry/config.toml && \
	python -m pipx install nox && \
	python -m pipx inject nox nox-poetry
