<h1 id="markdown-top">Markdown 笔记</h1>

[about_development/about_languages/about_md.md]

[返回索引](../../README.md)

---

<h2 id="md-editor">常用 Markdown 编辑器</h2>

- 🔘 vscode / zed

    ```bash
    # 对于目录组织结构的md文档群很方便,zed非常快捷
    # 优势:
        - vscode有大量markdown插件
        - zed采用 marksman 作为语言服务器,同时 Lint 和 format
        - IDE中编辑的优势是可以随时 git push
    ```

- 🔘 [MarkEdit](https://github.com/MarkEdit-app/MarkEdit)( MacOS 单文件编辑首选)

    ```bash
    # Mac上的快捷 markdown 编辑器,像文本编辑器一样简单
    # installtion
        brew install markedit
    ```

- 🔘 [Coteditor](https://coteditor.com/) (MacOS 其他类型文档编辑器首选,包括编写代码)

    ```bash
    # 专为 macOS 设计的轻量级纯文本编辑器。该项目旨在为所有人提供一款通用的纯文本编辑器，并配备直观的 macOS 原生用户界面.
    # installation
        brew install coteditor
    ```

- 🔘 [markdownload](https://github.com/deathau/markdownload) (firfox/chrome插件)

    ```bash
        # 一款适用于 Firefox 和 Google Chrome 的扩展程序，用于剪辑网站并将其下载为可读的 Markdown 文件
    ```

- 🔘 [glow](https://github.com/charmbracelet/glow)

    ```bash
    # 命令行界面渲染markdown
    # 也可用于终端预览其他文档, 可替代 cat, 得到美观的阅读体验
    # installation
        brew install glow
        glow FILE
        glow -s [dark | light]
        glow -p(--pages) FILE  #按man方式查看
    ```

- 🔘 其他工具

    ```bash
    # 大部分经过短期和长期测试后弃用, 最终锁定:
        Multi-Markdowns: Zed Editor (MacOS)
        Single-Mardown: MarkEdit (MacOS)
    ```

    - 以下是跨平台的 markdown 工具, 大部分通过 brew install 可以安装
        - QLmarkdown
            - MacOS 快速查看md
        - Obsidian
            - 主流的博客/数字花园(md群集)工具, 付费使用
        - [Macdown]()
            - MacOS上开源markdown工具
        - [Marktext]()
            - 简洁优雅的 Markdown 编辑器，适用于 Linux、macOS 和 Windows 系统
        - [notable](https://notable.app/) ([仓库](https://github.com/notable/notable))
            - 另一款简洁的markdwon editor
        - [koodo](https://koodoreader.com/zh) ([仓库](https://github.com/koodo-reader/koodo-reader))
            - 电子书阅读器(有在线版本)
        - [wiki.js](https://js.wiki/) ([仓库](https://github.com/requarks/wiki))
            - 可扩展开源 wiki 编辑器
        - [docsify](https://docsify.js.org/#/quickstart)
            - 官方定义: 一个神奇的文档网站生成器

---

<h2 id="expression">Markdown 常用语法</h2>

- 页面内跳转
    - `<h2 id="hello-world">Hello World</h2>` 设置标题
    - `[跳转到Hello World](#hello-world)` 跳转

---

[Back Top](#markdown-top)
