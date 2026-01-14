## UV 笔记

[返回索引](../../README.md)

---

```bash
# 现代python管理工具,rust编写速度极快)
# brew install uv
PATH : /opt/homebrew/bin/uv
Conda 也安装隔离uv 版本
设置export PATH, 确保python/pip 优先读取Conda环境

* uv常用指令
    * uv pip install
    照顾旧版本: python -m // pip installl等
    * uv pip list
    * uv init
    * uv venv
    * pip list --not-required
    列出全局手动装的pip包
    * pip cache purge
    * pip check
    类似brew doctor

* uv 创建项目流程
    * uv init
    * uv venv ...
    根据init后的toml创建python版本,默认是3.11+
    * source .venv/bin/activate
    * which python
    验证venv是否部署成功
```
