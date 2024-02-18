FROM archlinux/archlinux:latest


ARG UUID=1000
ARG GUID=$UUID
ENV USERNAME=arch
ENV TZ="America/Edmonton"

COPY 00-restore-env.sh /etc/profile.d/00-restore-env.sh
COPY locale.gen /etc/locale.gen

RUN locale-gen
COPY locale.conf /etc/locale.conf

RUN sed -e '/NoProgressBar/ s/^#*/#/' -i /etc/pacman.conf ;\
	sed -e '/Color/ s/^#//' -i /etc/pacman.conf

RUN pacman -Syyu --noconfirm --needed reflector base-devel git sudo

RUN groupadd -g "${GUID}" "${USERNAME}" ;\
	useradd -ms /bin/bash "${USERNAME}" -u "${UUID}" -g "${USERNAME}" -g wheel ;\
	echo "ALL ALL=(ALL) NOPASSWD:ALL" > "/etc/sudoers.d/${USERNAME}" ;\
	chmod 0440 "/etc/sudoers.d/${USERNAME}"

RUN reflector --latest 200 --protocol http,https --sort rate --save /etc/pacman.d/mirrorlist

RUN pacman -S --noconfirm \
	curl \
	wget \
	man-db \
	unzip \
	openssh \
	jq \
	neovim \
	fish \
	starship && \
	pacman -Scc --noconfirm

USER $USERNAME
RUN pushd /tmp ;\
	git clone "https://aur.archlinux.org/yay.git" yay ;\
	pushd yay ;\
	makepkg -si --noconfirm ;\
	popd -2 ;\
	rm -rf yay

