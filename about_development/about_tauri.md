## Tauri 笔记

[返回索引](../README.md)

---

### 📒 [Tauri](https://tauri.app/)

```bash
- Tauri 是一个工具/框架，用来构建 跨平台桌面与移动应用（Windows、macOS、Linux、iOS、Android）。它的目标是产出 小体积、高性能、安全性强 的本地应用

- 用于构建适用于所有主流桌面和移动平台的轻量级、快速二进制文件。开发者可以集成任何编译为 HTML、JavaScript 和 CSS 的前端框架来构建用户体验，并在需要时利用 Rust、Swift 和 Kotlin 等语言编写后端逻辑

- Tauri = 一个 Rust 编写的本地应用框架 + 能嵌入任何 Web 前端（JavaScript/TS）的“容器”
- 支持任何前端框架 | 跨平台构建 | 最小化应用体积 | Rust驱动
```

- 初始化

```bash
# web端 : 便捷部署,可订阅
# 桌面应用 : 更新不便捷,但可以与web端同时进行
# 移动app : 需要较长审核周期,可以在web和桌面端上架后开发
    pnpm create tauri-app
    # awesome-tauri-仓库 template选择
    pnpm install
    pnpm store status
    pmpm list  #查看状态
    pnpm dev  #查看app预览
    pnpm tauri dev  #运行测试
```

- 利用现有web应用构建

```bash
# 环境准备
    # 安装 Rust 和系统依赖

# 集成 Tauri: 使用 pnpm tauri init 在 SvelteKit 项目中创建 src-tauri。
    #前提: 安装开发依赖tauri-app cli
    pnpm add -D @tauri-apps/cli
    pnpm tauri init
# 配置 SvelteKit
    # 使用 adapter-static 并禁用 SSR，使其生成静态文件。
    # 安装静态适配器的开发依赖
    pnpm add -D @sveltejs/adpater-static
        #修改 ./svelte.config.js 中的adapter
    import adapter from '@sveltejs/adapter-auto static';
        #禁用SSR(服务端渲染)

    src/routes/+layout.ts
    export const ssr = false;
    export const prerender = true;

# 配置 Tauri: 在 tauri.conf.json 中指定静态文件的位置和开发服务器的 URL。
  "build": {
    "frontendDist": "../build", # 由svelte构建的静态页面
    "devUrl": "http://localhost:5173", # svelte的地址
    "beforeDevCommand": "pnpm dev", # 执行pnpm tauri dev前先执行pnpm dev
    "beforeBuildCommand": "pnpm build" # 同pnpm dev
  },

# 开发与构建: 使用 pnpm tauri dev 进行开发，使用 pnpm tauri build 打包发布。
    #打包 pnpm tauri build 之前,要修改identifier (也可以在pnpm tauri init时编写)
    # 例如:
        "identifier": "com.c6x.svelte-demo-app"
```

- MacOS app的认证权限

```bash
# 打包之前,需要修改tauri.conf.json.bundle.macOS
    "bundle": {
        "macOS": {
        "signingIdentity": "Developer ID Application: Your Name
        (TEAM_ID)"
        }
    }
# 如何查看signing identity:
    #!/bin/zsh
    security find-identity -v -p codesigning

#返回结果

# 如何知道构建的macos app可以被其他电脑成功运行?
    # 模拟 Gatekeeper, 检查 spctl
    spctl --assess --verbose=4 --type execute <my-app>
    --assess 评估
    --type execute 模拟双击执行场景
    # 检查代码签名 codesign
    codesign --display --verbose=4 <my-app>
    # 如何判断是否可以在大部分macos系统上运行?
    # 待研究
```

---

### 📒 Tauri + SvelteKit

- 示例

```js
    pnpx sv create [my-app]
    pnpm add -D @sveltejs/adapter-static
    pnpm add -D @tauri-apps/cli
    pnpm tauri init
    //修改 ./svelte.config.js -> adpater-static
    //新建 ./src/routes/+layout.ts ->
    export const prerender = true;
    export const ssr = false;
    pnpm tauri dev
```

- 初始化

```js
    pnpx sv create [my-app]
    // or
    pnpm create vite@latest //选择svelte

    // 初始化时的工具包说明:
    sveltekit-adapter  // 必须品, 以适应跨平台需求
    adapter-auto  // 默认选项

        Tailwind CSS  //推荐, 响应式UI, 有两个插件:
            @tailwindcss/typography  //排版插件, 处理文章/博客/文档
            @tailwindcss/forms  //表单插件, 处理登录/注册/设置页面

        Playwright  //推荐, 多浏览器测试
        Paraglide  //推荐, 用于i18n
        vitest  //推荐, 单元测试高效率
    //单元测试  //针对独立函数,类似测试汽车发动机
    //组件测试  //针对交互UI片段
    devtools-json  //允许其他工具通过json分析组件树, 用于高级调试
    drizzle  //数据库ORM(对象关系映射),  需要数据库时需要
    SQLite  //原型阶段的选择, 非常快速; 首选,准备上线时迁移到另外两者
    better-sqlite3  //纯本地, 不推荐
    libSQL  //首选, 用于部署到serveless/Edge环境, 代表技术
    Turso  //libSQL的托管服务(具体项), 代表libSQL的具体服务
    MySQL  //传统型开源数据库
    PostgreSQL  //可扩展,大型应用首选
    lucia  //身份验证库, 社交型或SaaS需要
    mdsvex  //可以在md文件中使用sv组件
    storybook  //推荐, 独立于主应用的环境,单独开发测试展示UI组件
```

---

### 📒 Tauri + Nuxt

- 示例

```js
//需要在项目文件夹中提前安装packageManager
    pnpm create nuxt tauri-nuxt-demo
    pnpm add -D @tauri-apps/cli
//注意 pnpm generate
//修改 nuxt.config.js ->
    export default defineNuxtConfig({
      // （可选） 启用 Nuxt 调试工具
      devtools: { enabled: true },
      // 启用 SSG
      ssr: false,
      // 使开发服务器能够被其他设备发现，以便在 iOS 物理机运行。
      devServer: { host: process.env.TAURI_DEV_HOST || 'localhost' },
      vite: {
        // 为 Tauri 命令输出提供更好的支持
        clearScreen: false,
        // 启用环境变量
        // 其他环境变量可以在如下网页中获知：
        // https://v2.tauri.app/reference/environment-variables/
        envPrefix: ['VITE_', 'TAURI_'],
        server: {
          // Tauri需要一个确定的端口
          strictPort: true,
        },
      },
    });
```

---

### 📒 Tauri + Qwik

```js
    pnpm create qwik@latest
    pnpm qwik add static
    pnpm add -D @tauri-apps/cli
    pnpm tauri init
        Dist : ../dist
        server : http://localhost:5173
        beforeDev : pnpm dev
        beforeBuild : pnpm build
    pnpm tauri dev
```
