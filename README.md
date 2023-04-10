# elfin_run
This Document is a **bash** execution Guide for the driver of **Elfin Arm** in **UP Squared 6000**.

## Files in the folder "logs" are the log of "bash" execution.

## Download from github

- Using git clone:
    git clone https://github.com/xinwenir/elfin_run.git /home/<Your Name>

- Stored in the device power-on boot command:

    cd <YOUR PATH OF ELFIN_RUN>
    ./elfin_run.sh

- or

    /home/<Your Name>/elfin_run/elfin_run.sh

## elfin_run
- #! is a convention token that tells the system what interpreter is needed for this script to execute, i.e. which Shell to use. 
- Note: in this case, we use "bash".
- nohup Closing the current session will not interrupt the program and can be terminated by commands such as kill.
- example:
    nohup command > output.log 2>&1 &
- where 2>&1 is used to redirect standard error 2 to standard output 1. The & before 1 is to allow bash to interpret 1 as standard output instead of file 1. And the last & is to allow bash to execute in the background.

- NOTE: IF YOUR ROS VERSION IS **melodic**, YOU SHOULD CHENGE **noetic** TO **melodic**!!
- Modify **elfin_run.sh** so that it works for your device:

    #! /bin/bash
    nohup /home/<Your Name>/elfin_run/elfin_t1.sh > /home/<Your Name>/elfin_run/logs/elfin_t1.log 2>&1 &
    sleep 10s
    nohup /home/<Your Name>/elfin_run/elfin_t2.1.sh > /home/<Your Name>/elfin_run/logs/elfin_t2.log 2>&1 & 
    sleep 20s
    nohup /home/<Your Name>/elfin_run/elfin_t3.sh > /home/<Your Name>/elfin_run/logs/elfin_t3.log 2>&1 &
    sleep 30s
    nohup /home/<Your Name>/elfin_run/elfin_t4.sh > /home/<Your Name>/elfin_run/logs/elfin_t4.log 2>&1 &

- Modify **elfin_t1.sh** so that it works for your device: 

    #! /bin/bash
    source /home/<Your Name>/catkin_ws/devel/setup.bash
    cd /home/<Your Name>/catkin_ws && roslaunch elfin_robot_bringup elfin5_bringup.launch

- Modify **elfin_t2.1.sh** so that it works for your device: 

    #! /bin/bash
    sudo chrt 10 /home/<Your Name>/elfin_run/elfin_t2.sh

- Modify **elfin_t2.sh** so that it works for your device: 

    #! /bin/bash
    #echo 1 | sudo -S chrt 10 bash
    source /opt/ros/noetic/setup.bash
    source /home/<Your Name>/catkin_ws/devel/setup.bash
    cd /home/<Your Name>/catkin_ws && roslaunch elfin_robot_bringup elfin_ros_control.launch

- Modify **elfin_3.sh** so that it works for your device: 

    #! /bin/bash
    source /home/<Your Name>/catkin_ws/devel/setup.bash
    cd /home/<Your Name>/catkin_ws && roslaunch elfin5_moveit_config moveit_planning_execution.launch

- Modify **elfin_t4.sh** so that it works for your device: 

    #! /bin/bash
    source /home/<Your Name>/catkin_ws/devel/setup.bash
    cd /home/<Your Name>/catkin_ws && roslaunch elfin_basic_api elfin_basic_api.launch
