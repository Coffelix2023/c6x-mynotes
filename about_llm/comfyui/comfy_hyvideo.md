## ComfyUI-Hyvideo 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

- 推荐插件安装(https://github.com/kijai/ComfyUI-HunyuanVideoWrapper)

```cfg
#安装可能失败的解决方案(主要因为tranformers的版本不兼容, 但安全起见先不降级,避免对其他插件造成影响):
    修改插件目录中:
        ./text_encoder/processing_llava.py
        第23行附近, 去掉:
        _validate_images_text_input_order (先备份文件)
```

- 推荐模型仓库(https://huggingface.co/Kijai/HunyuanVideo_comfy)

### 基础流程

- diffusion_model
    - hunyuanimage_lite
    - hunyuanimage_refiner #美化,img2img
    - hunyuanimage_distill #step=8

### text_encoder

    - qwen_2.5_vl
    - byt5_small_glyphxl

## vae

    - huyuan_image
    - huyuan_image_refiner

```

```
