#! /bin/bash
#echo 1 | sudo -S chrt 10 bash
source /opt/ros/noetic/setup.bash
source /home/zxw/catkin_ws/devel/setup.bash
cd /home/zxw/catkin_ws && roslaunch elfin_robot_bringup elfin_ros_control.launch
