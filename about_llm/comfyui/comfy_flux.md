## ComfyUI-Flux 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

```cfg
# 流程:
    双clip (clip-l + T5), vae = ae,
# 快速总结
    以写实为主, 风格方面非常欠缺,除非搭配lora, 社区推荐hidream, chroma进行风格尝试 # flux的问题在于不太遵循提示词,qwen这方面做得比较好 # schenll可以快速验证结果(最低4step), krea和dev都可以调试. # 分辨率不低于1k(width >= 640) # flux推荐exponential/res_2s (beta57), res_2m不能使用hyper8, step>20 # weight_dtype选择fast来快速测试 # 使用ClownSampler时, eta默认0.5, 0接近euler效果,可以调试测试 # Flux_fill/OneReward:
-add InpaintModelConditioning, noise_mask=true
-add Differential_diffusion: 消除接缝
-add CFGNorm: 区别不大,需要测试
-add FluxGuidance: 30 (默认3.5=false), 值越高越匹配原图品质 -不可以使用referenceLatent (Qwen需要) # flux标准分辨率是1024 \* 1024, 当4:3构图时上下会有遮幅,推荐比例是16:9/9:16/1:1

# 基本信息
    主要模型
        flux-dev
    综合类型
        flux-krea #首选! 比较遵循提示词, 美学分数高
    flux-schnell
        step4-8 #快速预览版本
    flux-kontext
        #图像编辑模型

    - text_encoder
    - t5xxl : 推荐用fp16版本
    - clip_l : 推荐用hidream版本

# clip text encode采用统一即可(按clip_l 与 t5xxl分开的方式不一定好)
    - vae
    - ae
    - sampler
    euler_normal (sgm会有点油腻)
    - ModelSampling
    AuraFlow, flux
    lora #提高品质
    hyper8 #加速到8step, scale=0.1
    enhancer #scale=0.5 #动漫类 \* anm #scale=0.6

# Flux Lora
    - hyper8/16 #加速推理
        - lora_scale=0.13
    - flux_kontext_pixel_style #像素风格
        - triggle_word: pixel style art
    - flux_kontext_felt_style #毛毡风格玩具
        - triggle_word: turned into plush felt toy
    - flux_kontext_miniature_scene #微缩景观
        - triggle_word: a meticulously crafted miniature scene
    - flux_dev_filmportrait #电影海报美学
        - triggele_word: film grain, filmfotos,
    - uno #字节跳动的高度一致性lora
        - flora_uno
    - uso #字节跳动的统一风格lora
        - flora_uso
    - umo #字节跳动的身份统一lora \* flora_umo
    Flux 模型扩展家族
    \*\*当前测试做多的是写实类,CG与Anime待测试

# SRPO
    # ClownSampler对SRPO无效,Ksample需要启用Hyper8
    # 不可用fp8_fast
    # sampler优先测试: deis_2m/ res_2s, (legendre_2s速度慢2倍)
    # Ksample更接近中国人特征

#  🚀Fusion
    - 加速版本, fusionV2_gguf效果比fusionDS好
    # euler效果最好,其他不稳定.
    # ClownSampler流程Step=4

# Flux_lite
    - FluxD的精简版本, 偏向广告风格,与FluxD同样的问题,不太遵循提示

# Mania
    - 日常的写实风格强烈推荐, 幻想类不太好.对文字不擅长, maniaLegacy也可以测试

# Blaze
    - 和Mania, fluxK一起在创意初期进行测试

# Mann-E
    - 作者建议添加提示词: mj-v6.1-style
    - 效果一般

# pixelwave
    - 作者建议: dpmpp_2m/sgm/beta, step=15/30
    - 偏向写实类, 效果一般

# AcornSpinning
    - 效果比较柔,适合CG向

# 采样器比较
```
