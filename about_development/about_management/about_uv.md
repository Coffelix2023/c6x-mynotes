# uv

**uv笔记**

[about_development/about_management/about_ide.md]

[返回索引](../../README.md)

---

- about uv
    - 用 Rust 编写的、速度极快的 Python 包和项目管理器
    - 安装: `mise use -g uv` or `brew install uv`
    - 基础用法:
        - `uv init sample` 默认初始化后的目录结构如下:
            - `.git`
            - `.gitignore`
            - `.python-version`
            - `main.py`
            - `pyproject.toml`
        - `uv add sample` 添加依赖包到pyproject.toml
            - `uv add -dev`
        - `uv synch` 自动创建venv且安装pyproject中的包依赖
        - `uv run sample.py`
        - `uv build`, `uv publish`
        - `uv tree`
        - `uv lock`
