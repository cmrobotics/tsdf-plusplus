FROM ros:noetic-ros-core AS base

# Install dependeinces
RUN apt update
RUN apt install -y build-essential python tree vim \
    git python3-pip libboost-all-dev ros-noetic-eigen-conversions \
    ros-noetic-rviz ros-noetic-rosbash ros-noetic-rqt-tf-tree \
    ros-noetic-tf-conversions libpcl1 sudo \
    && rm -rf /var/lib/apt/lists/*
RUN pip install -U wstool

# Create 'ros' user with sudo powers
ARG USERNAME=ros
ARG USER_UID=1001
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
  && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
  && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
  && chmod 0440 /etc/sudoers.d/$USERNAME \
  && echo "source /usr/share/bash-completion/completions/git" >> /home/$USERNAME/.bashrc \
  && echo "if [ -f /opt/ros/${ROS_DISTRO}/setup.bash ]; then source /opt/ros/${ROS_DISTRO}/setup.bash; fi" >> /home/$USERNAME/.bashrc

USER $USERNAME
WORKDIR /home/$USERNAME

# Create workspace and cloning project
RUN mkdir -p $HOME/tsdf-plusplus_ws/src
RUN bash -c 'source /opt/ros/noetic/setup.bash && \
    cd $HOME/tsdf-plusplus_ws && catkin_make && \
    source devel/setup.bash && \
    git clone https://github.com/ethz-asl/tsdf-plusplus $HOME/tsdf-plusplus_ws/src/tsdf-plusplus'

# Build project
RUN bash -c 'source /opt/ros/noetic/setup.bash && \
    cd $HOME/tsdf-plusplus_ws && \
    source devel/setup.bash && \
    wstool init src src/tsdf-plusplus/tsdf_plusplus_https.rosinstall && \
    catkin_make_isolated --cmake-args -DCMAKE_BUILD_TYPE=Debug -DCATKIN_ENABLE_TESTING=ON'
