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
docker container run --rm -$mode \
  --mount type=bind,source="${workspace_folder}",target=/home/ros/catkin_ws \
  --name tsdf-plusplus-desktop \
  --net=host \
  --env="DISPLAY" \
  --volume="$HOME/.Xauthority:/home/ros/.Xauthority:rw" \
  tsdf-plusplus-ros-desktop:v0.1 \
  bash

#--user $(id -u) \
#--workdir /home/ros \
