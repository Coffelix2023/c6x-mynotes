# Conda Notes

[_about_system/about_conda.md_]

[返回索引](../../README.md)

---

### 常用工具介绍

- [Conda](https://conda.org/) ([查看仓库](https://github.com/conda/conda))

    ```bash
    # 开源的包管理器和环境管理器，可以创建隔离的 Python（或其他语言）环境、安装/升级/删除软件包
    # conda是一个社区,包管理器主要靠 miniconda 和 anaconda (命令采用 conda )
    ```

- [Anaconda](https://www.anaconda.com/) ([查看仓库](https://github.com/ContinuumIO/anaconda-issues))

    ```bash
    # Anaconda Distribution 是一个功能齐全的安装程序，它包含一套用于数据科学的软件包，以及 Anaconda Navigator，这是一个用于处理 conda 环境的 GUI 应用程序
    ```

- [Miniconda](https://docs.conda.io/en/latest/miniconda.html)

    ```bash
    # Miniconda 是 Anaconda 提供的一个最小化安装程序。如果您想自行安装大多数软件包，请使用此安装程序
    ```

- [Mamba](https://mamba.readthedocs.io/en/latest/)([查看仓库](https://github.com/mamba-org/mamba))

    ```bash
    # 可以看做是conda平替, Mamba 是一款快速、稳定且跨平台的软件包管理器
    # 需要先安装conda
    ```

- [Micromamba](https://mamba.readthedocs.io/en/latest/installation/micromamba-installation.html)

    ```bash
    # 适合在docker或小型工作站使用的, 独立于conda的静态链接版本的 Mamba
    # installation
        brew install --formulae micromamba
    ```

---

## Miniconda 用法

- [官方文档](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html)

- 自动补全(Tab)
    - [conda-zsh-completion](https://github.com/conda-incubator/conda-zsh-completion)

- 环境管理
    - `conda create -n <envname> python=3.12`
    - `conda create -n <envname> --clone <dest-envname>`
    - `conda env list`
    - `conda activate <envname>`
    - `conda deactivate`

- 安装包依赖
    - `conda search <pkg>` 查询可安装包
    - `conda install <pkg> —name <env>` 安装到指定环境
