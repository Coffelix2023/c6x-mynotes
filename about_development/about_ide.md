## IDE 代码编辑器笔记

[返回索引](../README.md)

- 🔘 [vscode](https://code.visualstudio.com/)

    ```bash
    # vscode
        # installation
        brew install visual-studio-code

    # vscode-insiders
        # vscode的开发版本
        # installation
        brew install viusal-studio-code@insiders

    # codium
        # MIT开源版本, 无扩展商店
        # installation
        brew install vscodium
    ```

- 🔘 [zed](https://zed.dev/)

    ```bash
    # Build in Rust, 极简美学代码编辑器，专为速度和人机协作而设计
    # installation
        brew install zed

    # >>>>> 使用笔记
        1. 为单独项目设置zed环境:
            path: project_dir/.zed/settings.json
                #但无法设置themes覆盖(截止version Zed 0.219.4 )
    ```

- 🔘 [Lapce](https://lap.dev/lapce/) (MacOS中有点卡顿)

    ```bash
    # 用 Rust 编写的开源代码编辑器。它利用原生 GUI 和 GPU 渲染，并结合 Rust 的高性能，是目前速度最快的代码编辑器之一
    # 对比 zed, lapce更加轻量,适合个人(zed强调协作概念),但没有ai-agent集成
    # installation
        brew install lapce
    ```

- 🔘 [neovim](https://neovim.io/)

    ```bash
    # 终端编辑器, Vim的增强版本, 支持插件和扩展
    # installation
        brew install neovim
        nvim [file]
    ```

- 🔘 [amp](https://github.com/jmacdonald/amp) (https://amp.rs/)

    ```
    amp 是终端代码编辑器, Rust编写
    # installation
        brew install amp
    ```

- 🔘 [Spyder](https://www.spyder-ide.org/) ([查看仓库](https://github.com/spyder-ide/spyder))

    ```bash
    # Spyder 是一个功能强大的科学计算环境，它使用 Python 编写，专为 Python 设计，由科学家、工程师和数据分析师打造。它独特地融合了综合开发工具的高级编辑、分析、调试和性能分析功能，以及科学计算软件包的数据探索、交互式执行、深度检查和精美可视化功能
    # installation
        brew install --cask spyder
    ```
