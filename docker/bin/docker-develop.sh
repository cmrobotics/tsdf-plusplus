#!/bin/bash
workspace_folder=$1
if [ -z "$1" ]
  then
    echo "Absolute path of the workspace folder not found"
    exit 1
fi
command=$2
if [ -z "$2" ]
  then
    command="nvidia-docker"
fi
mode=$3
if [ -z "$3" ]
  then
    mode="it"
fi
xhost +
export LIBGL_ALWAYS_INDIRECT=1
$command container run --rm -$mode \
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
  --entrypoint bash \
  tsdf-plusplus-ros-desktop:v0.1