## Basic 基础概念和原理笔记

[返回索引](../README.md)

---

```bash
# API
	全称 : Application Programming Interface
	调用函数通信接口, 通信菜单,但需要双向编写, 通常是本地函数或远程调用
	很多SDK都有预建的API client(客户端)

# REST API : API的细分具体类型
	全称 : Representatinal State Transfer API
	基于HTTP协议的web接口规范, 用于客户端与服务器通信
	例如get https://api..., 使用JSON格式进行数据交互
	类似的API细分
	- REST API : json, 无状态/统一接口/最常用
	- SOAP: XML, 强类型/企业级应用,金融支付网关
	- GraphQL: Json, 客户端驱动/单端点/复杂前端,多数据源聚合
	- gRPC: Protobuf, 高性能/跨语言/微服务间通信,高并发场景
	- Json-RPC: Json, 轻量/规范简单/内部API, 通知系统

# SDK
	Software Development Kit
	构建app的开发组件, 为开发者准备的一套工具包(包含数个API), 用于快速构建应用.
	SDK是开发工具箱, 而package是工具箱里的螺丝刀.
	package更偏模块化代码单元,可能也是通用库(不属于SDK)
	比如API封装的wx.login() / 微信开发者工具GUI / 微信支付的JS模块都是SDK

# CLI
	Command Line Interface
	通过命令行与应用交互的接口
	例如: git, curl, docker, ls, pnpm等

# SDK CLI
	SDK提供的命令行工具

# MCP
	Model Context Protocol
	LLM交互协议,规范思考顺序/步骤/上下文结构

# Framework
    软件框架, 结构更完整的开发者工具
    常用前端框架
    	- React : 提供组件,自定义,自由度高
    	- Vue : 豪华套餐,一体化快速解决方案(渐进式框架)
    	- Angular : 大型企业项目
    	- Svelte : 魔法编译器, 性能超群,代码最少

# MPA
	多页应用

# SPA
	单页应用

# SSR (Server-Side-Rendering)
	服务器端渲染, 类似"预制菜"的定义
	Tauri需要禁用SSR,原因是Tauri是开发本地桌面应用,

# CSR (Client-Side-Rendering)
	客户端渲染, 类似一堆原材料,客户端(浏览器)自己配置出完整页面

# SSG (Static-Site-Generation)
	静态站点生成

# ORM (Object-Relational-Maper)
	对象关系映射器, 数据库工具集

# SaaS
	Software as a Service 软件即服务

# Sass
    Syntactically Awesome Style Sheets
    CSS预处理器
        * 传统ccs是描述性语言,不是编程语言
            - 代码重复
            - 结构混乱
            - 功能有限
        * Sass
            - 可以定义变量,比如存储颜色,可以多处重复使用
            - 嵌套 : 规则嵌套,结构清晰
            - 继承 : Extend 另一个选择器的所有样式
            - 可以使用数学运算符
            - 提供2种语法格式: Scss 与 Sass, Scss是主流语法

# DevOps : Development & Operation
    自动化流程, 软件开发（Development）与运维（Operations）的一种文化和实践方式

# BaaS
    后端及服务, 主流产品有:
    - supabase

# 数据库的类别
    - Postgres : 关系型, 比如聊天消息存储层, 代表产品:
        - PostgreSQL
        - MySQL
    - NoSQL : 文档型/时序型, 比如聊天的内容, 代表产品:
        - MongoDB
        - ClickHouse
    - 产品后端的主流选择:
        - 阿里云
        - Cloudflare CDN
        - Supabase / Elestio

# 无状态 : Stateless
    不保留任何会话状态, 必要信息在每次请求中由客户端提供
    不适合的应用: 需要上下文存储的聊天

# 无服务: Serverless
    无需开发者管理服务器, 任务处理在临时容器内, 处理完即结束.
    LLM的调用可用无服务架构. 注意!无状态无服务不是一成不变的,混用是常态.

# SEO : 搜索引擎
    Search Engine Optimization (搜索引擎优化), 让你的网站更容易被搜索引擎发现、理解和推荐

# Hydration : 水合
    现代前端框架中的概念, 指: SSR渲染的静态html 与 客户端的js代码关联后, 激活动态交互的功能.
    - 应用场景 : 提升首屏加载速度 / 利于SEO / 兼顾用户体验

# crate : 板条箱
    Rust的单元模块, 类似python pip的安装包

# DOM : 文档对象模型
    Document Object Model (文档对象模型)
    将获取的html转换为内存中可被编程语言(js/ts)操作的副本,直接操作DOM非常消耗性能.
    虚拟DOM, 是指对DOM的轻量级抽象,可以提升性能/简化开发/渲染跨平台

# 语法糖 : Syntactic Sugar
    包装编程语言的快捷方式,方便使用.计算机在执行前会脱糖(Desugaring)还原成基本的语法结构

# HTML : 超文本标记语言
    定义页面的基本构成, 可以理解为房子的 结构 和 骨架. html只关心 是什么 而非 长什么样, - 常用语法:
        <div> <button> <img> ...

# CSS : 层叠样式表
    决定页面的外观和风格, 可以理解为房子的 装修 和 设计. css只关心 长什么样 而非 是什么
    - 常用语法:
        position, color, content, border, margin, padding, background-color ...

# Wasm : WebAssembly
    为web浏览器设计的二进制指令格式, 无法手动修改,自动编译.
    godot导出时,将游戏核心编译成 *.wasm 文件, 在JS代码中加载并实例化wasm, 可以在JS中调用wasm模块里暴露的函数(类似汽车引擎提供wasm动力, JS像方向盘与仪表盘操控汽车)

# Wxml : WeiXin Markup Language
    微信专属的的标记语言, 用来描述页面的结构, 等同于html.
    与 html 的主要区别:
        * <div> -> <view>
        * <img> -> <image>
        * <p> -> <text>

# Wxss : WeiXin Style Sheets
    微信专属的样式表, 描述页面外观, 等同于CSS
    与 CSS 区别:
        * 新增尺寸单位 rpx, 自适应屏幕
        * 不支持高级CSS选择器
# Compiler : 编译器
    将编程语言 转换成 计算机能解读代码 的 一种 计算机程序.
    - 核心工作原理:
        * 词法分析 | Lexical Analysis : 把代码打碎成token(最小词法单元)
        * 语法分析 | Syntax Analysis : 检查token组合是否符合语言规则
        * 语义分析 | Semantic Analysis : 检查代码意思是否合理
        * 优化 和 代码生成
    - 对于typescript来说, 因为是编译成js而非机器语言, 所有把typescript编译成tsc的过程叫做转译器 ( transpiler )

# Regex
    正则表达式, Regular Expression缩写.
    用于匹配字符串模式的工具 , 快速查找、替换或验证文本内容
        * \w+@\w+\.\w+ : 匹配由字母 || 数字 || 下划线组成的邮箱地址

# Entropy
    熵, 衡量数据的随机性或不确定性, 高值->随机, 低值->规律.
```

- 语言笔记

```bash
* 标记语言 : Markup
    * 描述 数据 的 结构 与 语义
    * HTML / XML / Markdown
* 样式表语言 : Style-Sheet
    * 描述 Markup 文档的 外观 与 表现形式
    * CSS / Sass / Scss
* 查询语言 : Query
    * 从 数据库 / 信息系统 / 数据流 中 请求 与 获取 数据
    * SQL / GraphQL
* 编程语言 : Programming
    * 人与计算机沟通的载体, 能够表达 算法 和 逻辑 的语言
    * C++ / Java / Python / JS / TS / RUST / Go
    * 编程语言分类
        * 过程式编程 (Procedural)
            * C : 编译型语言
        * 面向对象编程(Object-Oriented, OOP)
            * Java : 即时编译型
            * C++ : 编译型语言
            * C# : 即时编译型
            * Python : 解释型语言
        * 声明式编程 ( Declarative)
            * JS/TS : 即时编译型
            * Rust : 编译型语言
    * 编译型 : 代码执行前由 编译器 一次性完整翻译,可生成执行文件
    * 解释型 : 代码由 解释器 在运行时逐行翻译并执行
```

- 备份

```bash

Node.js 运行环境
    - 构建工具
        Vite
        Webpack
    - UI框架
        React
            > Next.js
            > Wasp.js
            > Refine.js : 专攻后台
        Vue
            > Nuxt.js
        Svelte
            > SvelteKit
        Qwik
        Solid.js
        Angular

    - 后端框架 : 服务器端框架
        Nest.js
        Express.js
        Ember.js
        Hono.js
分类模块
- 前端框架
- UI组件库
    负责 视觉风格 和 交互体验, 提前预制提高效率
- 路由
    负责骨架, 决定 结构 和 导航
- 状态管理
    负责血液, 驱动 更新 和 交互
- HTTP客户端
- 认证与授权
    负责用户入口
- 数据持久 和 离线支持
    用户本地的数据仓库
    web: localStorage / sessionStorage / IndexedDB
    跨平台: AsyncStorage(React Native) / SQLite / WatermelonDB
- 原生 API 抽象层
    负责统一跨平台API
    一般框架会自带: Tauri, React Native, Capacitor
- 构建系统与工具链
    负责打包
    Vite / webpack / tauri-cli / babel
- i18n 国际化
    负责多语言
    i18next, react-i18next, vue-i18n
开发流程
* 1.目标用户群体
* 竞品分析
前期可以模仿或者轻量的平替
* 设计:
1. 产品功能构想
2. MVP最小可行产品设计
3. 技术架构方案选定
4. UI设计/前端构建/后端构建
* 测试
1. 功能测试
2. 性能测试
3. 压力测试
4. 安全测试
* 部署
1. 云平台存储(比如: AWS/ Axure / 阿里云等)
2. 数据库服务器部署
3. CI/ CD
    - 定义: 持续集成与持续部署,DevOps核心实践之一, 包括以下阶段
        1. source : 提交, 触发构建
        2. build : 构建, 编译打包
        3. test : 测试, 单元测试, 集成测试, 安全扫描
        4. deliver : 部署到测试环境
        5. deploy : 发布到生产环境(持续部署)
4. 建立自动化的测试和发布流程, 实现快速可靠的更新
* 营销
留住用户, SaaS的命脉.
- 用户引导 : 快速上手
- 技术支持 : 帮助文档与在线客服等
- 主动关怀 : 主动联系用户,帮助用户更好地利用产品创造价值
- 数据分析 : 流水/流失率/用户生命周期价值
- 行为分析 : 寻找改进点和新机会
- 商业决策 : 定价策略/产品路线图
架构划分
* UI层 : UI Layer
    - 功能: 负责用户界面与交互
    - 模块: UI组件
    - 框架举例:
        - React + Next.js
        - Vue + SvelteKit(Quik/Nuxt.js等)
* 逻辑层 : Logic Layer
	- 功能: 处理业务逻辑/数据/访问控制等
    - 模块: 导航(路由)/ 状态管理 / 业务逻辑
    - 框架举例:
        - js/ts : Fastify (Express等)
        - Python : FastAPI / Flask / Django
* 构建层 : Build Layer
	- 功能: 静态资源解析/ 打包/ 热更新/ 增量构建/构建上线产物
    - 模块: 构建打包
    - 工具举例:
        - Vite
        - Farm : Rust+Vite兼容
* 数据层 : Data Layer
	- 功能: 持久化用户/业务等数据
    - 模块: 用户入口(Auth)/ API集成/ 数据集成
    - 工具举例:
        - SQL数据库 : MySQL / SQLite / PostgreSQL
        - NoSQL : Mongodb / Firestore / Redis / Cassandra
        - ORM : Prisma / Mongoose / TypeORM

```
