## ComfyUI-CustomNodes 扩展库笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

```cfg
排名不分先后,由于插件名称命名多样化,按前缀单词进行划分
# custom_nodes_core
comfyui-manager/

# Part1
ComfyUI-ACE_Plus/
    ♻️待研究
ComfyUI-Advanced-ControlNet/
    ♻️待研究
ComfyUI-Advanced-Vision/
    ♻️待研究
ComfyUI-AnimateDiff-Evolved/
ComfyUI-Cam-Control/
ComfyUI-Chibi-Nodes/
ComfyUI-Crystools/
ComfyUI-Custom-Scripts/
    🚩必备
ComfyUI-ELLA/
ComfyUI-Easy-Use/
ComfyUI-Extra-Samplers/
ComfyUI-FlexTools/
ComfyUI-Fluxtapoz/
ComfyUI-Frame-Interpolation/
ComfyUI-GGUF/
ComfyUI-IPAdapter-Flux/
ComfyUI-Inspire-Pack/
ComfyUI-MagCache/
ComfyUI-NormalCrafterWrapper/
ComfyUI-Only/
ComfyUI-VibeVoice/
ComfyUI-WanMoeKSampler/
ComfyUI-WanStartEndFramesNative/
    ♻️待研究
ComfyUI-WanVideoStartEndFrames/
    ❗️NEED INSTALL REQUIREMENT❗️
ComfyUI-WanVideoWrapper/
    ❗️NEED INSTALL REQUIREMENT❗️
ComfyUI-iTools/
    🚩必备

# Part2
ComfyUI_ADV_CLIP_emb/
ComfyUI_Hybrid-Scaled_fp8-Loader/
ComfyUI_Sonic/
    ❗️NEED INSTALL REQUIREMENT❗️
ComfyUI_TiledKSampler/
ComfyUI_essentials/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️

# Part3
comfyui-ccsr/
    ♻️ 待研究
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-depthanythingv2/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-detail-daemon/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-florence2/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-fluxtrainer/
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-hunyuanvideowrapper/
comfyui-image-selector/
comfyui-impact-pack/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-impact-subpack/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-inpaint-cropandstitch/
    要测试
comfyui-inpaint-nodes/
    要测试
comfyui-kjnodes/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-lora-manager/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-marigold/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-prompt-control/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-reactor/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-rmbg/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui-sampler-lcm-alternative/
    ♻️待研究,LCM采样器
comfyui-tcd/
    ♻️待研究,TCD采样器
comfyui-tooling-nodes/
    ♻️待研究,可能没有用
comfyui-videohelpersuite/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️

# Part4
comfyui_controlnet_aux/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️(子文件夹也有)
comfyui_custom_nodes_alekpet/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️(子文件夹)
comfyui_ipadapter_plus/
    🚩必备
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui_ryanonyheinside/
    ♻️待研究,对一切做出反应的节点
    ❗️NEED INSTALL REQUIREMENT❗️
comfyui_tgate/
    ♻️待研究,据说可以提升10%-50%提升速度(牺牲少量画质)


# Part5
KayTool/
    主要节点: 对齐工具, RMBG

RES4LYF/
    🚩 核心功能: 小丑采样器等
    ❗️NEED INSTALL REQUIREMENT❗️
RES4LYF-tester-loop/
    RES4LYF的补充Loop功能

WanMoEScheduler/
    ♻️待研究,Wan模型专业调度器,自动对齐优化shift

cg-use-everywhere/
    🚩便捷的自动寻找端口进行隐式连接

efficiency-nodes-comfyui/
    🚩必备使用节点库.注意早期版本已停止维护,这是持续更新版本.
    ❗️NEED INSTALL REQUIREMENT❗️

fastvideo/
    ♻️待研究,加速视频生成,主要用于Wan系列

gguf/
    🚩另一个gguf节点库,可转换模型格式

ostris_nodes_comfyui/
    ♻️待研究,一些基本扩展节点, 额外提供了LLM提示节点

pre_cfg_comfy_nodes_for_comfyui/
    ♻️待研究,用户CFG函数之前噪声预测的节点

rescalecfgadvanced/
    🚩针对sigmas调节增加细节

rgthree-comfy/
    🚩必备节点库
    ❗️NEED INSTALL REQUIREMENT❗️

seedvr2_videoupscaler/
    ♻️待研究,视频生成辅助
    ❗️NEED INSTALL REQUIREMENT❗️

sigmas_tools_and_the_golden_scheduler/
    必备调度器和采样器

steerable-motion/
    ♻️待研究,视频生成辅助
    ❗️NEED INSTALL REQUIREMENT❗️
teacache/
    🚩必备缓存节点
    ❗️NEED INSTALL REQUIREMENT❗️
was-ns/
    🚩必备节点
    ❗️NEED INSTALL REQUIREMENT❗️
wwaa-customnodes/
    ♻️待研究


# Part6
##一些独立节点
websocket_image_save.py
    将图像保存为websocket格式
example_node.py.example
    官方示例模版
```
