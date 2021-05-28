FROM ros:kinetic-ros-base

RUN apt-get update && apt-get install -y libeigen3-dev libpcl-dev libsuitesparse-dev
RUN apt-get update && apt-get install -y ros-kinetic-tf ros-kinetic-pcl-ros
RUN rm -rf /var/lib/apt/lists/*

COPY ./ /root/horizon_ws/src/horizon_highway_slam/
COPY ./compiled_entrypoint.sh /entrypoint.sh

RUN /bin/bash -c '. /opt/ros/kinetic/setup.bash; cd /root/horizon_ws; catkin_make'

ENV BAGNAME 8_Shape_Path
ENV IMU 2

ENTRYPOINT [ "./entrypoint.sh" ]
