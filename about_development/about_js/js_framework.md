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
    wasp new
    cd && wasp start : 将开始自动安装,并运行脚手架在http://localhost:3000/
    # 默认使用js, 如果更换为ts, 需要更改:
        src/MainPage.jsx -> MainPage.tsx, 然后start
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
