## ComfyUI-Wan 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

- 官方仓库的模型类型对比
- [仓库地址](https://huggingface.co/Wan-AI/models)
- Wan2.2
    - Animate_14B: 可替换视频角色
    - Animate_14B_diffusers: 封装成hf-diffuser版本
    - s2v_14B: 根据静态图像和音频驱动包含音频的视频
    - txt2vid_A14B: A表示完整特性(更复杂运动,多场景理解)
    - ti2v_5B: 轻量版本,预览测试用
- Humo
    - 由字节基于Wan21开发的以人为中心的多模态视频生成, 支持图像音频文本输入
    - Humo_1.7B #生成480p, 画质降低, 但音画同步保持,用于测试
    - Humo_17B

- 基础流程
    - clip: umt5_xxl #基于t5xxl的变体,支持多种语言输入
    - vae: wan2.1/2.2 #注意有些wan22流程依然使用wan21vae

### 📒 Wan21 - img2vid

```cfg
# latent:
    WanImageToVideo
    clip_version : clip_vison_h

# lora
    lightx2v_i2v_14B_rank64 #step=4~8

# wan21_VACE
    一站式模型, 用于多模态生成视频: wan21_14b_vace-gguf
# wan21_alpha
    生成透明alpha通道
# Wan21_LoRAs
    lightx2v

# lightx2v的加速推理, 4-8step
    lightx2v_t2v_14B_rank64
    lightx2v_t2v_14B_v2_rank64  #可用于wan21_alpha流程
    lightx2v_i2v_14B_rank64  # 480p, 720p相同lora

# 官方推荐参数: shift=5.0, cfg=1.0(no cfg)
    fusionX

# fusion的加速推理, 动作稍逊与lightx2v
    wlora_wan21_i2v_14B_fusionX

# CausVid Loras: causvid lora仅用于wan21_txt2vid
    wlora_wan21_t2v_causvid_14B_rank32
    wlora_wan21_t2v_causvid_14B_rank32_v2
    # 进一步精简,解决闪烁问题,但需要更多step
    # no_first_block: 跳过最开始几个处理层(encoder blocks),便于流畅度(但不完全忠于原图)

    A14B-moe

# A14B_moe是为wan22_i2v_low_noise推理, 但适用于wan21_i2v, 效果比较夸张
    CineScale

# cinescale待测试
    jiggle_tits # 抖动完美胸部
    triggle_word: jiggle_tits
```

### 📒 Wan22 - img2vid

### 📒 Wan 变体

```cfg
# Phantom_wan21
    字节跳动基于wan的主体一致性视频, 使用diffusion_model
    model: phnton_wan_14B
    vae: wan2.1

# CausVid_wan21_txt2vid
    也有同名lora: wlora_wan21_causvid
    model: causvid_wan21_t2v_14B
    vae: wan2.1

# Humo_wan21
    同phantom,都是字节跳动基于wan21的主体一致性视频, 支持音频输入输出, s2v, i2v
    model: humo_wan21_17B使用safetensors, 1.7B使用gguf

# ATI_wan21
    控制视频的任意轨迹(待研究)
# InfiniteTalk
    WanVideo Model Loader  #节点的输入端参数

# multitalk_model:
    infinitetalk_multi.sft
    infinitetalk_single.sft

# fantasytalking_model

# Magic_wan22
    根据wan22-t2v-14B推理,用于txt2vid,走wan21_t2v流程

# Rapid_AIO
    Wan2.1与Wan2.2合并的AllinOne
        step=1~4
        sapmler: sa_sover/beta,

# Moviigen1.1
  wan工作流, 无限长度的movie,提示词尽可能详细, 使用diffusion_model

# Wan22_Animate
    用于替换视频的人物, 使用diffusion_model (18G)
    model: wan22_animate
    lora: relighting
```
