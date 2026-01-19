# homebrew

[website](https://brew.sh/)

[about_system/about_homebrew.md]

[返回索引](../README.md)

- 安装 : 官网复制sh的安装方式
- PATH : /opt/homebrew/bin/brew

    ```bash
    # 常用指令
    brew install ...
    brew update     #更新 brew 主程序
    brew autoremove
    brew cleanup
    brew upgrade    #brew upgrade-reset (强制更新,截止2025-06-28是version 4.5.8)
    brew info ...
    brew uninstall ...
    brew search ...
    brew home ...
    brew info ...
    brew list ...
    brew tap ...    #不在 homebrew上面的专属包, brew tap 查看已经记录的地址

    # 健康检查
    brew doctor     #健康检查
    brew missing    #查看缺失包依赖
    brew uses --installed --recursive ...  #查看安装包的依赖关系
        #如何有包依赖过期或者失效可以卸载不需要的工具或重新安装更新依赖关系
        brew reinstall ...
    ```

- 自动补全(zsh shell) :
    ```bash
    # >>> homebrew 自动补全(在cominit之前)
    if command -v brew >/dev/null 2>&1; then
        eval "$(brew shellenv)"
    else
        echo "[zshrc警告] 找不到 brew/homebrew"
    fi
    ```

---

### 📒 常用 Formula (命令行运行工具)

- [code2prompt](https://code2prompt.dev/docs/tutorials/getting_started/)

    ```bash
    # 代码转换为 AI 优化的提示, 查看文档
    code2prompt <my-app> -O <JSON>
        # --include "_.json, _.html" --exclude "node_modules/"
        # -i <include> -e <exclude>
    ```

- fastfetch

    ```bash
    # 终端显示系统信息
    ```

- mactop

    ```
    终端查看系统资源使用率(必须用sudo mactop运行)
    ```

- portaudio

    ```
    # PortAudio 是一个免费、跨平台、 开源的音频 I/O 库。它允许您使用 C 或 C++ 编写简单的音频程序，这些程序可以在包括 Windows、Macintosh OS X 和 Unix（OSS/ALSA）在内的多个平台上编译和运行。它旨在促进不同平台开发者之间的音频软件交流。许多应用程序都使用 PortAudio 进行音频 I/O

    # 安装agent-seek时安装,TTS语音
    ```

- fanyi (弃用, 采用 translate-shell)

    ```
    终端的翻译工具
    ```

- translate-shell

    ```bash
    # 超级强大的百多种语言翻译表
      trans word / trans en:zh word / trans :zh word
      trans -shell : 交互式翻译
      trans '<多行文本>' : trans -b (brief, 简明翻译)
      trans -play : 发音
    ```

- QLMarkdown

    ```bash
    # macOS快速预览md文件
    qlmarkdown_cli --help
    ```

- gh (GitHub-Cli)

    ```bash
    brew install gh
    gh extension install github/gh-copilot
    ```

- fd

    ```bash
    # 代替find . -name "\*" -print的工具,基本用法
      fd <name>
      fd -l <name> #列出详细
      fd -e <扩展名> <name> #按扩展名查找
      fd -H <name>
    ```

- micro

    ```bash
    # 终端的编辑器
    # 常用命令
    ctl + g:帮助 | +q 退出 | +s 保存 - opt + g: 快捷 - ctl + e: 设置菜单 >set: set colorscheme 主题设置(常用主题: gruvbox/simple/geany)
    ```

---

### 📒 常用 Cask

```bash
- Godot

- Blender

- GDevelop

- gb-game (GB掌机游戏制作器)

- Flutterflow (可视化flutter构建工具)

- Coteditor (MacOS好用的文本编辑器, 推荐)

- folo (下一代信息浏览器, 集成所有订阅的开源阅读器, 推荐)

- Obsidian (跨设备同步笔记/发布博客等)

* LLM-本地AI工具
    - Ollama-app //自动安装cli
    - lm-studio
    - ComfyUI
    - Chatgpt
    - Cursor
    - Figma
    - Langflow
    - Amazon-q: 同时安装命令行工具, 可自动补全
    - deepchat
    - chatbox
    - jan
    - draw-things

* 其他工具
    - macdown : 开源markdown工具
    - QLmarkdown : macos的quicklook md文件
    - quicklook
    - coteditor : mac开源轻量文本编辑器
    - Lunarbar : 农历日历
    - Lunar : 同步双显亮度,好用
    - chromedriver : 安装agent-seek时要求安装 查看文档
    - brave-browser
      #zen : 开源浏览器(基于firefox)

* 管理工具
    - miniconda
    - podman-desktop
    - container : mac开源轻量容器
    - gh: github-cli
      `brew install gh && gh auth login`
      #Orbstack : 付费好用的macOS容器

* IDE
    - visual-studio-code
    - zed
    - lapce
    - void //基于vscode-cursor开源替身
    - onlook
    - warp : 现代终端
    - wechatwebdevtools : 微信开发者工具

* VPN
    - clash-verge-rev : VPS
    - stash : VPS需研究
```
