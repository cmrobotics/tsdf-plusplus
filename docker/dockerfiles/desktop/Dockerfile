
FROM tsdf-plusplus-ros-base:v0.1


ENV DEBIAN_FRONTEND noninteractive

ARG USERNAME=ros
USER $USERNAME
WORKDIR /home/$USERNAME

RUN sudo apt update \
    && sudo apt install -y --no-install-recommends --allow-unauthenticated \
        software-properties-common curl apache2-utils \
        supervisor nginx sudo net-tools zenity xz-utils \
        dbus-x11 x11-utils alsa-utils curl ca-certificates gnupg patch \
        mesa-utils libgl1-mesa-dri ffmpeg \
        lxde gtk2-engines-murrine gnome-themes-standard gtk2-engines-pixbuf gtk2-engines-murrine arc-theme \
        xvfb x11vnc \
        vim-tiny sudo firefox-geckodriver ttf-ubuntu-font-family ttf-wqy-zenhei  \
    && sudo apt autoclean -y \
    && sudo add-apt-repository -r ppa:fcwu-tw/apps \
    && sudo apt autoremove -y \
    && sudo rm -rf /var/lib/apt/lists/* \
    && sudo mkdir /usr/local/ffmpeg \
    && sudo ln -s /usr/bin/ffmpeg /usr/local/ffmpeg/ffmpeg

#ARG TINI_VERSION=v0.18.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /bin/tini
#RUN chmod +x /bin/tini

ENV HOME=/home/ros \
    SHELL=/bin/bash

#WORKDIR /root
#ENV HOME=/home/ubuntu \
#    SHELL=/bin/bash

#RUN echo -n "$VNC_PASSWORD" >
#/usr/bin/lxpanel --profile LXDE /.password1
#RUN x11vnc -storepasswd $(cat /.password1) /.password2
#RUN chmod 400 /.password*
#RUN sed -i 's/^command=x11vnc.*/& -rfbauth \/.password2/' /etc/supervisor/conf.d/supervisord.conf
#RUN export VNC_PASSWORD=
#RUN sed -i "s/^command=x11vnc.*/& ${X11VNC_ARGS}/" /etc/supervisor/conf.d/supervisord.conf
#RUN sed -i "s/1024x768/$RESOLUTION/" /usr/local/bin/xvfb.sh
#x11vnc -display :1 -xkb -forever -shared -repeat -capslock