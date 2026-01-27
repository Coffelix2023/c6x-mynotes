# git notes

**git 相关笔记**

[返回索引](../../README.md)

---

- 优秀笔记推荐: [查看](https://www.atlassian.com/zh/git/glossary#commands)
- 基本用法
    - `git clone <git>` 克隆仓库
    - `git pull` 拉取最新代码
        - `git pull origin main` 拉取指定分支
        - `git fetch --verbos` 查看远程分支
        - `git pull --rebase --verbos` 变基替代合并(推荐)
    - `git rebase origin/master` 变基
    - 诊断
        - `git status`
        - `git log --oneline --graph --all -20` 查看分支历史:20 条
        - `git config --list | grep pull` 查看配置
        - `git diff origin/master` 查看差异

- git 创建新仓库(repository)

    ```bash
    echo "# c6x-mynotes" >> README.md
    git init
    git add README.md
    git commit -m "first commit"
    git branch -M main
    git remote add origin git@github.com:Coffelix2023/c6x-mynotes.git
    git push -u origin main
    ```

- git 推送仓库(push repository)

    ```bash
    git remote add origin git@github.com:<git>
    git branch -M main
    git push -u origin main
    ```

- 状态查询
    - `git status`, 简洁显示: `git status -s`

- 更新仓库的流程
    - `git add .`

- gitleaks
    - 密钥安全扫描
    - installation
        - `brew install gitleaks`
    - 用法:
        - `gitleaks git .`
        - `gitleaks dir .`

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
