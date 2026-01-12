## Vite 笔记

[返回索引](../../README.md)

---

### 📒 [Vite](https://vite.dev/)
```bash
- 为Vue / React / Svelte 主流框架提供前端构建的工具
- 利用生态系统中的新进展来解决: 浏览器中原生 ES 模块的可用性，以及用编译为原生语言编写的 JavaScript 工具的兴起
```
- 初始化
```bash
pnpm create vite@latest && pnpm i
    # 可选框架:
    - Vanilla : 无任何封装, 直接操作DOM, 纯js
    - Vue : 推荐 渐进式
        - ssr-vue : 预渲染服务端
        - deno-vue : 新的node.js
    - React : 组件式,模块化
    - Preact : 轻量化
    - Lit : 构建可跨框架复用的组件库
    - Svelte : 推荐 追求极致性能,简洁开发体验
    - Solid : 顶级运行时性能
    - Qwik : 内容型web,未来科技传送门
    - Angular : 大型集群
    - Marko : 流式渲染, SSR(服务端渲染)的Web应用
    - Other : 选择社区模版
```
