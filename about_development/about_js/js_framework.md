## JavaScript Framework 笔记

[返回索引](../../README.md)

---

### 📒 [Wasp](https://wasp.sh/)

```bash
# Wasp 是一个js全栈web框架
    - 构建全栈 Web 应用程序的一种固定方法, 负责web应用的三个主要部分: 客户端/服务器/数据库
    - 适用于 : 构建全栈 Web 应用程序, 利用行业最佳实践快速启动 Web 应用程序
    - 不适用于 : 构建静态/演示网站

# 初始化
    curl -sSL https://get.wasp.sh/installer.sh | sh
    wasp new  #列出了5个模版供选择
    cd && wasp start : 将开始自动安装,并运行脚手架在http://localhost:3000/
    # 默认使用js, 如果更换为ts, 需要更改:
        src/MainPage.jsx -> MainPage.tsx, 然后start
    # 设置env
        export  PATH=$PATH:/Users/felix/.local/bin
    wasp uninstall
# 结构
    main.wasp
    - 定义了应用的核心组件，并帮助 Wasp 完成许多基础工作
    - 三种声明类型:
        1. app : 应用程序的顶级配置信息
        2. route : 路线,描述每个页面可以从哪个路径访问
        3. page : 定义网页和页面加载时呈现的 React 组件

    src/MainPage.tsx
    - 主页声明引用的React组件: logo/Main.css

# 数据库实体(Database Entities)
    - 数据库中存储的内容
    - 使用 Prisma 与数据库对话.
    - schema.prisma : 比如添加task模型来定义task实体
    - wasp db migrate-dev : 创建新的数据库迁移并将其应用到数据库(每次都要执行)
    - wasp db studio : 会弹出页面查看数据库http://localhost:5555

```

---

### 📒 [Qwik](https://qwik.dev/)

```bash
- Qwik 是一种新型 Web 框架，能够实现任何规模和复杂度的 Web 应用程序的即时加载。您的网站和应用程序只需约 1KB 的 JS 即可启动（无论应用程序多么复杂），并能大规模地保持稳定的性能.
- 无论您的网站多么复杂，Qwik 都能提供最快的页面加载速度。Qwik 之所以如此之快，是因为它几乎无需 JavaScript 即可加载完全交互式的网站，并且能够从服务器中断的地方继续加载.
```

- 初始化

```bash
npm create qwik@latest
# or
pnpm create qwik@latest
# or
yarn create qwik@latest
# or
bun create qwik@latest

pnpm create qwik@latest
    # or empty
    # or library
    # or qwik-city
pnpm start
```

---

#### 🔘 [Astro](https://astro.build/) ([查看仓库](https://github.com/withastro/astro))

> 面向内容驱动型网站的 Web 框架,
> [查看官方文档](https://docs.astro.build/zh-cn/concepts/why-astro/)

```bash
# quick start
    npm create astro@latest
```

---

#### 🔘 [Dioxus](https://dioxuslabs.com/) ([查看仓库](https://github.com/DioxusLabs/dioxus))

> 适用于 Web、桌面和移动设备的全栈应用程序框架, 使用 Rust 编程语言构建跨平台应用程序的框架。只需一套代码库，即可构建可在 Web、桌面和移动平台上运行的应用程序([查看文档](https://dioxuslabs.com/learn/0.7/))

---

#### 🔘 小程序框架(Miniapp Framework)

- Dcloud
    - 最早的小程序开发团队, 官网
- Uni-app
    - 使用Vue.js开发, 一套代码发布H5 /微信小程序/支付宝/淘宝/百度/头条等小程序
    - 也可以打包成APP,但不推荐(直接使用flutter原生更好)
- HBuilderX
    - 开发uni-app的IDE
