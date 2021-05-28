#!/bin/bash

source /root/horizon_ws/devel/setup.bash

rosbag record /laser_cloud_surround -O "/root/shared_dir/${BAGNAME}_slammed.bag" &

roslaunch horizon_highway_slam horizon_highway_slam.launch BagName:="${BAGNAME}.bag" IMU:=${IMU}

chmod a+rw "/root/shared_dir/${BAGNAME}_slammed.bag"

PCD_FOLDER="/root/shared_dir/${BAGNAME}_pcd"

mkdir -p ${PCD_FOLDER}

roscore &

sleep 5

rosrun pcl_ros bag_to_pcd "/root/shared_dir/${BAGNAME}_slammed.bag" /laser_cloud_surround ${PCD_FOLDER}

chmod a+rw -R ${PCD_FOLDER}
