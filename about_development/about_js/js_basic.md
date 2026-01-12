## JavaScript/TypeScript Basic 笔记

[返回索引](../../README.md)

---

```
What's JS?
    为web网页添加动态和交互性的编程语言.
    Javascript / CSS / HTML

# JavaScript 是一种高级的、解释型的编程语言，广泛用于网页开发。它最初由网景公司（Netscape）在1995年创建，旨在为网页添加动态和交互性。JavaScript 允许开发者在客户端（浏览器端）执行代码，从而实现丰富的用户体验。
```

- Javascript 基础

```js

// 运行JS/TS脚本
    node <js-script>
// 基本文件
    index.html
    script.js
    style.css
// 语法规则
    - 分号结尾 ;
// const
    const myHeading = document uerySelector("h1");
    myHeading textContent = "Hello World";
        // const 与 let 区别
            let 声明的变量, 可以被重新赋值
            const 一旦赋值不能被重新赋值
            // 变量赋值 : 使用反引号 ``, 注意不是单引号 ''
            反引号支持插值,如 `${name}`
// 变量 (Variable)
    let myVar = "I'm Felix";
        - String : I'm Felix
        - Number : 10
        - Boolean : true
        - Array : [0, 1, "felix"]
        - Object : document.querySelector()

// 数学运算符
    === : 严格相等, 返回boolean
// 条件语句
    if (...) {...}else{}
    let ice = "chocolate";
    if (ice === "chocolate") {
        alert("我喜欢巧克力冰");
    } else {
        alert("但巧克力才是我的最爱");
    }
// 函数 Function
    独立可复用的代码块, 被定义后用于调用
        // 命名: 驼峰/ 描述性词汇 / 唯一性
        // 需要 return 语句返回函数最终值
    function myFunction() {
        console.log("内容");
    }
// 方法 Method
    // 本质上也是函数, 定义为对象(object) 的属性, 通过 对象实例 完成
    object.method() {}
    // 例如
        const person = {
            name: "john",
            introduce: function() {
                console.log( `hi, my name is ${this.name}`);
                }
        }
    this.name 代表本对象自己的name属性
    this: 特殊关键字, 表示 当前对象 或 上下文, this. 没有则需要let/ const
    // person定义了两个属性
    // 当文本中用到 $ 等参数符号时, 使用反引号``(不是单引号 '')

//如何调用?
    console.log("直接调用函数: ");
    sayHello();
// 对象 Object
    一个容器或实体, 打包数据和功能
    举例:
        const object = { name: John, age: 18 }
        // object是对象, name 和 age 是属性
        // 如果定义对象的某种属性中包含了函数,就是方法.

// 参数 Parameter
    传递信息进入代码块的入口(占位符).
    无论 方法 或 函数, 参数的作用完全一样.

// 事件驱动编程 : Event Driver
    click : 点击按钮或链接
    contextmenu : 单击右键
    select : 选择并突出显示文本
    input : 输入文本

// 条件判断与决策
    1. Boolean 布尔类型
        // true / false
            let isOnline = true;
    2. 比较运算符
        // < <= > >= / === !==
            5===5 return true
            5!==6 return true
    3. if 语句
        // if (条件) {
            //条件为true时执行
            }
    4. switch
        // 从多个代码块中选择一个来执行
        // switch (表达式) {
            case value1:
                //代码块
                break;
            case value2:
                //代码块
                break;
            default:
                //默认代码块
            }
    5. 逻辑运算符
        // && || !
            (5>3) && (2<4) : return true
            (5>6) || (2<4) : return true
            !(5>6) : return true
    6. 三元表达式
        let a= 10, b= 20
        let max = a>b ? a : b; //如果a大于b, true=a, false=b

```

- TypeScript 基础

```ts
// 对于ts需要先编译成js然后再被执行
    pnpm i -g typescript 然后可以使用 tsc 命令.
    tsc
    - typescript官方编译器,转译成js.
    - node和浏览器运行环境不认识ts
    - 同步更新的监督模式: -w --watch
    - tsc --init
        outDir: ./dist
        rootDir: ./src
        target: ES6/ ES2022/...esnext(最新版本)
// tsconfig.json
    svelte框架中,typescript集成了svelte的配置, 而且编译不依赖tsc而是vite.

    tsc只负责 类型 与 语法 检查, vite负责最终编译,以适配浏览器正确执行

// svelte.config.js
    让sveltekit与其他工具协同工作, 主要目的:
    // preprocess: 预处理*.svelte 文件
    // kit.adapter: 适配项目并构建到特定部署环境
    - adapter-node: 部署到node.js传统服务器
    - adapter-static: 静态网站托管平台 或 app应用
    - adapter-vercel: serverless无服务器平台(vercel/ netlity)
    - adpater-auto: (推荐)自动检测部署环境,选择最优适配器

// vite.config.js
    关键点(sveltekit): @sveltejs/kit/vite
        开发时: pnpm dev, 保持最新esnext 追求极致速度
        构件时: pnpm build, 自动降级兼容大多数主流浏览器Js版本
```

- JS与html / css三者的关系

```bash
HTML -> CSS
    <link rel = "stylesheet" href = "style.css" />
    * stylesheet 是常用固定用法,表示采用css的样式,做到结构清晰隔离
    * href : 用于指定外部样式表路径,style.css 可以是相对路径和绝对路径
CSS -> HTML
    title{} / body{} / #btn {}
    * 基于HTML中的模块: <head><body>等名称进行分组编写样式
    * #btn : ID选择器, 是由HTML中ID定义的, 例如: <h1 id="title"> / <button id="btn">
    * .container : Class选择器,
JS -> HTML
    * DOM (文档对象模型) : HTMEL页面上的每个元素都可以通过JS访问和操作
        * document.getElementById("id")
        * document.querySelector()
        * .onpointerdown/up/move : 监听鼠标或触屏按下
    * 闭包(closure) : 是指函数可以“记住”并访问其定义时的作用域
```

- JS游戏编程备忘

```js
// 继承 : extends
    class Hero extends Movalbe {
        constructor(x,y) {
            super(x,y, 'Hero')
            }
        }
// 组合 : Copmostion
    const movableObject = {...gameObject, ...movable};
    function createHero(x, y) {
        return {
        ...movableObject,
        x,
        y,
        type: 'Hero'
        }
    }
// Canvas
    基于像素的绘图表面, 通过JavaScript API来控制每一个像素的颜色和位置
        * HTML : 全局画布尺寸
        <canvas id="myCanvas" width="400" height="300"></canvas>
        * CSS : 显示的尺寸
        * JS : 在画布中画一个矩形
            const canvas = document.getElemntById("myCanvas");
            const ctx = canvas.getContext("2d");
            ctx.fillReact(0,0,100,100);
// WebGL
    一种JS API, 无需插件即可在浏览器中渲染 3D 和 2D 图形
```

- 主要项目文件解读

```bash
* package.json
node.js的默认配置文件
    * 定义项目的元数据和依赖关系
    * 项目名称/版本/脚本命令scripts/依赖项devDependencies/Dependencies等信息
    * pnpm/npm 等包管理器 管理项目依赖和运行脚本
* tsconfig.json / jsconfig.json
Typescript编译器的配置文件
    * 指定 ts/js 编译选项 和 项目结构
* nuxt.config.js (svelte.config.js)
以Nuxt为例: 这是nuxt.js的默认配置文件
    * 定义预处理器/ 适配器/ 特点配置等
* app.vue
Nuxt应用的根组件.
    * 定义 应用的主要布局 和 结构.
* vite.config.js
Vite构建工具的默认配置文件
```

- 前端介绍

```bash
什么是用户界面(User Interface)?
    - 按钮/文本/图像
    - 交互逻辑
    - 路由
    - 状态管理
Node.js又是什么?
    - 首先Node不是框架,是环境
    - 开源跨平台的javascript运行时(runtime)环境
    - 后端环境, 可以让js在浏览器之外运行(最早js用于浏览器交互)
* React (中文文档)
[框架]用于构建用户界面的Javescript库, 由facebook开发
是全栈框架,细分以下框架
    - Next.js : 全栈元框架,支持路由, 适配edge/serverless
* Vue.js (中文文档)
相比React更轻量,
    - Nuxt.js : Vue的全栈框架,结构类似Next.js
* Svelte (文档)
轻量高效, 结合 SvelteKit使用.
Svelte: 一种编写UI组件的方法, 主要负责渲染UI组件
SvelteKit: 使用Svelte开发应用程序的框架, 主要负责构建应用
* Solid.js
[框架]
* Qwik
[框架] 基于React的全栈框架, 适用于密集数据或文档型web, 启动速度超快.
* Angular
[框架] google开发的基于React的框架, 适用于大企业和复杂项目
```

- 后端介绍

````bash
后端的主要作用:
    - 业务逻辑处理: 实现应用的核心功能（比如计算价格、匹配用户
    - 数据存储与管理: 和数据库打交道，进行增删改查
    - API (应用程序接口): 提供数据接口给前端或其他服务调用
    - 身份验证与安全: 管理用户登录、权限控制，保护应用安全
前后端分离的情况:
    - 通过http api对接 (主流方式)
        后端: python框架(Django/FastAPI/Flask等)暴露REST/GraphQL接口
        前端: 通过js框架(React/Vue/Next等)用fetch/axios调用接口
    - 嵌入式混合
        在Django/Flask模版中嵌入Vue/React组件,只渲染部分页面
* Nest.JS
结构化后端框架,模仿Angular架构
Nest.JS 和Next.JS主要区别: Nest是后端框架,Next是全栈框架
* Express.js / Fastify
轻量后端框架, 对比Flask, 微框架,快速原型首选
Fastify更高效,现代入门首选
* Hono
小型简洁超快的Web框架
安装:
    pnpm create hono@latest
```
````
