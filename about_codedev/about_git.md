# git commanders

---

- 官方笔记:
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

- 常用命令:
    - 清理已忽略文件(保留本地文件)  
      `git clean -X -f`
