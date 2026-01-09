# homebrew 笔记

---

- 安装 : 官网复制sh的安装方式
- PATH : /opt/homebrew/bin/brew
- 常用指令

```bash
  brew install …
  brew update (更新brew)
  brew updated
  brew autoremove
  brew cleanup
  brew upgrade … : brew upgrade-reset (强制更新,截止2025-06-28是version 4.5.8)
  brew info …(—cask)
  brew uninstall …
  brew search ... // 搜索包
  brew home ... // 打开包的官网
  brew info ...
  brew list ...
  brew tap <package> : 不再brew上面的专属包, brew tap 查看已经记录的地址
```

---

### 📒 常用 Formula

- node
- uv
- code2prompt
  代码转换为 AI 优化的提示, 查看文档
    ```bash
          code2prompt <my-app> -O <JSON>
          # --include "_.json, _.html" --exclude "node_modules/"
          # -i <include> -e <exclude>
    ```
- fastfetch  
  终端显示系统信息

- mactop  
  终端查看系统资源使用率(必须用sudo mactop运行)

- portaudio  
  安装agent-seek时安装,TTS语音

- fanyi (弃用)  
  终端的翻译工具

- translate-shell  
  超级强大的百多种语言翻译表
    ```bash
      trans word / trans en:zh word / trans :zh word
      trans -shell : 交互式翻译
      trans '<多行文本>' : trans -b (brief, 简明翻译)
      trans -play : 发音
    ```
- QLMarkdown  
  macOS快速预览md文件  
  `qlmarkdown_cli --help`

- gh ( GitHub-Cli )

```bash
  brew install gh
  gh extension install github/gh-copilot
```

- fd  
  代替find . -name "\*" -print的工具,基本用法
    ```bash
      fd <name>
      fd -l <name> #列出详细
      fd -e <扩展名> <name> #按扩展名查找
      fd -H <name>
    ```
- micro  
  终端的编辑器  
  常用命令
    ```bash
    ctl + g:帮助 | +q 退出 | +s 保存 - opt + g: 快捷 - ctl + e: 设置菜单 >set: set colorscheme 主题设置(常用主题: gruvbox/simple/geany)
    ```

---

### 📒 常用 Cask

- Godot
- Blender
- GDevelop
- gb-game : GB掌机游戏制作器
- Flutterflow : 可视化flutter构建工具
- Coteditor : MacOS好用的文本编辑器
- folo : 下一代信息浏览器, 集成所有订阅的开源阅读器,推荐
- Obsidian : 跨设备同步笔记/发布博客等

* LLM-本地AI工具 \
    - Ollama-app //自动安装cli
    - lm-studio
    - ComfyUI
    - Chatgpt
    - Cursor
    - Figma
    - Langflow
    - Amazon-q: 同时安装命令行工具, 可自动补全 \
      //deepchat \
      //chatbox \
      //jan \
      //draw-things

* 其他工具
    - macdown : 开源markdown工具
    - QLmarkdown : macos的quicklook md文件
    - quicklook
    - coteditor : mac开源轻量文本编辑器
    - Lunarbar : 农历日历
    - Lunar : 同步双显亮度,好用
    - chromedriver : 安装agent-seek时要求安装 查看文档
    - brave-browser \
      #zen : 开源浏览器(基于firefox)

* 管理工具
    - miniconda
    - podman-desktop
    - container : mac开源轻量容器
    - gh: github-cli \
      `brew install gh && gh auth login` \
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
