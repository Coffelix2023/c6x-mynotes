## ComfyUI-Frontend 前端笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

### 📒 安装指南

```js
// 1. 在自定义节点的python库建立js目录,比如:
    cf_felixnodes/js/

// 2. 在cf_felixnodes/__init__.py中添加:
    WEB_DIRECTORY = "./js"
    __all__ = [+"WEB_DIRECTORY"]

// 3.检验的最简单示例:
    // 点击节点"MyNode"弹出对话框,保存到js/simple.js
    async nodeCreated(node) {
        if (node?.comfyClass === "MyNode") {
            const original_onMouseDown = node.onMouseDown;
            node.onMouseDown = function( e, pos, canvas ) {
                alert("哎呦！");
                return original_onMouseDown?.apply(this, arguments);
            }
        }
    }
```

---

### 📒 注册扩展

```js
import { app } from "../../scripts/app.js";
//这是注册扩展的第一步:
app.registerExtension({
    name: "唯一名称",
    <调用钩子和对象>,
})
```

---

### 📒 [常用钩子](https://github.com/Comfy-Org/ComfyUI_frontend/blob/main/docs/extensions/core.md#extension-hooks)

- [hook] => beforeRegisterNodeDef

```bash
# 最常用的钩子, 初始画布时调用一次
# 用法
    async beforeRegisterNodeDef(nodeType, nodeData, app)
# 传参解释:
    # nodeType: 构造函数,可通过 nodeType.prototype 重写
    nodeType?.ComfyClass: 通过节点py类名过滤
    onNodeCreated: 节点创建时执行
    onExecuted: 节点执行完成后执行
    getExtraMenoOptions: 添加自定义右键菜单

    # nodeData: 后端元数据,常用于过滤筛选
    nodeData.name: 节点名称
    nodeData.input: 输入
    nodeDate.output: 输出
    nodeData.category: 类别
    nodeData.description: 描述
    # app: 全局应用实例, 提供对画布(canvas), UI组件(ui),API 调用(api)
```

```js
// 示例1 (但官方声明已弃用,因为这种方法会造成全局污染):
app.registerExtension({
    name: "CfxNodes.Example",
    async beforeRegisterNodeDef(nodeType, nodeData, app) {
        // 1. 过滤：只处理我们感兴趣的节点
        if (nodeData.name === "FxShowMeText") {
            // 2. 保存原始的钩子（可选，但推荐，以防冲突）
            const onNodeCreated = nodeType.prototype.onNodeCreated;

            // 3. 动态重写原型方法
            nodeType.prototype.onNodeCreated = function () {
                // 先调用原始逻辑
                if (onNodeCreated) onNodeCreated.apply(this, arguments);

                // 4. 注入我们的自定义 UI：添加一个 Markdown 小部件
                ComfyWidgets["MARKDOWN"](this, "result_display", ["MARKDOWN", {}], app);

                console.log(`已为节点 ${this.title} 注入 Markdown 组件`);
            };
        }
    },
});
```

```js
// 示例 2: 使用 app.registerNodeType改造自定义节点
// ✅ 最佳实践：在注册时直接定义 hook
app.registerNodeType("MyNodeClass", {
    // 基础定义
    name: "MyNodeClass",

    // 直接在 schema 中定义钩子，无需手动处理 prototype 和 apply
    onConnectionsChange(side, slot, connect, link_info, output) {
        console.log("Someone changed my connection!");

        // 如果你需要基类逻辑，v3 会自动处理，
        // 或者你可以通过 super 或特定的 API 访问
    },
});
```

```js
// 示例 3: 使用 nodeCreated 钩子监听然后修改他人节点
import { app } from "../../../scripts/app.js";

app.registerExtension({
    name: "Cfx.SafeConnectionMonitor",

    // ✅ 替代方案：在实例级别进行处理
    async nodeCreated(node) {
        if (node.comfyClass === "MyNodeClass") {
            // 记录原始的实例方法
            const originalOnConnectionsChange = node.onConnectionsChange;

            // 只重写这个【特定实例】的方法
            node.onConnectionsChange = function (
                side,
                slot,
                connect,
                link_info,
                output,
            ) {
                // 执行原始逻辑
                if (originalOnConnectionsChange) {
                    originalOnConnectionsChange.apply(this, arguments);
                }

                console.log(`实例 ${this.id} 的连接发生了变化`);
            };
        }
    },
});
```

```js
// 通过 onConnectionsChage 改变节点外观
onConnectionsChange(side, slot, connected) {
    this.color = connected ? "#224422" : "#333333"; // 连上变绿，没连变灰
}
```

- [hook] => nodeCreated

```js
//创建节点时调用
    async nodeCreated(node)
    - 节点对象属性OP :
        node.title = "";
        node.color = "#00ff00";  # color是标题栏, bgcolor是主色
//在控制台获取node的参数信息,方便调用
    console.dir(node)
        通常有: inputs | outputs | properties | flags | widgets
        然后用 console.log(node.inputs)来常看具体参数属性
        * 示例: 给节点"FxSaveCond"添加一个io.String
                app.registerExtension({
                    name: "NodeCreatedDemo",
                    nodeCreated(node) {
                        if (node.comfyClass === "FxSaveCond") {
                            // 为新建的 MyNode 添加一个额外的文本 widget
                            node.addWidget("TEXT", "extraInfo", "默认值", (value) => {
                                node.setOutputData(0, value);
                            });
                        }
                    },
                });
// 筛选/过滤 节点
/////// 单个节点
    if (node?.comfyClass === "NodeID") {...} 或
    if (node?.comfyClass !== "NodeID") return
/////// 多个节点
    const group = ["node1", "node2"]
    if (group.include(node?.comfyClass)) {...} 或
    if (!group.include(node?.comfyClass)) return
        //常用: group.push(...)添加 / group.pop()删除
        // 使用 .include 判断
/////// new Set方法(去重,迭代, 无索引)
    const group = new Set([...])  //注意()在外
        //常用: group.add(...) / group.has(...) / group.delete(...)
        // 使用 .has 判断
```

- [hook] => onExecuted

```js
// 即是钩子也是属性,也可以建立方法, 便于在执行后获取需要的功能,比如:
    const origOnExecuted = node.onExecuted (先保留先前方法)
    node.onExecuted = function (msg) {
        origOnExecuted.apply(this, [msg])
        console.log(msg)  //于是可以查看执行后的结果, 通用用于前端显示结果
```

- [hook] => init

```js
//在画布创建后、节点加载前，用于一次性资源加载（如预加载图片、获取远程数据）
```

- [hook] => setup

```js
//在整个应用完全就绪后（所有默认节点、UI 已渲染），适合注册 UI 交互、监听全局事件
```

- [hook] => addCustomNodeDefs

```js
//在所有默认节点注册前，允许你添加或修改节点定义（不涉及实际类实现，只是元数据）
// 示例
async addCustomNodeDefs(defs) {
    // 为已有节点添加一个自定义输入
    const target = defs["FxSaveCond"];  #defs仅适用于非nodeCreated
    if (target) {
        // 确保 input 结构存在
        if (!target.input) {
            target.input = { required: {}, optional: {} };
        }
        if (!target.input.optional) {
            target.input.optional = {};
        }

        // 添加可选输入参数
        target.input.optional["extra_path"] = [
            "STRING",
            {
                default: "Felix notes",
                tooltip: "额外的文件路径",
            }
        ];
    }
},
```

- [hook] => 其他钩子

```cfg
📖 getCanvasMenuItems
    #画布上点击右键菜单
    getCanvasMenuItems(canvas)

📖 getNodeMenuItems
    #节点点击右键菜单
    getNodeMenuItems(node)

📖 getCustomWidgets
    # 在 UI 渲染节点时，需要自定义Widget（如自定义滑块、颜色选择器）

📖 registerCustomNodes
    #允许扩展注册额外节点

📖 loadedGraphNode
    #当工作流（graph）被加载到前端后，每个节点实例都会触发一次。适合在节点已经拥有完整属性后进行后处理（如补全缺失字段、绑定额外事件）.

📖 beforeConfigureGraph
    #在工作流（graph） 被 配置（即准备执行）之前。可以对原始 JSON 进行 预处理（如自动填充缺失字段、转换旧版节点）

📖 afterConfigureGraph
    #在工作流配置完成（包括缺失节点的检测）后。适合提示用户、自动下载缺失节点或记录日志

📖 getSelectionToolboxCommands
    #允许扩展向选择工具箱添加命令
```

---

### 📒 常用函数方法 func

- [func] => 获取节点对象的属性(object property)

```js

//在控制台获取node的参数信息,方便调用
    console.dir(node)
        通常有: inputs | outputs | properties | flags | widgets
        然后用 console.log(node.inputs)来常看具体参数属性
        node.bgcolor/color
        node.flags
            node.flags.collapsed
        node.mode
        node.comfyClass: python类名称(节点 ID, 例如 class FxGLM() )
        node.id: 唯一ID, 通常与类名称一致
        node.pos
        node.widgets / widgets_values
            - 通过console.log(ComfyWidgets)查看可用组件
        node.computeSize: 计算节点尺寸,常用于加载时节点尺寸重绘(需要 setDirtyCanvas配合)
        node.graph.setDirtyCanvas(true, true)

// setTimeout({...}, 0)
// 异步黑魔法, 0毫秒的作用是优化延迟阻塞
用法示例:
    node.onExecuted = function(msg) {
        widget.value = msg.text;
        setTimeout(() => {
            const size = node.computeSize(); // 此时浏览器已感知到内容变化
            node.setSize(size);              // 结果：完美适配
        }, 0);
    };

// setDirtyCanvas(true, true)
//画布重绘, 示例:
    if (node.graph) {
        node.graph.setDirtyCanvas(true, true);
    }
```

- [func] => node.addWidget
    - [脚本参考](https://github.com/Comfy-Org/ComfyUI_frontend/blob/main/src/lib/litegraph/src/types/widgets.ts)

```cfg
# 参数:
  比如('类型', '名称', '默认值', callback, options)

# 类型:
  string/text/toggle/number/combo/button/color/image

# 名称 : 前端显示的文本 - 默认值 - callback: 功能函数
  # 不需要的情况: () => {} ,  例如:
    addWidget("string", "image", "", () => {}) - options:
    serialize: true  #是否保存到工作流
    canvasOnly: true  #是否仅在画布渲染(不参与数值)
    socketless: true  #是否创建输入socket
    read_only: true  #是否只读
    multiline: true  #是否多行
    tooltip: "string"  #提示文字
    placeholder: "string"  #占位符
    iconClass: ""  #标签旁的图标类名

  # 如果仅作为前端显示,不参与回调计算, 采用hint的方式:
    const hint = node.addWiget(...)
    hint.disable = true,
    hint.serialize = false,
    ...

 # 隐藏节点的某个组件:
      const \_hideParam = findWidget(node, "<参数名称>")
      \_hideParam.hidden = true;

/////////// 给节点添加组件 1. type[string]: "TEXT"/"TOGGLE"/"BUTTON"/"COMBO" 2. name[string]: 标签 3. value(any): 初始值 4. callback[function]: 函数5. options: min/max/step/values/placeholder等

```

---

### 📒 常用API(官方打包)

- [API调用] => toast

```js
// 在画布右上显示提示的功能
app.extensionManager.toast
//示例:
    app.extensionManager.toast.add({
        severity: "warn",
        summary: "信息",
        detail: "操作已成功完成",
        life: 2000
    });
可以先: const t = app.extensionManager.toast
再赋值: t.add({...})
```

- [API调用] => dialog

```js
// 画布弹出对话框或确认按钮,使用方法同toast
app.extensionManager.dialog.prompt
app.extensionManager.dialog.confirm
   📒 示例:
        app.extensionManager.dialog.add({
            title: "标题title",
            messaget: "消息message",
            type: "default" | "overwrite" | "delete" | "dirtyClose" | "reinstall",

            hint: addWidget,  //可以写入函数从而提示描述为函数内容
        });
```
