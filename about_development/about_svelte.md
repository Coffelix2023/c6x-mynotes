## Svelite 笔记

[返回索引](../README.md)

---

### 📒 [Svelite](https://svelte.dev/)

```bash
- Svelte 是一种构建 Web 应用程序的新方法。它是一个编译器，可以将你的声明式组件转换为高效的 JavaScript，从而精确地更新 DOM
```

- 初始化

```js
    pnpx sv create my-app
        //进入选择: minimal / demo / libraray
        //可以选择格式化配置,如prettier, eslint等

    pnpx sv create <my-app>
    //或者
    pnpm create vite@latest //选择svelte

    //初始化时的工具包说明:
    sveltekit-adapter  //必须品, 以适应跨平台需求
    adapter-auto  //默认选项
    Tailwind CSS  //推荐, 响应式UI, 有两个插件:
        // @tailwindcss/typography: 排版插件, 处理文章/博客/文档
        // @tailwindcss/forms: 表单插件, 处理登录/注册/设置页面
    Playwright  //推荐, 多浏览器测试
    Paraglide  //推荐, 用于i18n
    vitest  //推荐, 单元测试高效率
    单元测试  //针对独立函数,类似测试汽车发动机
    组件测试  //针对交互UI片段
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

- 基本结构与函数

```js
//格式: 分号 ; 结尾
    src/routes/+page.svelte
    <scrpts>
    let // 声明一个块级作用于的变量
    src={src} -> {src} // 名称和值相同时的简写
    <style> // 定义样式, 格式: vaule : key;
    <File /> // 在同级目录创建*.svelte文件内容可以补充引用.‼️名称大写
    {@html string} // 满足markdown格式, 比如<Strong>加粗</strong>
    button

// 文件结构
    ./package.json
        文件用途: 列出项目依赖
        devDepandences
            @sveltejs/kit
            @svelte
            @vite
            @rollup/wasm-node
            @esbuild-wasm
        scripts
            dev
            build
            preview
        type
            module
                意味着.js文件默认被视为原生JS模块,而不是传统的CommonJS格式
    ./svelte.config.js
        文件用途: 项目配置
        帮助文档
    ./vite.config.js
        文件用途: Vite配置, 让svelteKit使用Vite功能,如热模块,TS支持, 静态资源处理等
        import { sveltekit } from '@sveltejs/kit/vite';
        import { defineConfig } from 'vite';
        export default defineConfig
    src/
        应用的源代码
        src/app.html
            页面模版
        src/routes/
            定义应用的路由, 路由是导航到特定URL后告诉应用该做什么
            src/routes/page.svelte
                每个该文件会创建一个页面
            src/routes/layout.svelte
                适用于同级与子路由,可以嵌套到任意深度
    static/
        资产
```

- 执行流程

```bash
1.  启动
    * Vite 读取 vite.config.ts 配置
        * import
        * export
2.  编译
    * tsconfig.json 进行类型检查
    * svelte.config.js 处理  *.svelte 文件
    * Vite 处理模块依赖 和 热更新
3. 渲染
    * app.html ( HTML 骨架)
    * +layout.svelte (全局布局)
    * +page.svelte (页面内容)
    * 引用 src/lib 中的组件
    * 应用 app.css 全局样式
    * 加载 static 静态资源
4. 显示
    * 浏览器接受编译后的 html, css, js
    * 执行js, 挂载sv组件到DOM
    * 渲染最终的web页面

# 文件结构
    src/app.html  # 入口文件

    src/app.d.ts
    # 定义: 环境类型声明文件(sv专属)
    # 作用: 定义全局类型, 无需显示导入 即可在整个应用程序中使用

    # 核心功能:
        1. 生成类型 Generated Types : 自动为每个route生成 .d.ts 类型定义文件;
        2. APP 命名空间
    declare global {} : 声明全局作用域的命名空间, 不会污染模块作用域
    namespace App {} : 可扩展默认接口
    src/routes/+page.svelte
    + : 代表这个sv文件支持路由
```
