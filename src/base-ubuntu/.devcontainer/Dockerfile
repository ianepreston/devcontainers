# [Choice] Ubuntu version (use jammy or bionic on local arm64/Apple Silicon): jammy, focal, bionic
ARG VARIANT="jammy"
FROM buildpack-deps:${VARIANT}-curl
# Have to set it again to be included in the build
ARG VARIANT

LABEL dev.containers.features="common"

RUN if [ "${VARIANT}" = "bionic" ] ; then \
	export DEBIAN_FRONTEND=noninteractive && \
	apt-get update && \
	apt-get -y install software-properties-common && \
	add-apt-repository ppa:martin-frost/thoughtbot-rcm ; \
	fi

# Install updates and dependencies
RUN	apt update && \
	apt upgrade -y && \
	DEBIAN_FRONTEND=noninteractive apt install -y \
	# Required for ssh-agent (don't really need it in container but breaks my dotfiles otherwise)
	keychain \
	# dotfiles management
	rcm \
	# Handle timezone
	locales \
	# Gotta have vim
	vim

# Install starship prompt
RUN curl -sS https://starship.rs/install.sh  | sh -s -- --yes

# Need this because tzdata gets installed and prompts for location if you don't have it
ARG DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/Edmonton /etc/localtime
ENV TZ=America/Edmonton


# Set the locales for Canada and US (US needed for pyenv apparently)
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
	sed -i '/en_CA.UTF-8/s/^# //g' /etc/locale.gen && \
	locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install diff-so-fancy 
RUN apt update && \
	apt install -y software-properties-common && \
	add-apt-repository ppa:aos1/diff-so-fancy && \
	apt update && \
	apt install -y diff-so-fancy