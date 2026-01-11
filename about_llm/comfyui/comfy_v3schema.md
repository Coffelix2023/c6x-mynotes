## ComfyUI-API-V3-Schema 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

> [官方举例](https://docs.comfy.org/custom-nodes/v3_migration)

- [io.Input]

```python

    # io.Int.Input()
        Float |String |Boolean |Combo |Image |Mask |Model ...
        (strength", default=1, min=0, max=10)

    # DynamicCombo.Input()
        #可以动态调整子选项列表的高级Combo, 没有default参数
        options=[
            DynamicCombo.Option(
                key="<唯一标识, 父选项>",
                input=[  #用法类似父级的io.Input
                    io.Combo.Input(
                        "子选项名称"
                    ),
                ]
            )
        ]

        def execute(cls, mode:dict) -> io.NodeOutput:
            #DynamicCombo 执行函数的用法:
            n = mode.get("mode")  #父选项相当于是字典dict{key:value}
            if n == "<somekey>":
                result = mode.get("<key对应的va>", "")
            elif n == "..."
            ...

    def execute(cls, images) -> io.NodeOutput:
        #⚠️重要,在前端节点预览图像有两种写法:
        # 第一种, UI组件对象,非json
        return io.NodeOutput(
            images,
            text,
            ui=ui.PreviewImage(images, cls=cls),
            ui=ui.PreviewText(text, cls=cls),
        ),
        # 第二种, 保存了json dict(不一定会有预览产生,但测试目前是有预览)
        return io.NodeOutput(
            images,
            ui={
                "images": results,
            },
        )

```

- [io.Output]

```bash

    io.Image.Output("result", display_name="result")

    display_mode=io.NumberDisplay.number/slider/knob(knob目前不识别)

    Schema.node_id, display_name, category, inputs, outputs, hidden, description,
    is_input_list, is_output_node, is_deprecated, is_experimental, is_api_node,
    not_idempotent, enable_expand

# [快速参照表]（按 io_type 字母/功能）
    - 主要 widget
        BOOLEAN,INT,FLOAT,STRING,COMBO,WEBCAM

    - Tensor-like:
        IMAGE,MASK,LATENT,SIGMAS,NOISE

    - Conditioning+Sampling:
        CONDITIONING,SAMPLER,GUIDER

    - Models:
        MODEL,VAE,CLIP_VISION,CLIP_VISION_OUTPUT,STYLE_MODEL,GLIGEN,LORA_MODEL,UPSCALE_MODEL,LATENT_UPSCALE_MODEL,

    - Multimedia:
        AUDIO,VIDEO,SVG,AUDIO_ENCODER*

    - 3D:
        LOAD3D_CAMERA,LOAD_3D,LOAD_3D_ANIMATION,VOXEL,MESH

    - Misc:
        HOOKS,HOOK_KEYFRAMES,TIMESTEPS_RANGE,LATENT_OPERATION,
        FLOW_CONTROL,ACCUMULATION,LOSS_MAP,PHOTOMAKER,POINT,
        FACE_ANALYSIS,BBOX,SEGS,*

    - AnyType
        COMFY_MULTITYPED_V3,COMFY_AUTOGROW_V3,COMFY_COMBODYNAMIC_V3,
        COMFY_MATCHTYPE_V3, etc.

```

- 参数

```bash

    display_name="",
    force_input=True #强制为端口(不会有string文本框)
    default_input=True  #同force_input
    placeholder=""
    optional=True, #可选端口,没有连接不会报错
    tooltip=""
    default=""
    multiline=True  #多行文本
    label_on="开启" # io.Boolean.Input专用
    label_off="关闭"
    rawLink (raw_link): 需要测试
    dynamicPrompts(dynamic_prompts): 需要测试

```

- 常用import

```python

    from comfy_api.latest import ComfyExtension, io,ui  #必须导入
    from typing_extensions import override  #必须导入
    from aiohttp import web  #暴露api端口用,一般不用添加
    from server import PromptServer  #暴露api端口用,一般不用添加

```

- 目录结构

```cfg
1. felix_extension.py
    #必须导入的函数
    from compy_api.latest import ComyExtension, io
    from typing_extensions import override

    #导入多个节点,新增节点需要在下面添加
    from .felix_first_node import *
    from .node_googleTrans import *

    #注册节点
    class FelixExtension(ComfyExtension):
        @override
        async def get_node_list(self) -> list[type[io.ComfyNode]]:
            #新增节点在下面添加
            return [
                FelixFirstNode,
                GoogleTrans,
                ]
    #注册后调用的入口, 新增节点也不用修改
    async def comfy_entrypoint() -> FelixExtension:
        return FelixExtension()

2. __init__.py
    #从FexliExtension扩展中调用entrypoint入口,新增节点不用修改
    from .felix_extension import FelixExtension, comfy_entrypoint
    __all__ = ["FelixExtension", "comfy_entrypoint"]

```

- 自定义节点开发流程

```cfg

# ========== 单个节点的编写:
    ## 导入api函数
    from comfy_api.latest import ComfyExtension, io, ui
    from comfy_api.latest._io import *
    from comfy_api.latest._ui import *
    from typing_extensions import override

# ========== 常用api函数
    import comfy.sampler
    from googletrans import Translator
    import os
    import aiohttp
    import asyncio
    import json
    from typing import Dict, Any

    #节点模块核心, 固定用法
    class NewNode(io.ComfyNode) :
        @classmethod
        def define_schema(cls) -> io.Schema:
            return io.Schema(
                node_id="节点ID",  #驼峰写法
                display_name="节点名称",  #UI界面中的节点唯一名称
                category="节点的类别",  #如果用module排序就看不见该名称
                inputs=[
                    io.XXX(),  #一系列的组件输入
                ],
                outputs=[
                    io.XXX(),  #一系列的组件输出
                ],
            )
        #执行节点的核心逻辑
        @classmethod
        def execute(cls, output_name, ...):
            #实现功能的方式
            return io.NodeOutput(output_name, ...)

    #新的节点自定义方式(V3)
        阅读文档: https://docs.comfy.org/custom-nodes/v3_migration

```

- 基础命令

```cfg

    - 官方安装文档: https://docs.comfy.org/zh-CN/installation/manual_install#nvidia
    - 搭建虚拟环境.venv
    - 安装GPU依赖:
    conda install
        pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
    - git pull进行仓库更新
    - uv pip install -r requirements.txt 安装全局依赖
    - extra_model_paths.yaml 配置额外模型目录
        my_custom_nodes:  #自定义节点的额外路径
            custom_nodes: PATH/extra_custom_nodes
    - comfyui命令工具
        uv pip install comfy-cli
        comfy --install-completion #自动补全
        comfy model download <url> models/checkpoints  #下载模型
        # pip 安装报错解决方案 (uv 创建的虚拟环境有可能报错)
        # uv 创建虚拟环境的完整命令: uv venv <venv-name> --python 3.12
            python -m ensurepip --upgrade
            python -m pip install --upgrade pip setuptools wheel
        常用命令:
            comfy update
            comfy run --workflow <path-file>
            comfy node scaffold #固定用法, 创建自定义节点, 注意目录在custom_nodes/里面

```
