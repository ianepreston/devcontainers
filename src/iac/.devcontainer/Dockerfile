# [Choice] Ubuntu version (use jammy or bionic on local arm64/Apple Silicon): jammy, focal, bionic
ARG VARIANT="jammy"
FROM ianepreston/base-devcontainer:${VARIANT}

# Install ansible
RUN	export DEBIAN_FRONTEND=noninteractive && \
	apt update && \
	apt install -y software-properties-common && \
	apt-add-repository ppa:ansible/ansible && \
	apt update && \
	apt install -y ansible && \
	ansible-galaxy collection install community.general && \
	ansible-galaxy collection install kewlfft.aur

# Install terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    tee /usr/share/keyrings/hashicorp-archive-keyring.gpg && \
	echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    tee /etc/apt/sources.list.d/hashicorp.list && \
	apt update && \
	apt install -y terraform

# Install Azure CLI
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null && \
	AZ_REPO=$(lsb_release -cs) && \
	echo "deb [arch=`dpkg --print-architecture`] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
	apt update && \
	apt install -y azure-cli

# Install kubectl
RUN curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg \
	https://packages.cloud.google.com/apt/doc/apt-key.gpg && \
	echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] \
	https://apt.kubernetes.io/ kubernetes-xenial main" | \
	tee /etc/apt/sources.list.d/kubernetes.list && \
	apt update && \
	apt install -y kubectl