#!/bin/bash

echo "Launching horizon_highway_slam:latest"

mkdir -p $HOME/shared_dir

docker run \
    -it \
    --rm \
    --volume=$HOME/shared_dir:/root/shared_dir:rw \
    --net=host \
    --env BAGNAME="${1:-8_Shape_Path}" \
    --env IMU="${2:-2}" \
    horizon_highway_slam:latest

if command -v pcl_viewer >/dev/null; then
    pcl_viewer $HOME/shared_dir/${1:-8_Shape_Path}_pcd/*
else
    echo "pcl_viewer not found. Install with \`sudo apt-get install pcl-tools\`."
fi
