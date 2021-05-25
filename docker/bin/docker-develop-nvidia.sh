#!/bin/bash
workspace_folder=$1
if [ -z "$1" ]
  then
    echo "Absolute path of the workspace folder not found"
    exit 1
fi
mode=$2
if [ -z "$2" ]
  then
    mode="it"
fi
xhost +
export LIBGL_ALWAYS_INDIRECT=1
nvidia-docker container run --rm -$mode \
  -e NVIDIA_DRIVER_CAPABILITIES=compute,utility,graphics \
  --gpus=all \
  --user $(id -u) \
  --workdir /home/ros \
  --mount type=bind,source="${workspace_folder}",target=/home/ros/catkin_ws \
  --name tsdf-plusplus-desktop-nvidia \
  --security-opt apparmor:unconfined \
  --net=host \
  --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/home/ros/.Xauthority:rw" \
  tsdf-plusplus-ros-desktop:v0.1 \
  bash



#/usr/bin/lxpanel --profile LXDE
#--gpus=all \
#--env="NVIDIA_DRIVER_CAPABILITIES=all" \
#export LIBGL_ALWAYS_INDIRECT=1
#--user $(id -u) \
#--workdir /home/ros \

