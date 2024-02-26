FROM ianepreston/base-arch-devcontainer:latest

USER root

RUN pacman -Syu --noconfirm && \
	pacman -S --noconfirm \
	texlive \
	python-pipx

RUN pipx install nbdev

USER arch
RUN echo y | LANG=C yay -S --provides=false --answerdiff None --answerclean None --mflags "--noconfirm" quarto-cli-bin
