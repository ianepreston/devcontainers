# [Choice] Ubuntu version (use jammy or bionic on local arm64/Apple Silicon): jammy, focal, bionic
ARG VARIANT="jammy"
FROM ianepreston/base-devcontainer:${VARIANT}

RUN	export DEBIAN_FRONTEND=noninteractive && \
	apt update && \
	apt install -y software-properties-common && \
	apt-add-repository ppa:ansible/ansible && \
	apt update && \
	apt install -y ansible && \
	ansible-galaxy collection install community.general && \
	ansible-galaxy collection install kewlfft.aur