# Fedora 笔记

[返回索引](../README.md)

---

- 📒 Fedora常用命令

```bash
    dnf up
    dnf update
    dnf upgrade
    dnf repolist (查看仓库源)
    dnf autoremove
    dnf clean all
    dnf makecache
    dnf info [package]
    dnf search [package]
    dnf install [package]
    dnf remove [package]
    dnf list installed
    dnf remove —oldinstallonly  #删除旧内核
    dnf list installed | grep XXX #查看特定安装包
    dnf grouplist -v  #查看桌面环境列表，包括可下载安装的与已经安装的
    dnf remove @环境名  #删除桌面环境

    rpm -qa  #列出rpm包
    rpm -qa | grep [package]
    rpm -qi [package]  #查询已安装的包

    # 对比ubuntu
    apt-get search/ info/ install/ uninstall [package]
    apt-get update -y
    apt-get autoremove

    swapon —show (查看交换空间大小)
    cat /etc/fstab (查看空间配置)

# mac中查看自定义的快捷命令用:
    which -a [alias]
    # 但fedora中需要使用:
    type -f [alias]  #显示完整指令,mac通用
    type [alias]  #显示该指令的位置
```

- 📒 启动界面Grub配置

```bash
# 编辑配置
    sudo vi /etc/default/grub

# Grub是开机的BIOS快捷选项
    - GRUB_TIMEOUT=0  # 设为0秒跳过菜单
    - GRUB_DEFAULT=0  # 默认选择第一个选项
    - 更新配置: sudo grub2-mkconfig -o /boot/grub2/grub.cfg
```

- 📒 Fedora共享文件的方法

```bash
    #1. 首先确保安装了samba
        dnf info samba samba-client

    #2. 更改共享目录的权限
        chmod 777 [Shared]

    #3. 更改samba配置
        sudo vi /etc/samba/smb.conf

        # 增加内容如下:
        # 共享文件名称
        path = /home/felix/shared文件路径
        writable = yes
        browseable = yes
        guest ok = yes #如果需要用户密码为 no
        create mask = 0777
        directory mask = 0777

    #4. 启动samba服务:
        # 备注: smb用IP地址访问, nmb可以用hostname访问
        sudo systemctl start smb  # 启动命令
        sudo systemctl status smb  # 检查状态
        sudo systemctl restart smb  # 重启
        sudo systemctl enable smb  # 开机自动启动
        sudo systemctl enable nmb  # 开机自动启动

    #5. 更改防火墙配置:
        sudo firewall-cmd --permanent --add-service=samba
        sudo firewall-cmd --reload
        sudo firewall-cmd --list-all

        # 返回信息如下:
            FedoraWorkstation (default, active)
            target: default
            ingress-priority: 0
            egress-priority: 0
            icmp-block-inversion: no
            interfaces: wlp0s20f3
            sources:
            services: dhcpv6-client mdns samba samba-client ssh
            ports: 1025-65535/udp 1025-65535/tcp
            protocols:
            forward: yes
            masquerade: no
            forward-ports:
            source-ports:
            icmp-blocks:
            rich rules:

    #6. 设置 setenforce
            sudo setenforce 0  #临时测试, 连通后切换 1
            sudo setsebool -P samba_enable_home_dirs on #访问主目录权限
            sudo chcon -t samba_share_t [共享目录]

    #7. 更新smb服务器
            sudo systemctl restart smb
```

- 📒 桌面环境比较

```bash
    - Gnome
        # 内存占用率高（2.2G内存）,界面最美观。
    - Gnome-Xorg:
        # 即将淘汰的早期版本，占用资源和原生接近，不建议。
    - LXQt
        # 轻量版本，内存在用1.6G左右，复古界面，不建议。
    - LXDE
        # 比LXQt更轻量的版本。
    - Mate
        # 轻量版本，内存占用略高于LXQt，复古界面，不建议。

    - Budgie
        # 灵活性高，内存占用1.5G，界面定制后比较美观。推荐。

    - Openbox
        # 没有界面，直接使用终端，内存占用最低。

    - Cinnamon
        # Gnome3之前的衍生版本，内存略小于Gnome。界面还可以，低配置可以安装，但不如直接Gnome。

    - KDE
        # 内存占用较高2.7G，适合windows用户。
```
