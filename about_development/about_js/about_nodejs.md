## Node.js 笔记

[返回索引](../README.md)

---

### 📒 [Node.js](https://github.com/nodejs/node)

```bash
- 开源、跨平台的 JavaScript 运行时环境
- 基于 Chrome V8 引擎的 JavaScript 运行时，允许在服务器端运行 JavaScript 代码。
- Node.js 在浏览器之外运行 V8 JavaScript 引擎（谷歌 Chrome 的核心）。这使得 Node.js 拥有极高的性能
```

- Node.js 与 浏览器区别

```bash
- 浏览器和 Node.js 都使用 JavaScript 作为编程语言。构建在浏览器中运行的应用程序与构建 Node.js 应用程序截然不同。尽管它们都是 JavaScript，但一些关键差异使得开发体验大相径庭
- 优势: 可以用单一语言编写所有代码——前端和后端
- Node.js 中你可以同时使用 require() 和 import ，而在浏览器中你只能使用 import

# What's V8 javascript engine?
- V8 是谷歌 Chrome 浏览器所使用的 JavaScript 引擎的名称。它负责在我们用 Chrome 浏览器浏览网页时执行 JavaScript 代码
- V8 负责解析和执行 JavaScript 代码。DOM 和其他 Web 平台 API（它们共同构成运行时环境）则由浏览器提供
- Node.js 生态系统非常庞大，这要归功于 V8，它也为桌面应用程序提供支持，例如 Electron 等项目
```

### 📒 [Npm 包管理器](https://www.npmjs.com/)

```bash
- npm 是 Node.js 的标准包管理器
    npm install
    npm update
    npm install [package@version]
    npm update [package@version]
    npm run [watch/ dev/ prod]

- Yarn 和 pnpm 是 npm cli 的替代方案
```

### 📒 [Pnpm 包管理器](https://pnpm.io/)

```bash
# Rust编写的快速、节省磁盘空间的软件包管理器

# pnpm 使用内容寻址文件系统 (CASH) 将所有模块目录中的所有文件存储在磁盘上。使用 npm 时，如果您有 100 个使用 lodash 的项目，则磁盘上将有 100 份 lodash 副本。而使用 pnpm，lodash 将存储在内容寻址存储 (CASH) 中

# 两个pnpm cli 包:
    pnpm  #普通版本，需要 Node.js 才能运行
    pnpm/exe  #打包成可执行文件，因此可以在没有安装 Node.js 的系统上使用

# installation
    npx pnpm@latest-10 dlx @pnpm/exe@latest-10 setup
    npm install -g pnpm@latest-10
    brew install pnpm

# 常用指令
    pnpm init
    pnpm install (i)
    pnpm add [package]
        pnpm add -D : devDependencies
        pnpm add -g : Global
        pnpm add sax@next : 指定版本,next是有标签next版本

    pnpm dev/build/start/... : 等价 npm run ...
    pnpm list
    pnpm outdated
    pnpm doctor
    pnpm rebuild
    pnpm up (--latest)
# 清理指令
    pnpm audit : 检查已安装程序包的已知安全问题
    pnpm prune : 移除不需要的软件包
    pnpm store prune :

# 全局安装:
    pnpm install -g [package]
        PNPM_ENV=./config/pnpm, pnpm setup
    pnpm ls -g : 查看全局安装依赖
    pnpm rm [package] -g

```

### 📒 [Fnm 环境管理工具]

```bash
# rust编写的现代node环境管理工具
# installation
    通过官方sh #推荐
    brew install fnm

# fnm常用指令
    fnm install 20
    fnm use 20
    fnm ls
    fnm ls-remote | grep v20  // 查看官方已发布的所有版本
    fnm default 20 # 全局默认版本指定
    echo “20” > .node-version  // 特定目录指定版本
# fnm版本控制流程:
    fnm use 18 (将项目中安装指定node版本)
    node —version > .node-version (版本控制)

# nvm
    nvm # nodejs 环境管理工具, 老牌稳定, 而 fnm 更现代,推荐使用fnm

```
