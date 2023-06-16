# [Choice] Ubuntu version (use jammy on local arm64/Apple Silicon): jammy, focal
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

# Install tflint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

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
RUN curl -sL https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
	gpg --dearmor | \
	tee /etc/apt/trusted.gpg.d/kubernetes.gpg > /dev/null && \
	echo "deb [signed-by=/etc/apt/trusted.gpg.d/kubernetes.gpg] \
	https://apt.kubernetes.io/ kubernetes-xenial main" | \
	tee /etc/apt/sources.list.d/kubernetes.list && \
	apt update && \
	apt install -y kubectl

# Install Bitwarden CLI
RUN wget https://github.com/bitwarden/clients/releases/download/cli-v2023.1.0/bw-linux-2023.1.0.zip && \
	unzip bw-linux-2023.1.0.zip && \
	rm bw-linux-2023.1.0.zip && \
	chmod +x bw && \
	mv bw /usr/bin/