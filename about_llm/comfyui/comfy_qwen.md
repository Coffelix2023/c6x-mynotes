## ComfyUI-Qwen 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

> 流程: clip = qwen_image, vae = qwen_image

> 最佳分辨率: 1328\*1328

### 📒 Qwen-Image

```cfg
    - diffusion_model:
        - qwen_image_fp8_e4m3fn.safetensors #基础模型(不能开启fp8_fast)
        - qwen_image_distill_full_fp8_e4m3fn.safetensors #蒸馏模型,某些细节会细化
    - text_encoder
        - qwen_2.5_vl_7b_fp8_scaled.safetensors
    - vae
        - qwen_image_vae.safetensors

# sampler
    res_2m/2s
    euler_sgm #用于测试
    res_multistep_sgm #用于测试(细节多,但稍显油腻)
    dpmpp_2m_k #成品
    dpmpp_3m_k #成品备用

# 其他参数
    shift: 采用shift flow (SD3得到花屏, AdvRes不可用,)
    CFGNORM=1
    latentSD3
```

### 📒 Qwen_Image_edit

```cfg
# diffusion_model:
  qwen_image_edit_2509 (8s/it)
# text_encoder与vae相同
    # 需要 TextEncodeQwenImageEditPlus 作为文本编码器
# 4step加速时,step=6最佳结果

# add TextEncodeQwenImageEdit: 用于读取更多图片
```

### 📒 Qwen_image_edit 变体

```cfg
# Rapid_qwen_iedit_nsfw
  sampler(step=4): sa_solver_simple
  sampler(step=8): lcm_beta, euler_a_beta
```

### 📒 Qwen_Lora

```cfg
# Qwen-Image-Lightning-8steps-V2.0.safetensors # 8step加速 #强化类(无需lora提示词)
  qwlora_Daal3D.safetensors
  qwlora\*CCM-R-Daal.safetensors
  qwlora\*animeAndReality.safetensors
  qwlora_enhancer.safetensors # scale=0.8, 低步数有瑕疵

# 写实照片风格
    qwlora_Insta_girl.safetensors  #NSFW, no_words
    qwlora_analog.safetensors  #no_words
    qwlora_masterpieces  #no_words, 0.75, 比较不遵循提示词,意外效果
    qwlora_iphone.safetensors  #人物外貌变化较大, no_words
    qwlora_samsung  #真实的低质感手机摄影, 平光,no_words

# 电影摄影
    qwlora_80sFantasyMovieStill.safetensors  #效果不明显
    qwlora_film_still.safetensors  #no_words

# 动画类
    qwlora_colorManga.safetensors  #colorManga, 细节加多
    qwlora_flatAnime.safetensors  #no_words,日漫
    qwlora_neoArcanismo.safetensors  #风格未知, 偏向美漫,不太遵循提示词
    qwlora_painterly.safetensors  #厚涂风
    qwlora_winniePoohArt.safetensors  #word: winniePoohArt, 治愈清爽画风,低饱和度

# 镜头连贯的qwlora: next_scene
    # scale=0.8, next scene前缀提示, 摄像机开头提示.
    #示例:
    Next Scene: The camera moves slightly forward as sunlight breaks through the clouds, casting a soft glow around the character's silhouette in the mist. Realistic cinematic style, atmospheric depth.

# flymy.ai
    inscene: #保持主体一致性
    realism: #触发词:realism
    insubject: #一致性

# Qwen的细节增强 - 结合clown sampler:
    clown-option-detail-boots
    Detail-Daemon-Sampler

    #强度推荐值(0.3~0.5)
    start=0.1~0.2
    end=0.8~0.9
    exponent打开代表微调,建议关闭
    smooth保持开启
    supreme采样器不适用
```
