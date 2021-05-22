#!/bin/bash
sudo apt install -y ros-foxy-pcl-conversions
git clone --single-branch --branch ros2 git@github.com:cmrobotics/voxblox.git || git clone --single-branch --branch ros2 https://github.com/cmrobotics/voxblox.git
