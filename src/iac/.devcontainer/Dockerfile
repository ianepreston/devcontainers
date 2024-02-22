##### Don't forget to update links to Bitwarden and tfsec releases
FROM ianepreston/base-arch-devcontainer:latest

USER root
# Install packages
RUN	pacman -S --noconfirm \
	ansible \
	terraform \
	kubectl \
	helm \
	bitwarden \
	python-websocket-client && \
	pacman -Scc --noconfirm

# install ansible plugins
RUN ansible-galaxy collection install community.general && \
	ansible-galaxy collection install kewlfft.aur

# Install tflint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

USER arch
# Install Azure CLI
RUN echo y | LANG=C yay -S --provides=false --answerdiff None --answerclean None --mflags "--noconfirm" azure-cli

# Install databricks cli
RUN echo y | LANG=C yay -S --provides=false --answerdiff None --answerclean None --mflags "--noconfirm" databricks-cli-bin