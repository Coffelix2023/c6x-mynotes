## ComfyUI 笔记

[返回索引](../../README.md)

- 开发笔记

[ComfyUI-Frontend 笔记](comfy_frontend.md)

[ComfyUI-Routes 笔记](comfy_routes.md)

[ComfyUI-Samplers 采样器笔记](comfy_samplers.md)

[ComfyUI-Schedulers 调度器笔记](comfy_schedulers.md)

[ComfyUI-Latent 潜在空间笔记](comfy_latent.md)

[ComfyUI-Themes 笔记](comfy_themes.md)

[ComfyUI-API-V3-Schema 笔记](comfy_v3schema.md)

- 提示词参考

[提示词库参考](prompts.md)

- 模型笔记

[ComfyUI-Qwen 笔记](comfy_qwen.md)

[ComfyUI-Wan 笔记](comfy_wan.md)

[ComfyUI-Flux 笔记](comfy_flux.md)

[ComfyUI-HunYuanVideo 笔记](comfy_hyvideo.md)

[ComfyUI-SDXL 笔记](comfy_sdxl.md)

[ComfyUI-LoRA 笔记](comfy_lora.md)

[ComfyUI-Audio 笔记](comfy_audio.md)

[ComfyUI-TextEncoder 笔记](comfy_textencoder.md)

- Custom_Nodes

[ComfyUI-CustomNodes 笔记](comfy_customnodes.md)

[ComfyUI-RES4LFY 笔记](comfy_res4lyf.md)

---

### 📒 基础

```cfg

# 终端连接felixdora: ssh felix@192.168.0.121
# 远程控制(需felixdora开启屏幕共享): open vnc://192.168.0.121
# 通过jupyterlab访问(后台): ssh -fNL 8777:localhost:8777 felix@192.168.0.121
    使用 pgrep -alf 8777 或者 felix@ 查看PID, kill PID号杀死
# 常用环境变量:
    ${CF_LOCAL} : 本地comfyui/目录, mac与fedora保持相同变量名
    ${CF_DISK} : 外置硬盘上的comfyui/目录, mac与fedora保持相同变量名
    ${MYNODES}: 自定义开发节点路径
    $[FE_HOME] ${FE_LOCAL} ${FE_DISK} ${FE_MYNODES} ${CUSTNODES}

# 常用快捷指令:
    comfy-up, comfy-check, comfy-run,
    new-mynodes : 新建自定义节点(来自模版template.py)
    publish-mynodes : 备份自定义节点到publish/
    copy-mynodes : 从mac将自定义开发节点包拷贝给fedora/cf_felixnodes
    custom_nodes : (fedora)进入custom_nodes目录

```

### 📒 模型快速总结

```cfg

# 图像模型
    🔮 Flux1
        -text_encoder
            *采用 clip_l + t5xxl, 对英文提示词遵循良好,不支持中文输入
        -Flux2
            *采用 mistral
    🔮 Qwen
        *text_encoder: qwen_image
        * 用Qwen-image进行图像处理的流程
            🔘 ControlNet 工作流: Qwen-image-IntantX
                ** 标准的 ControlNet 工作流
                ** model_controlnet: Qwen_InstantX-ControlNet-Union
            🔘 Model_patch 工作流: Diffsynth
                ** model_patch:
                    - canny_diffsynth
                    - depth_diffsynth
                    - inpaint_diffsynth
                ** 专用节点: QwenImageDiffsynthControlNet

            🔘 Lora 工作流: Context_Control
                ** 以LoRA方式,控制多种模式的图像输入
                ** 提示词包含: context_control
                ** 注意: 在comfyui中命名是union_diffsynth
    - Hidream
        主要用E1/E1.1进行图像编辑, 但不如Qwen-image-edit.
        # 偏向写实风格,效果很好, 但很吃显存
        I1-full: 需要高步数,速度慢,不推荐创意预览使用.(官方: uni_pc_simple_step50_cfg5)
        I1-dev: 构图会改变, 速度中等(官方: lcm_norm_step28_cfg1_neg0)
        I1-fast: full的精简版,速度最快,构图和full一致.(lcm_norm_step16_cfg1_neg0)

    - Chroma
        *不推荐低端显卡使用,性价比低
        *基于Flux-schnell开发, 容易造成OOG显存报错
        *text_encoder: t5xxl
    - Chrono
        # Nvidia研究团队基于wan2.1开发的多模态编辑型模型, 待研究
        *text_encoder: umt5
# 视频模型
    - HunyuanVideo
    - Wan21
    - Wan22
    - Humo
        # 基于wan2.1的以人为中心的视频技术,多模态条件.
    - LTXV

```

### 📒 自定义子图(subgraph)节点

```cfg

* 导入模型
    SG_Load_Flux
    SG_Load_FluxGGUF
    SG_Load_Qwen
    SG_Load_W21img
    SG_Load_W22img
* 流程处理
    SG_ClipBase : 快速的clip2conditioning节点
    SG_ClipCache : 缓存clip2conditioning到磁盘并读取

* 辅助工具
    SG_Text : 快速的提示词文本工具
    SG_Prompt/PromptPro : 快速整合提示词的工具, 拆分如下:
        * subject : 主题描述
        * details : 对主题的细节补充(不含主题)
        * pos_full: 全部正面提示词合并
        * neg: 负面提示词
    SG_Size : 快速进行empty和image的宽高比定义工具
    SG_Trans : 翻译提示词 以及 识别图像 工具
    SG_Read : 快速导入图像(来自output)
    SG_Wrte : 快速保存图像
    SG_AddInfo : 给输出图像自动添加参数标签
    SG_ImgProcessor : 将图像转换成depth/Canny/Normal等资产的工具

```

### 📒 重要节点调试笔记

- MODELS

```cfg

    ** RescaleCFGAdvanced (推荐)
        变化较小,但细节增强,默认值,或者 start=0.05, end=0.5, multi=1

    ** ScaleROPE
        -可改变构图, 主要参数是scalex/y,shiftx/y, shift_t(时间推移)
        -调试结果: (总结,调整scale会有意外结果)
            scalex/y=1.15-1.3
            shift_x = 0-10 (负值结果不好)
            shift_y = 0, 效果区别不大(不会更好)
            scale_t, 没有影响, 原因未知
            shift_t,

    ** TSR-TemporalScoreRescaling
        -时间分数重缩放
        -默认0.95/1, tsr_k, 1=false, 值越小越细化,越大越平滑.推荐0.95~0.99

    ** ModelSamplingXX
        -适合做微量调整,基础结构不变.调整数值不建议过大.(0-2)

    ** CFGNorm
        -主要用于稳定生成过程, 影响不大,保持默认值1即可

    ** Tangential Dampling
        -处理无条件预测,提高品质.效果影响不大, 可不用.

    ** RenormCFG
        -会适当修改细节,效果有提升, 可保持默认值(100/1)

    ** UNetCrossAttentionMultiply(交叉注意力,调试值没有影响,可不用)
        Unet-Cross(-Self, -Temporal)都没有影响,需要测试

    ** Diferential Diffsion (+ Advanced)
        - 用于图像修复, 在mask掩码情况下适用

    ** EasyCache
        flux 推荐值: s0.1, e0.9, 0.2

    ** ModelPatchFastTerminate
        紧跟在导入model后,可快速中止运行

    ** T-gate
        针对扩散模型,提高10-50%速度, 略微牺牲画质

```

- SAMPLERS

```cfg

    ** DetailDaemonSampler (推荐)
        连接到基础采样器后面,增强图像细节
        detail_amount (0.1) : 推荐=0.35 (0.5也可以,但会有姿态变化)
        exponent (1) : 推荐=0
        smooth (true) : 保持开启, 区别不大
        start/end (0.2 / 0.8) : 保持,区别不大

```

- SCHEDULER & SIGMAS

```cfg

    ## scheduler主要是调整sigma曲线,随着step推近, sigma值下降越快去噪越多.
        - 由此可以解释model sampling的原理,它是为了调整sigma曲率的作用:
        - 需要细节就调小,需要遵循提示词的构图就调大
        - max_shift: 影响前期曲率, 值越大,下降越慢,意味着越尊重提示词, 但后续细节不足.
            * modelSamplingFlux的base_shift: 在默认宽高都是1024的情况下为关闭,仅调整max_shift
        - ms_LTXV也相当于shift_flux, latent端是为了读取尺寸.
        - ms_AuraFlow, shift为3=false, 例如: 当值为0.05,曲线极速下降,代表没有步数思考构图, 特别是步数为及一半,而降噪程度已经低于0.4以下, 则后续细节也会缺失.
        - ms_SD3, 由于flux是flow架构,所以SD3不适用, 但方法与AuraFlow一致.
        - 对于多数modelsamplingshift而言, 1.15和3,可以等于关闭效果.


    ** TheGoldenScheduler
        调整sigma曲线, 适用于SDXL类型(曲率前期极速下降,后续缓慢增加细节)

    ** MultiplySigmas(stateless)
        factor(1=false): 推荐值0.99, 可以得到更丰富细节. 大于1会减低细节,值很敏感,微调.
        可与DetailDaemon搭配使用

    ** OptimalStepsScheduler

```

- GUIDER

```cfg

    ** PerpNegGuider
        比基础CFGGuider增加了垂直负向引导的分量, 会显著增加耗时,效果无明显变化,可不用

```

- LATENT

```cfg

# 图像的潜在空间(计算机识别的图像数据),通过:
    -Vae encoder: 压缩潜在空间的方法
        *empty_latent: 不需要参考图像
    -Vae decoder: 将潜在空间解压释放成人类可看的图像信息
    * empty_latent : 提供给潜在空间一个分辨率范围
        #如果第一次采样没有提供noise_seed, 就得不到图像,而是点阵.
        #初始Latent注入噪音(inject noise)没有效果

```

---

```cfg
# 基础备份(未整理)

# 关于CFG

    * 全称: Classifier-Free Guidance 无条件引导.
    * 分类:
        - conditional: 有条件预测(有提示词)
        - unconditional: 无条件预测 (空条件)
    * 计算公式: output = uncond + (cond-uncond) * CFG_scale

# 关于float浮点精度

    fp32 : 高精度, 标准训练, 兼容性最好
    fp16 : 较低精度, 显存占用低(50%)
    bf16 : 低精度, 显存占用是fp8的2倍, 指数范围同fp32, 适合训练
    ** 以上都仅适用于大于16G以上的显存
    fp8:
        - e4 (e4m3, e4m3fn): 精度高/动态范围小 (优先选择e4m3fn)
        - e5 (e5m2, e5m2fn): 精度低/动态范围大 (e5m2nf风险最高,仅实验性)
        - 优先选择标记scaled, 表示追求低内存且保留细节
            * 无scaled更简单但风险是某些层数值分布被截断（饱和），画面容易出现微妙色块/结构退化
        推荐使用顺序(<16G): e4m3fn_scaled > e4m3fn > e5m2_scaled > e5m2nf

# 关于 Unet 和 Dit

    Unet 是单一功能模块, 更细腻
    Safetensor / Checkpoint 是整体模型, 包括了Unet/VAE/TextEncoder等
    - DiT
        *用Transformer做扩散模型,图文音视频通用,现代加速的复合型主流(Z-image)
        *特点是速度快
    - Unet
        *用卷积的方式,多层传播(卷积金字塔,对称U型,U是下采样和上采样)

# 关于OmniGen2

    OmniGen2 : VectorSpaceLab开发的多模态大模型
        - 继承 Qwen-VL-2.5的视觉理解力
        - 对比主流模型:
            * Wan2.2 : 高质量文生图
            * Qwen-Image : 中文文字的视觉表达
            * Flux1 : 商业级, 加速生态不如OmniGen2

# 提速的启动参数(实验性功能)

    --force-fp16 / --fp16-vae / --fp16-unet
    --oneapi-device-selector
    --cuda-malloc
    --normalvram / lowvram
    --fast
        * 可搭配的参数有: fp16_accumulation fp8_matrix_mult cublas_ops autotune
        * 示例: --fast fp16_accumulation
        * --fast代表全部开启,如果崩溃,则渐进式添加参数,查看是哪个引起的
        * 其中fp8_matrix_mult对品质会有明显影响,需要测试
        --fast cublas_ops : 启用cuBLAS自动优化,针对nvidia gpu
        --fast autotune : 自动调优性能, 优化结果会被缓存, 后续运行更快
        --fast fp16_accumulation : 使用16浮点数进行累加运算, 减少50%显存占用
        --fast fp8_matrix_mult : 启用8bit矩阵乘法, 精度下降,速度提升,可能导致黑屏

## export PYTORCH_ENABLE_MKLDNN=1

    解释: 偏向CPU端优化, 打开PyTorch 在 CPU 上 的 MKL-DNN（oneDNN）加速库，主要加速卷积、RNN 等算子.

## export XFORMERS_ENABLED=1

    解释: 可以显著降低 attention 部分显存，尤其是在高分辨率或较多步数时
        * 必须已经正确安装适配你 CUDA/PyTorch 版本的 xformers

## export CUDA_LAUNCH_BLOCKING=1

    解释: 让所有 CUDA kernel 调用都变成 同步, 会降低跑图速度,需要debug时开启.

- image_edit
    # 图片处理时, 推荐添加 ReferenceLatent, 可以保持图像分辨率一致
- Upscale
  OmniSR_X4_DIV2K #推荐
  4x-NMKD-superscale #推荐
  4x_NMKD-Siax_200k #推荐
  4x-UltraSharp #适用于动漫或CG,比较平滑
  ESRGAN_4x #会过度锐化
  RealESRGAN_x5 #平滑过度
- TEA_cache
  推荐值: 0.4 (min=0,max=1)
  Wan: 0.15-0.3 (min=0~0.1, max=1)
- 服装更换
    - 方法01: SD1.5
        - 基本配置
            - Anythig Everywhere : I/O不用手动连接,自动寻找相同端口
        - 核心逻辑
            - ControlNet : outfitToOutfit_v20
- 关于模型加载精度
  低显存(< 8G)建议在启动时添加参数: --force-fp16.
  特别对于gguf模型容易出现各种精度混搭导致系统错误, 建议用gguf仓库的gguf loader adv: - dequant_dtype: 反量化精度类型, 就是从量化到解量化的过程,float16显存占用小 - patch_dtype: 把patch 合并到主模型权重之前的type定义

```
