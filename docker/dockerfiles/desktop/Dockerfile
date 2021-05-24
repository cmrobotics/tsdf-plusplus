
FROM tsdf-plusplus-ros-base:v0.1


# built-in packages
ENV DEBIAN_FRONTEND noninteractive
RUN add-apt-repository -r ppa:fcwu-tw/apps

RUN apt update \
    && apt install -y --no-install-recommends --allow-unauthenticated \
        software-properties-common curl apache2-utils \
        supervisor nginx sudo net-tools zenity xz-utils \
        dbus-x11 x11-utils alsa-utils curl ca-certificates gnupg patch \
        mesa-utils libgl1-mesa-dri ffmpeg \
        lxde gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme \
        xvfb x11vnc \
        vim-tiny firefox ttf-ubuntu-font-family ttf-wqy-zenhei  \
    && apt autoclean -y \
    && add-apt-repository -r ppa:fcwu-tw/apps \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /usr/local/ffmpeg \
    && ln -s /usr/bin/ffmpeg /usr/local/ffmpeg/ffmpeg

# tini to fix subreap
ARG TINI_VERSION=v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
RUN chmod +x /bin/tini

WORKDIR /root
ENV HOME=/home/ubuntu \
    SHELL=/bin/bash
