FROM nvidia/cuda:11.3.0-cudnn8-runtime-ubuntu18.04
ENV DEBIAN_FRONTEND=noninteractive

# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata dirmngr lsb-release gnupg2 && \
    rm -rf /var/lib/apt/lists/*

RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO melodic

ARG USER_ID
ARG GROUP_ID

# Install dependencies
RUN apt update && \
    apt install -y build-essential tree vim \
    git sudo telnet supervisor \
    python-catkin-tools python-osrf-pycommon \
    autoconf libtool ros-melodic-desktop-full \
    curl wget procps net-tools python3-pip && \
    rm -rf /var/lib/apt/lists/* && \
    apt clean && \
    apt autoclean

RUN pip3 install -U osrf-pycommon wstool setuptools

# Create 'ros' user with sudo powers
ARG USERNAME=ros
RUN groupadd --gid $GROUP_ID $USERNAME
RUN useradd -s /bin/bash --uid $USER_ID --gid $GROUP_ID -m $USERNAME
RUN echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
RUN chmod 0440 /etc/sudoers.d/$USERNAME
RUN echo "source /usr/share/bash-completion/completions/git" >> /home/$USERNAME/.bashrc
RUN echo "if [ -f /opt/ros/${ROS_DISTRO}/setup.bash ]; then source /opt/ros/${ROS_DISTRO}/setup.bash; fi" >> /home/$USERNAME/.bashrc
