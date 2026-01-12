## Vue 笔记

[返回索引](../../README.md)

---

### 📒 [Vue](https://cn.vuejs.org/)

```bash
- 渐进式框架
- 构建用户界面的 JavaScript 框架。它基于标准 HTML、CSS 和 JavaScript 构建，并提供了一套声明式的、组件化的编程模型，帮助你高效地开发用户界面。无论是简单还是复杂的界面，Vue 都可以胜任
```

- 项目结构(默认)
    - Vue3 + Vite
    - 默认empty (不勾选任何组件)
        - SPA 单页应用模版
        - 构建工具: Vite

```bash
# 项目结构图
vue-demo-empty/
    ├── 📁 根目录配置层
    │   ├── package.json          # 项目依赖与脚本配置
    │   ├── vite.config.js        # Vite构建配置
    │   ├── tsconfig.json         # JS/TS编译配置
    │   ├── pnpm-lock.yaml        # 依赖版本锁定
    │   └── README.md             # 项目说明文档
    │
    ├── 📁 静态资源层 (public/)
    │   └── favicon.ico           # 网站图标
    │
    ├── 📁 源码核心层 (src/)
    │   ├── main.js               # 应用入口点
    │   ├── App.vue               # 根组件
    │   ├── 📁 assets/            # 静态资源管理
    │   │   ├── main.css          # 主样式文件 ⭐
    │   │   ├── base.css          # 基础样式
    │   │   └── logo.svg          # Logo图标
    │   └── 📁 components/        # 组件库
    │       ├── HelloWorld.vue    # 示例组件
    │       ├── TheWelcome.vue    # 欢迎组件
    │       ├── WelcomeItem.vue   # 欢迎项组件
    │       └── 📁 icons/         # 图标组件集
    │
    └── 📁 依赖管理层 (node_modules/)
        └── [第三方包...]
```

- 默认结构(全组件)

```bash
vue-demo-default:
---------- src/ -----------
src/
├── main.ts                   # 应用入口点
├── App.vue                   # 根组件
├── assets/                   # 静态资源
│   ├── base.css             # 基础样式
│   ├── main.css             # 主样式
│   └── logo.svg             # Logo 图标
├── components/               # 可复用组件
│   ├── __tests__/           # 组件单元测试
│   ├── icons/               # 图标组件库
│   └── *.vue                # 业务组件
├── router/                   # 路由配置
│   └── index.ts
├── stores/                   # 状态管理
│   └── counter.ts           # 示例 store
└── views/                    # 页面级组件
    ├── HomeView.vue
    └── AboutView.vue

---------- root-files -----------
├── package.json              # 项目依赖和脚本配置
├── vite.config.ts            # Vite 构建配置
├── tsconfig.*.json           # TypeScript 多环境配置
├── eslint.config.ts          # ESLint 代码规范配置
├── cypress.config.ts         # Cypress E2E 测试配置
└── vitest.config.ts          # Vitest 单元测试配置

---------Vitest-----------
cypress/                      # E2E 测试
├── e2e/                     # 测试用例
├── fixtures/                # 测试数据
└── support/                 # 测试辅助文件

src/components/__tests__/     # 单元测试

```

- 语法

```html
# 结构: # template
<template>
    <!-- 定义 : 容器模版,Vue组件的核心 -->
    <!-- 功能 : 处理HTML, 将其转换成高效的JS渲染函数(Render Function) -->
    <div class="profile">
        <!-- 定义 : division, HTML标签, 容器分块,唯一目的就是分组 -->
        <!-- ⚠️template必须有一个唯一的根元素,通常用div -->
        <h2>用户名</h2>
        <p>简介</p>
    </div>
</template>

# style
<style>
    <!--定义:
        为组件定义CSS规则,
        scoped是隔离样式的关键 -->;
</style>
<style scoped>
    <!-- scoped : 这里的CSS样式只对当前组件生效 -->
        .log {
        height: 6em;
        padding: 1.5em;
        border-radius: 8px;
    }
</style>

# script
<script>
    <!-- 组件的逻辑部分 -->
</script>
```

---

### 📒 [Nuxt](https://nuxt.com/)

```bash
- Vue 的服务端渲染框架(SSR)
- Nuxt 是一个免费开源的框架 ，它提供了一种直观且可扩展的方式来使用 Vue.js 创建类型安全、高性能且生产级的全栈 Web 应用程序和网站
# 初始化
    pnpm create nuxt@latest
    # 选择官方模块
        - @nuxt/content
        - @nuxt/eslint
        - @nuxt/fonts
        - @nuxt/icon
        - @nuxt/image
        - @nuxt/scripts
        - @nuxt/test-utils
        - @nuxt/ui
    pnpm dev
```
