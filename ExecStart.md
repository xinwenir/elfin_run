# 在 Ubuntu 20.04 中，你可以使用 systemd 来设置开机自启动。以下是一个将 xx.sh 脚本设置为开机自启动的示例：

## 1. 创建一个名为 `xx.service` 的服务文件，该文件用于描述你要启动的脚本：

        sudo nano /etc/systemd/system/xx.service


- 在编辑器中添加以下内容：

        [Unit]
        Description=My xx script

        [Service]
        ExecStart=/path/to/xx.sh
        Restart=always
        User=your_username

        [Install]
        WantedBy=multi-user.target


- 请确保将 `ExecStart` 替换为你要运行的脚本的完整路径，将 `User` 替换为你要运行脚本的用户名。此示例中，`Restart` 设置服务在崩溃或退出时自动重新启动，`WantedBy` 将此服务添加到启动目标中。

## 2. 重新加载 systemd 并启用服务：

        sudo systemctl daemon-reload
        sudo systemctl enable xx.service

## 3. 启动服务：

        sudo systemctl start xx.service

## 4. 验证服务是否正在运行：

        sudo systemctl status xx.service


- 如果服务正在运行，你应该看到类似于以下内容的输出：


> ● xx.service - My xx script
>      Loaded: loaded (/etc/systemd/system/xx.service; enabled; vendor preset: enabled)
>      Active: active (running) since Mon 2021-09-27 16:45:44 UTC; 2s ago
>    Main PID: 1234 (xx.sh)
>       Tasks: 1 (limit: 1074)
>      Memory: 2.9M
>      CGroup: /system.slice/xx.service
>              └─1234 /bin/bash /path/to/xx.sh

- 现在，当你重启 Ubuntu 20.04 时，脚本将自动启动。