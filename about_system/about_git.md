# git notes

**git 相关笔记**

[返回索引](../README.md)

---

- 创建新仓库(repository)

    ```bash
    echo "# c6x-mynotes" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M main
    git remote add origin git@github.com:Coffelix2023/c6x-mynotes.git
    git push -u origin main
    ```

- 推送仓库(push repository)

    ```bash
    git remote add origin git@github.com:<git>
    git branch -M main
    git push -u origin main
    ```

- gitleaks

- pre-commit
    - 用于管理和执行 Git 钩子（Git hooks）的框架
    - 将这些钩子集中配置在一个统一的 .pre-commit-config.yaml 文件中，便于团队共享和维护
    - 安装: `pip install pre-commit`
    - 工作流:
        - 在本地仓库安装钩子（pre-commit install）
        - 每次调用 git commit 时，pre-commit 会根据配置运行对应的钩子
        - 如果某个钩子失败（退出码非 0），提交会被阻止
        - 可选择性按需运行特定钩子或全部钩子

- 常用命令:
    - 清理已忽略(.gitignore)的文件(保留本地文件)
      `git clean -X -f`
