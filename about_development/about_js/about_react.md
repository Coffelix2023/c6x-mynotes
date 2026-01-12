## React 笔记

[返回索引](../../README.md)

---

### 📒 [React](https://react.dev/)

```
React是用于构建用户界面的 JavaScript 库
```

- React-Router

```bash
- 前身是Remix, 一款适用于 React 的多策略路由器(但功能不只是路由)
- 查看官网<https://reactrouter.com/>
- 三种模式:
    - Declarative 声明式
    - Date 数据式
    - Framework 框架式

- 初始模版:
    # Framework Mode
    pnpx create-react-router@latest [my-app]
        # 将默认创建一个模版
        # 初始化git仓库
    cd && pnpm install
    pnpm run dev

    # 可选择模版: 仓库地址
    pnpx create-react-router@latest --template remix-run/react-router-templates/[template-name]
        - minimal
        - javascript
        - node-custom-server
        - node-postgres
        - cloudflare : cloudflare.com
        - cloudflare-d1
        - vercel : vercel.com
        - netlify : netlify.com

    # Data Mode(Declarative mode与此命令一样)
    pnpx create-vite@latest
        - 选项很丰富需要测试

```
