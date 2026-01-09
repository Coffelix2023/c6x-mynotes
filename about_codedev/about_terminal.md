## Terminal 终端笔记

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
```
