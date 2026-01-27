# Mise | MISE-EN-PLACE

**mise笔记**

[about_development/about_ide.md]

[返回索引](../../README.md)

---

## What's [Mise](https://mise.jdx.dev/)

- 定义:
    - Mise 是开发环境配置工具
    - 使用其 `mise.toml` 配置文件，无论项目是用何种语言编写的，都可以采用一致的方式来设置项目并与之交互

- 功能:
    - 安装与管理开发工具
    - 安装与管理运行时环境
    - 简化安装过程
    - 版本管理
    - 环境变量管理
    - 检测并激活虚拟环境
    - 任务运行器

## Mise 的目录结构(基于 XDG 基础目录)

- Global
    - `$MISE_CONFIG_DIR` = `${XDG_CONFIG_HOME}/mise`
    - 全局配置目录( `mise use -g ...` )

- Cache
    - `$MISE_CACHE_DIR` = `${XDG_CACHE_HOME}/mise`
    - 内部缓存目录, 清理: `mise cache clear`

- State
    - `$MISE_STATE_DIR` = `${XDG_STATE_HOME}/mise`
    - 存储本地机器状态

- Data
    - `$MISE_DATA_DIR` = `${XDG_DATA_HOME}/mise`
    - 数据目录, 主要目录,包括插件和工具等安装和程序.
    - `$MISE_DATA_DIR/downloads` : 下载缓存目录
    - `$MISE_DATA_DIR/plugins` : 插件安装目录
    - `$MISE_DATA_DIR/installs` : 应用安装目录
        - 支持设置环境: `MISE_INSTALLS_DIR`
    - `$MISE_DATA_DIR/shims` : 代理目录(垫片), 用于管理不同版本的工具执行路径

## Mise 安装工具

- 安装项目工具: `mise use python@3.12.10` 在当前项目中mise.toml添加[tools]

- 全局安装工具: `mise use -g ` 在全局配置(--global)中添加[tools]

- 查询工具:
    - `mise registry <tool>` 显示工具来源
    - `mise search <tool>`
    - `mise ls-remote <tool> | tail -10` 列出最新的 10 个版本号
    - `mise latest <tool>` 显示工具最新版本号
        - `mise latest python@3.12` 举例:显示3.12的最新小版本号

- 查询可用版本:
    - `mise ls-remote <tool>`

- 列出所有可用插件:
    - `mise plugins ls-remote`
    - `mise plugins ls-remote --urls` 附带路径

- 查看已安装插件: `mise ls --installed`

- 安装git仓库工具: `mise use -g `

- Mise 执行解释器或运行时
    - `mise exec node@24 -- node` 在终端执行node运行时

## Mise 管理环境

- Mise 运行任务Task

    ```bash
    [tasks.build]  # build 是任务指令
    description = "创建一个项目"
    run = "echo building..."
    $ mise run build
    ```

- Mise 替代 fnm
    - 使用 mise 管理 node.js环境
    - 主要区别:
        - `mise install node@version`
        - `mise use node@version`
        - `mise exec node@version -- node`
        - `mise use --global node@version`
        - 目录自动切换:
            - dir/mise.toml

- Mise 与 uv 的搭配使用
    - mise 会检测 `.python-version` 中的 Python 版本
    - uv 负责管理开发包依赖, mise 负责cli工具

## Mise 的规划化流程建议

- 每个项目显示声明`运行时` 和 `开发工具`
    - 即使mise全局已经定义,也显示声明项目配置
    - 比如: python/uv/ruff/ty/black等
