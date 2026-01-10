## RunPod 笔记

[返回索引](../README.md)

### 📒 局域网连接Fedora Jupyter的方法

```bash
# Fedora启用ssh

    需要设置 firmwall-cmd | systemctl

# Mac端连接jupyterlab

    * 直连系统:
        ssh [name]@192.168.0.xxx
    * 隧道端口:
        ssh -fNL 3000:localhost:3000 [name]@192.168.0.xxx # 8888是jupyter

        -[说明] -f: 后台运行SSH | -N: 不执行远程,仅端口转发 | -L: 本地3000转发端口3000
        -[查看后台PID] pgrep -f "ssh.*3000.*192.168.0.xxx"
        -[结束进程] kill [PID] or pkill -f "ssh.*3000.*192.168.0.xxx"
    * 最佳实践: 进入jupyter后启动comfy
```

### 📒 GPU配置与调试 记录

```bash
- Network-Volume地区选择: EU-RO-1.
- pod初始化使用时间: 3-6 mins.
- 网络卷(Network Volume): 🇺🇸10.5/150G/mo (150G每月75元)

- 1️⃣: RTX 4000 | 🇺🇸 0.26/hr (2元每小时)
    - 配置: ⚙显存 20G ⚙内存 50G ⚙CPU 9
    - 测试01-Fast: Wan2.2-image2video + Lora (720\*576)
      🚦首次加载unet/clip/vae/lora等:
      🚦采样:
      ✅ 合计:

- 2️⃣: RTX 4090 | 🇺🇸 0.69/hr (5元每小时)
    - 配置: ⚙显存 24G | ⚙内存 48G(DDR6) | ⚙CPU 6
    - 测试01-Fast: Wan2.2-image2video + Lora (720\*576)
      🚦首次加载unet/clip/vae/lora等: 43+44+17.6+2+3+5+4‎ = 118.6s
      🚦采样: 34+31‎ = 65s
      ✅ 合计: 3 mins

- 3️⃣: RTX 5090 | 🇺🇸 0.89/hr (6.5元每小时)
    - 配置: ⚙显存 32G | ⚙内存 92G | ⚙CPU 16
    - 测试01-Fast: Wan2.2-image2video + Lora (720\*576)
      🚦首次加载unet/clip/vae/lora等: 43+44+17.6+2+3+5+4‎ = 118.6s
      🚦采样: 30+23‎ = 65s
      ✅ 合计: 3 mins
```

### 📒 Pod配置与命令(ubuntu)

- 注意:
    - /etc/bash/.bashrc是系统级配置
    - /root/.bashrc是用户级配置
- 环境变量配置(创建Pod时设定 Environment Variables)
    - HF_HOME: /workspace/cache/huggingface_hub/
    - HF_TOKEN
    - POD_API_KEY:
- 传输
    - 通过runpodctl进行传输:

    ```bash
      runpodctl get pod
      runpodctl start/stop pod [pod-ID]
      runpodctl send [file] #pod终端中粘贴recieve命令
      runpodctl ssh list-keys #列出sshkey($HOME/.ssh/id_ed25519.pub)
    ```

- 访问: https://[POD_ID]-[PORT].proxy.runpod.net

- 目录结构配置:
    - 主目录存放在临时容器(速度快)
        - COMFY_DIR="/home/ComfyUI"
    - custom_nodes
        - NODES_DIR="/home/ComfyUI/custom_nodes"
        - venv和依赖存放临时容器
            - COMFY_ENV="${COMFY_DIR}/.venv/bin/activate"
        - 输入输出目录存放持久卷
            - EXTRA_DIR="/workspace/app/extra_comfy"
            - user: 备份在/workspace/app
- Remote SSH 连接
    - 验证

    ```bash
    # 编辑服务器文件
    $HOME/.ssh/config
    # 示例
    Host [string]
    HostName [ip_address]
    User root
    Port 25920
    IdentityFile ~/.ssh/id_ed25519

    #查看ssh-key
    ssh-keygen -t ed25519
    初始生成ssh: ssh-keygen -t ed25519 -C "常用邮箱地址"
    ```

    - 终端连接方法

    ```bash
    ssh root@ip_address -p 17521 -i ~/.ssh/id_ed25519
    # 这是pod直接提供的ssh地址
    # 终端输入直接连接
    ssh -L 8888:localhost:8888 root@ip_address -p 17521 -i ~/.ssh/id_ed25519
    # 即:在ssh over exposed TCP 的ssh
    ```

### 📒 Cloudflare设置

`cloudflared tunnel --url <comfy-localhost>`

comfy中, 主机port设置为经过cloudflare隧道的地址(不包含http://)

```bash
# Network Volume设置
    S3 API操作
    # Buket name: lu32bps947
    # endpoint URL: https://s3api-us-ca-2.runpod.io
    # access_key_id: [secret_access_key]
    # 示例
    aws s3 ls --region us-ca-2 \
                --endpoint-url [rul]
```

- Rclone: 操作network-volume
    - 安装: brew install rclone
    - 用法:
        - rclone config #交互式配置

- 通过VScode Remote SSH 访问 pod(文档链接)

- 复制 pod 的 SSH over exposed TCP
    - 示例: ssh root@[ip_address] -p [port] -i ~/.ssh/id_ed25519

- 修改 $HOME/.ssh/config, 添加ssh信息如下:

```bash
  Host c6x-5090X2 #自定义名称
  HostName [ip_adress] #暴露的端口
  User root
  Port 25920
  IdentityFile ~/.ssh/id_ed25519
```
