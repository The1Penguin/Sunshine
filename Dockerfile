from lizardbyte/sunshine:v0.20.0-archlinux
# install Steam, Wayland, etc.

user root

run printf "[multilib]\nInclude = /etc/pacman.d/mirrorlist\n" >> /etc/pacman.conf \
    && pacman -Sy --noconfirm steam lutris nvidia-utils lib32-nvidia-utils \
    && pacman -Scc --noconfirm

run mkdir -p /steam &&\
    chown -R lizard /steam &&\
    mkdir -p /home/lizard/.local/share &&\
    ln -s /steam /home/lizard/.local/share/Steam &&\
    chown -R lizard /home/lizard/.local

run mkdir -p /lutris &&\
    chown -R lizard /lutris &&\
    mkdir -p /home/lizard/.local/share &&\
    ln -s /lutris /home/lizard/.local/share/lutris &&\
    chown -R lizard /home/lizard/.local

run mkdir -p /games &&\
    chown -R lizard /games &&\
    mkdir -p /home/lizard/.local/share &&\
    ln -s /games /home/lizard/Games &&\
    chown -R lizard /home/lizard/Games

user lizard

volume /steam
volume /lutris
volume /games

entrypoint steam && sunshine
