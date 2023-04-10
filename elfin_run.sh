#! /bin/bash
nohup /home/zxw/elfin_run/elfin_t1.sh > /home/zxw/elfin_run/logs/elfin_t1.log 2>&1 &
sleep 10s
#./elfin_t2.sh & 
nohup /home/zxw/elfin_run/elfin_t2.1.sh > /home/zxw/elfin_run/logs/elfin_t2.log 2>&1 & 
sleep 20s
nohup /home/zxw/elfin_run/elfin_t3.sh > /home/zxw/elfin_run/logs/elfin_t3.log 2>&1 &
sleep 30s
nohup /home/zxw/elfin_run/elfin_t4.sh > /home/zxw/elfin_run/logs/elfin_t4.log 2>&1 &
