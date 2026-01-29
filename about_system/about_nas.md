# NAS 笔记

[返回索引](../README.md)

---
- NAS (WD OS-5) 基本信息
    - 一般采用 Debian11系统, BusyBox ash

- 基础操作
    - `echo $SHELL`, 一般是 /bin/sh
    - `uname -a`, 查看基本系统信息
    - `df -h`, 以人类可读显示硬盘信息
    - `cat /proc/cpuinfo | head -n 40`, 查看基本系统信息
    - `echo $LANG`
    - `echo $LC_ALL`
    - `locale` , 查看语言
    - `echo $TERM`, 查看终端类型
