# Requirements

This is a tutorial that explains how to set up and run `TSDF-plusplus` using Docker
so that you can easily and quickly get up and running productively.

This tutorial relies in Docker, and specifically, that you have set up your
development environment in docker as described in [Docker README.md](../docker/README.md)
If you haven't, get yourself set up before proceeding.

Specifically, this tutuorial assumes you have your computer able to run: `./bin/docker-develop-nvidia.sh <ABSOLUTE_PATH_OF_CATKIN_WS>`
in docker folder. Once in the docker machine, you will require to be able to run a successful build:
```
catkin build tsdf_plusplus_ros rgbd_segmentation mask_rcnn_ros cloud_segmentation
```
This should run without problem if the setup is successful.

## Voxblox verification

The first step will be to launch `Voxblox`, the core mapping framework `TSDF-plusplus` relies on.
See [Voxblox documentation](https://voxblox.readthedocs.io/en/latest/index.html) for details.

First step, which is common thoughout this tutorial is to run `./bin/docker-develop-nvidia.sh <ABSOLUTE_PATH_OF_CATKIN_WS>`.
Once you are in the docker machine run:

```bash
mkdir /home/ros/catkin_ws/bags
wget http://robotics.ethz.ch/~asl-datasets/iros_2017_voxblox/data.bag /home/ros/catkin_ws/bags
sed -i 's/\/path\/to\/data.bag/\/home\/ros\/catkin_ws\/bags\/data.bag/g' /home/ros/catkin_ws/src/voxblox/voxblox_ros/launch/cow_and_lady_dataset.launch
roslaunch voxblox_ros cow_and_lady_dataset.launch
```


http://robotics.ethz.ch/~asl-datasets/iros_2017_voxblox/voxblox_cow_extras.zip
```bash
roslaunch voxblox_ros cow_and_lady_dataset.launch

```