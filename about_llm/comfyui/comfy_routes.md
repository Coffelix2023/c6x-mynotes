## ComfyUI Routes 后端路由笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

- 远程通信,实时刷新Combo列表
    - 笔记的由来: 当我需要访问磁盘资源时, 需要采用后端路由的方式.
    - 纯前端的情况---> 当数据已经拿到, 不再需要频繁访问磁盘数据,不需要更新
    - 需要后端路由的情况--->
        - 保存导出的读写
        - 调用模型推理
        - 用服务环境(python库/缓存/列表等)
    - 术语扫盲:
        - asyncio: 使用 async/wait 语法编写并发代码的库, 异步框架基础
        - aiohttp: 适用于asyncio 和python 的异步 http客户端/服务器
        - 示例:

        ```python
        import asyncio
        import aiohttp

        async def fetch(url):
            async with aiohttp.ClientSession() as session:
                async with session.get(url) as resp:
                    return await resp.text()

        async def main():
            urls = ["https://example.com" for _ in range(100)]
            results = await asyncio.gather(*(fetch(u) for u in urls))

        asyncio.run(main())
        ```

- 路由( @routes )
    - @routes.get("/xxx")
        - 注册一个 HTTP GET 处理函数, 用来“读数据、不改服务器状态”的接口
    - 获取资源/查询数据/无副作用
        - 示例:

```python
from server import PromptServer
from aiohttp import web
routes = web.RouteTableDef() #定义一个路由表对象

@routes.get('/hello')   #定义 GET 路由

async def hello(request):
    return web.Response(text="Hello aiohttp GET!")

#创建应用程序并注册路由
app = web.Application()
app.add_routes(routes)

#启动服务器（默认 0.0.0.0:8080）
if __name__ == "__main__":
    web.run_app(app)

@routes.pos("/xxx"): 注册一个 HTTP POST 处理函数
    - 用来“提交数据、创建/修改服务器状态”的接口
    - 提交数据 / 创建更新资源/ 有副作用
    - 示例:
        ### 准备环境, 创建路由表对象routes,等级所有定义的HTTP路由
        from server import PromptServer
        from aiohttp import web
        routes = PromptServer.instance.routes  #ComfyUI服务器主实例

        @routes.post('/my_new_path')  #用装饰器声明一个 POST 路由

        async def my_function(request):  #负责处理该路由的协程函数
            the_data = await request.post()
            MyClass.handle_my_message(the_data) #返回一个字典
            return web.json_response({})  #以json形式响应给客户端
```

- 路由脚本: 从磁盘获取文件列表

```python
import os
import asyncio
from server import PromptServer
from aiohttp import web
from ..core.config*path import *
from ..core.load*presets import *

# 你要列出的目录

OUTPUT_PATH = f"{base_dir}/\_output"

# 固定用法

routes = PromptServer.instance.routes

# 定义获取列表函数,普通同步
def \_get_list(dir_path: str, suffix: str = "") -> list[str]:

    if not os.path.isdir(dir_path):
        return ["None"]

    # 统一成不带点的小写，比如 ".PNG" / "png" 都变成 "png"
    suffix = (suffix or "").lower().lstrip(".")

    results: list[str] = []

    #遍历查找符合要求的文件
    for root, dirs, files in os.walk(dir_path):
        for fname in files:
            name_low = fname.lower()
            # 如果传了 suffix，只保留以 .suffix 结尾的
            if suffix and not name_low.endswith(f".{suffix}"):
                continue
            rel_path = os.path.relpath(os.path.join(root, fname), dir_path)
            results.append(rel_path)

    results.sort()
    return ["None"] + results if results else ["None"]

# 异步处理函数, 从 HTTP 请求中读取参数
@routes.get("/cfx/get_file_list")

async def \_get_file_list(request: web.Request) -> web.Response:

suffix = request.query.get("suffix", "") # 前端传 ?suffix=png # 异步防阻塞事件循环

files = await asyncio.to_thread(
        \_get_list,
        OUTPUT_PATH,
        suffix=suffix
        )

return web.json_response(files)

```
