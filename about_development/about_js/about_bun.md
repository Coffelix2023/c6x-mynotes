## Bun 笔记

[返回索引](../README.md)

---

### 📒 [Bun](https://bun.com/)

```bash
- Bun 是一个用于开发现代 JavaScript/TypeScript 应用程序的一体化工具包
- 可以在 Node.js 项目中使用 `bun test` 或 `bun install` 等单个工具，也可以采用包含快速 JavaScript 运行时、打包器、 测试运行器和包管理器的完整技术栈。Bun 的目标是 100% 兼容 Node.js

# installation
    # npm/ homebrew/ docker/ 以及官方脚本均可安装
        curl -fsSL https://bun.sh/install | bash
    # 设置ENV PATH
        export BUN_INSTALL="${XDG_BUN_PATH}/.bun"
    bun upgrade
```

- Bun 和 Node.js 区别

```bash
# 引擎不同
    - Node.js：使用 Google V8 引擎
    - Bun：基于 JavaScriptCore (JSC)，这是 Safari 的 JS 引擎，优势在 启动速度和内存效率

# Bun 启动速度快, 内存占用低,

# Bun 开发过程一体化
    # 包管理
    npm install
    bun install

    bun run
    # 打包
    node.js: webpack/ Rollup/ esbuild
    bun build

    # 测试框架
    node.js: jest/ mocha/ vitest
    bun test

```
