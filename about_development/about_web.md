## Web 笔记

[返回索引](../README.md)

---

```bash
    # HTML 标记语言(Markup Language)
        * 超文本标记语言 ( Hyper-Text-Markup-Language)
        * 用于结构化web网页和内容的标记语言
        * Markup(标记): 嵌入文本中的标签或指令,描述内容的 结构 或 呈现方式, 行业规范是<img 加/><meta>不加
        * HTML / XML / Markdown /LaTexX 都是标记语言

    # CSS 样式表语言(Style Sheet Language)
        * 层叠样式表, 为web内容添加样式的代码
        * 唯一目的: 描述web内容的外观和样式
```

- HTML 基础

```html
    成对标签 : 例如<p></p>
    自闭和标签 : 例如<img> / <meta> / <br>
        * 注意 : XHTML中,所有标签必须明确闭合(及句尾加/>), HTML5 中 / 是可选的,都是合法的
    * <!DOCTYPE html> : 标准声明
    开头第一行, 保证文档正常读取( 正确解析/ 编写规范 / 统一标准 )
    * <html> </html> : 根元素
    整个页面所有内容
        * <html lang = "en" > : 默认浏览器页面语言
            * zh-CN (简体) | zh-TW/HK
            * 其他用法: <p lang="zh-HK">
    * <head></head> : 元数据
    想要包含但不展示的内容
        * <meta charset="utf-8">  :  UTF-8
        * <meta name="viewport" content="width=device-width"> : 适配所有屏幕
    * <title></title> :
    标签页标题
    * <body></body> : 展示内容
    包括文本/ 图像/ 视频/ 游戏 /音频等全部内容
    * <img>
    <img src="图片" alt="这里是图片不可见是的占位文本, 网络不佳或视觉障碍辅助朗读">
    * Markup 标记文本
    <h1><h2><h3><h4>
    <!-- 注释 -->
    <p>段落</p>
    <ul> <li>无序列表 (Unordered List)
    <ol> <li>有序列表 (Ordered List)
    * 链接 <a>
    <a href="URL"> 链接 </a>
        * href : hypertext reference超文本引用
    * 强调
    <i></i> : 单纯的斜体
    <em></em> : 推荐视觉障碍辅助斜体,会改变朗读语气
    <b> : <strong> : 粗体, 推荐strong
    * <span>
    行内容器标签, 可以应用特点的CSS.
    <span class="代号"> 要应用CSS的内容 </span>
    <span style="color: red;"> 这是红色 </span>
    * <div>
    块级无语义元素
    * <script>
    引入js/ts脚本,以作用于html及其css
    * <input>
    输入框
        * type = "text" , 常用
        * aira-label = "curren word" , 无障碍标签
```

- CSS 基础

```bash
# 编写规则
    1. 每个规则都在{}里
    2. 规则里多个属性间用分号;结尾, 最后一列也加分号
# 布局的常用属性
    * padding : 内边距
    * border : 边框
    * margin : 外边空间
    * width
    * border-width
    * backgournd-color
    * color
    * text-shadow
```

### 📒 开发web app流程工具推荐

```bash
- 构建流程
    - 设计 : Figma
    - 部署与托管 : Netify
    - 数据库 : Supabase
    - 版本控制 : Github
    - 移动程序开发 : Expo
    - 付款 : Stripe
```

### 📒 HTML 笔记

---

### 📒 爬虫

- [Crawlee](https://github.com/apify/crawlee)

```bash
- Crawlee 是一个基于 Node.js 的网络爬虫和浏览器自动化库，用于构建可靠的爬虫。它使用 JavaScript 和 TypeScript 编写，支持提取数据以用于人工智能、LLM、RAG 或 GPT 模型。Crawlee 还支持从网站下载 HTML、PDF、JPG、PNG 和其他格式的文件，并可与 Puppeteer、Playwright、Cheerio、JSDOM 和原始 HTTP 协议配合使用。它支持有头模式和无头模式，并支持代理轮换

# 包含三个主要爬虫(crawler):
    CheerioCrawler
        # 普通的 HTTP 爬虫, 效率高,但无法处理js渲染
    PuppeteerCrawler
        # headless进行爬取,调用chromium
    PlaywrightCrawler
        # Puppeteer 的继任者，功能更强大、更全面,最佳选择

# 初始化
    pnpx crawlee create crawlee-demo  #会提示选择爬虫类型
    pnpm install crawlee
    pnpm install crawlee puppeteer/ playwright
```
