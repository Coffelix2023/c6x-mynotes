## ComfyUI-LoRA 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

- lora关键词: trigger words

- 后缀名safetensors可以改名为: sft (不推荐,某些工具不识别)

- 自定义缩短名称:
    - lora名最后加\_05表示推荐值, 比如: lora_scale = 0.5
    - lora_A: lora_anime
    - flora: flux_lora
    - qwlora: qwen_lora
    - wlora: wan_lora
    - sdlora: sdxl_lora

```bash
SDXL
# animeoutlineV4_16
    - trigger: animeoutline
    - 可以得到近似工笔勾边

# lighting_v2
    - no-trigger
    - 光影效果

# d4rkl1nes
    - trigger: d4rkl1nes
    - 强对比,低饱和

Flux
    - fluxfast_hyper8_0_1
        # step8, scale=0.1
```
