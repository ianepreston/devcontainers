FROM ianepreston/base-arch-devcontainer:latest
USER root
# Install packages
RUN	pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
	pyenv \
	python-poetry \
	python-pipx

USER arch

# Can't do this with yay but native makepkg works. Oh well
RUN pushd /tmp ;\
	git clone https://aur.archlinux.org/python312.git python312 ;\
	pushd python312 ;\
	makepkg -si --noconfirm ;\
	popd -2 ;\
	rm -rf python312

RUN pushd /tmp ;\
	git clone https://aur.archlinux.org/python311.git python311 ;\
	pushd python311 ;\
	makepkg -si --noconfirm ;\
	popd -2 ;\
	rm -rf python311

RUN pushd /tmp ;\
	git clone https://aur.archlinux.org/python310.git python310 ;\
	pushd python310 ;\
	makepkg -si --noconfirm ;\
	popd -2 ;\
	rm -rf python310

RUN pushd /tmp ;\
	git clone https://aur.archlinux.org/python39.git python39 ;\
	pushd python39 ;\
	makepkg -si --noconfirm ;\
	popd -2 ;\
	rm -rf python39

RUN pushd /tmp ;\
	git clone https://aur.archlinux.org/python38.git python38 ;\
	pushd python38 ;\
	makepkg -si --noconfirm ;\
	popd -2 ;\
	rm -rf python38

RUN pipx install nox && pipx inject nox nox-poetry
