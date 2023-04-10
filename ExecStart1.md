# 设置开机自启动
## 1、建立rc-local.service文件

        sudo vim /etc/systemd/system/rc-local.service

## 2、输入如下内容

        [Unit]
        Description=/etc/rc.local Compatibility
        ConditionPathExists=/etc/rc.local
     
        [Service]
        Type=forking
        ExecStart=/etc/rc.local start
        TimeoutSec=0
        StandardOutput=tty
        RemainAfterExit=yes
        SysVStartPriority=99
     
        [Install]
        WantedBy=multi-user.target


## 3、创建rc.loca

        sudo vim /etc/rc.local


## 4、输入如下内容

        #!/bin/sh 
        #
        # rc.local
        #

        echo "自启动成功" > /usr/local/test.log
        # 这里写要自动运行的命令或者脚本   


        exit 0


## 5、添加rc.local可执行权限

        sudo chmod +x /etc/rc.local


## 6、启动服务

        sudo systemctl enable rc-local


## 7、启动服务查看启动状态

        sudo systemctl start rc-local.service
        sudo systemctl status rc-local.service

- NOTE: 如果这里启动失败了需要回头更改rc.local文件, 把第一行改为#!/bin/bash

## 8、重启，若在/usr/local下能够看到 test.log文件说明自启动已经成功了！