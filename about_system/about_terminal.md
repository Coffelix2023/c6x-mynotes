## Terminal 终端笔记

[返回索引](../README.md)

### 📒 常用规则

```bash
# Shell 变量赋值语法规则
    "=" : 前后不加空格, 后面加双引号定义
    "${VAR}" : 自定义变量推荐加{}
    别名的两种定义形式:
        - alias [name]="[cmd]"
        - [func]() {...}

# vi 快捷操作
    esc: 确保不在insert模式
    dd: 删除整行
    u: 撤销上一步
    gg: 移动到首行
    shift+g : 移动到尾行
    yy: 复制当前行
    p: 粘贴到下一行, shift+p 粘贴到上一行
    ctl+w: 删除上个单词

```

---

### 📒 MacOS-SHELL

```bash
# Bash
  系统自带 : /bin/bash
  安装(不推荐) : `brew install bash`
  powershell: windows终端工具
# Zsh
  系统自带 : /bin/zsh
  安装(不推荐) : `brew install zsh`
  zsh_config:
    - .zshenv : 最优读取, 存放全局变量定义
    - .zprofile : 登录读取, 存放PATH/Conda 等
    - .zshrc : 交互式, 存放别名

# mac中查看自定义的快捷命令用 `which -a <alias>`即可, 但fedora中需要使用:
  type -f <alias> : 显示完整指令,mac通用
  type -a <alias> : 显示该指令的位置
```

### 📒 常用命令

```bash
- curl
  macOS默认安装 : /usr/bin/curl
- man
  man <commander> 查看某个包或程序的manual, Q退出
- unzip
  macOS默认安装 : /usr/bin/unzip
- winget
  windows获取工具
- wget
  默认安装: /opt/homebrew/bin/wget
- eval
  eval "$(…)" // 动态执行生成的配置文本
- apt
  Linux获取工具
- tree
  brew install tree // 树状目录结构
  /opt/homebrew/bin/tree
- dua
  dua -cha -d 1 # 查看当前目录的体积大小 -h为人类阅读,-d 是1级目录
- make
  默认安装 : /usr/bin/make
- ✅解决安装包损坏的方法
  xattr -d 'com.apple.quarantine' <yourApp>
- sw_vers
  显示mac系统版本信息
- 查找文件

  find <目录> -name "<文件名>" -type <f/r> -print/delete, 示例:
  find . -name ".*" -type f -print #列出当前目录下的.*文件, 删除使用-delete

- find <path1> <path2> -iname "_name_" # 文件和目录搜索
  sudo find ~/.cache ~/.local/ ~/.config/ ~/Library/Preferences -iname "_llama_"
- grep -rilE "<NAME1>|<NAME2>" <PATH2>'space'<PATH2> # 关键词内容搜索 \* -r : 递归目录, -i : 忽略大小写, -l : 只显示文件名, -E : 支持正则表达式"|"
  grep -rilE "替换成名称" ~/.cache ~/.local/ ~/.config/ ~/Library/Preferences
- 查询当前IP地址
  curl ipinfo.io : 获取实际IP
  curl ipinfo.io/country : 只显示国家
  curl ifconfig.co/json : 获取当前IP(可能是虚拟的)
  curl ifconfig.co/country : 只显示国家

scutil --nwi : 获取当前Network information

- 判断网络连通性
  安装speedtest
  brew tap teamookla/speedtest
  brew install speedtest
  安装fast-cli
  pnpm install -g fast-cli

- huggingface_hub
    - HF的仓库,上传和下载
    - 保存目录 : /Volumes/FELIX-APFS/LLM/huggingface_hub
- hf (huggingface-cli已弃用)
    - 安装: uv pip install -U huggingface_hub | uv pip install hf_transfer  #加速下载
        hf version 验证
        hf auth whoami | list

    - 使用hf (Alias)下载模型
        hf login My-API-key
        hf upload "<model>"
        hf download "例子: OuteAI/Llama-OuteTTS-GGUF"
    - 缓存: <点击查看帮助文档>
        <CACHE_DIR>
            ├─ <MODELS>
            ├─ <DATASETS>
            │  ├─ refs
            │  ├─ blobs
            │  ├─ snapshots
            ├─ <SPACES>

- Git版本管理器
    - PATH
        /opt/homebrew/bin/git  // 优先PATH
        /usr/bin/git
    - 常用命令
        git init
        git status
        git add . / add -A
        git commit -m "<notes>"

- OpenSSL
    #密码生成
    openssl list -commands : 列出命令参数
    openssl list -standard-commands : 列出常规命令参数
    openssl list -digest-commands : 列出数字命令
    openssl list -cipher-commands : 列出密码命令
    openssl rand <commander> : 随机生成, 不加command随机任意符号字母
    openssl rand -hex 16 : 生成32位数字英文混合密码, 32以上可用作tokens
    openssl rand -base64 32
    openssl rand -base64 64 | head -c10 : 或者指定长度10
    openssl rand -base64 32 | tr -dc 'A-Za-z0-9_' : 指定排除引号以外的符号

- lla
    安装: brew install lla
    ls 命令的升级版

- rsync : 官网文档
    文件管理系统, 可以替代cp / mv / rm , 示例:
        rsync -ah --progress <source.file> <target.file>
            # -a: achive, 归档模式, 递归文件结构属性与权限
            # -h: 人类可识别的传输数据表达方式
            # --stats : 传输完成后显示信息
            # --progress 显示每个文件进度
            # --info=progress2 : 显示整体进度, 例如:
                rsync -avh --info=progress2 <source> <destination>
        参数:
            -v : 显示详细信息
            --exclude : 排除特定文件(--exclude="*.log")
            --exclude-from=<file.txt>
- 局域网传输举例:
    rsync -ah --progress felix@192.168.0.121:/home/felix/... ~/Downloads

- 查看进程PID (ProcessID)
    # ps (Process-Status): 列出系统进程
        ps -ef | grep [关键词]
        ps ax | grep [关键词]
    # pgrep (精准匹配进程并返回PID) 更推荐使用.
        pgrep -alf [关键词]
            -a 显示完整命令
            -f 匹配完整命令行
            -L 列出进程名
        pgrep ssh #直接显示PID, 但没有详细信息

- Jupyter lab的安装
    pip install jupyterlab
    jupyter lab --generate-config  #生成配置py, 以下是py中常用参数
        c.ServerApp.ip = '0.0.0.0'          # 监听所有网卡
        c.ServerApp.port = 8888             # 默认端口
        c.ServerApp.open_browser = False    # 服务器启动后不自动打开浏览器
        c.ServerApp.allow_root = True       # 允许 root 用户启动（仅在容器或特权模式下用）
        c.ServerApp.root_dir = '/home/youruser/work'  # 改成你想的路径, 默认是~/.jupter/...
        c.ServerApp.password = 'sha1:xxxxxx'  # 用生成的哈希替换
    jupyter lab password  #生成hash密码(可能需要jupyter server --generate-config )

- Canda/Mamba
    # 创建环境
    conda create -n <env-name> -python=3.12
    mamba create -n <env-name> python=3.12 -y

    # mamba命令
        mamba list <package>  #搜索已经安装的包
        mamba search <package>  #搜索可安装的包
        mamba install -y <package>  #安装并选择yes
        mamba uninstall <package>  #删除包
```

---

- 备份

```bash
defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'

via Conda
[ roop ]@ condo activate env-faceswap
python run.py --execution-provider coreml
installation question
conda install pytorch torchvision torchaudio -c pytorch
conda install -c conda-forge [xxx] (包含更多软件包)

[ faceswap ]@ condo activate deepfake


conda clean —all
conda clean -a
# 清除缓存

conda install pytorch torchvision torchaudio -c pytorch
conda install -c conda-forge [xxx] (包含更多软件包)

# [vpnc install]
root用户：sudo -i
IPSec gateway tw.us.flow.host
IPSec ID home
IPSec secret [***]
Xauth username [username]
Xauth password [***]

# 终端格式化
diskutil list
diskutil eraseVolume FAT32 NAME /dev/diskxxx

# [windows]
安装vnc
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# [Nuke]
拾取工程文件名称
    # [python {os.path.basename(nuke.root().name()).split(".")[0]}]
    # [file rootname [file tail [value root.name]]]

# [Ubuntu 显卡驱动相关]
# 罗列驱动：
ubuntu-drivers devices
ubuntu-drivers list

# 删除：
sudo apt-get remove ...
卸载驱动：sudo apt purge ...

# 如果附加驱动不能正确选择：
sudo ubuntu-drivers autoinstall
编辑 /etc/modprobe.d/blacklist-nouveau.conf 文件，末行添加
blacklist nouveau


blender -b /path.blender -s 1001 -e 1100 -a -t 12
用12线程渲染制定文件


b293 /Volumes/XYM_2T/TNK0130_Felix2T/BLENDER/GoundSplash_render_PS_EVE_v001.blend -b -a
b293 /Volumes/XYM_2T/TNK0130_Felix2T/BLENDER/GoundSplash_render_S_EVE_v001.blend -b -a

```
