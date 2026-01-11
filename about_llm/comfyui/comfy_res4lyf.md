## ComfyUI-RES4LYF 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

```cfg


* ClownSharkSampler
- SharkSampler
    * 需要接入sampler才完整的采样器,
- BongSampler
    * 等同于eta=0的 SharkSampler, 也相当于🔘BONGMath关闭

- ClownSharkSampler
    * 等同于将clownsampler(单纯采样器,seed = -1)+Sharksampler结合.
    * 如果clown-sampler的seed不为-1, 将会影响结果. 因为shark_sampler本身也有seed, -1表示继承先前的参数.
    * eta: 每一步去噪的同时增加一些新的噪音,丰富图像细节,默认0.5 (0-1), 1为更多随机噪音.
    * BongMath: 更少步数获得高质量图像的方法(用于噪音计算/缩放/调度的数学方法)

- SharkOptions:
    * 可以用于shark sampler和 clown shark sampler
    * 控制采样前的初始noise
        Perlin: 配合flux可以得到低饱和图像,可能会模糊.
        hires-pyramid-bicubic: 高阶金字塔插值,细节及其丰富,适合写实.
        studentt: 和其他pyramid适合Anime.
        颜色类:
            white = gaussian
            brown: 细节更多
            violet(blue): 包含更多细节
        s_noise_init: noise_stdev, 增加噪声大小,推荐1.05-1.1.(更大会模糊)
        denoise_alt: (img2img)缩放sigmas schedule, 覆盖denoise设置.
        channelwise_cfg:
- ClownOptions:
    * 可以用于clown sampler和 clown shark sampler
    * Extra-Optionn:
        额外的脚本,目前已知参数:
            - x_preview: 当comfyui设置preview auto时, 显示噪点分布情况.
            - eps_preview: 预览反转色
    * SwapSampler:
        到指定步数更换采样器,有助于提升细节.比如从res_2m -> res_2s
    * SDE
        #负责控制每步(子步)后添加的noise.
        - noise_type_sde/substep: 推荐brownia
        - noise_mode_sde/substep: 实际noise从hard->er4由强到弱.
            -hard_var: 强度最弱,但是唯一"数学校正"缩放.
            -Sinusoidal: 正弦曲线为 weak -> strong -> weak
            -soft: 从强极速降为弱(风格会有改变, 可以尝试不同风格)
        - noise type与mode要同时开启才有用
    * Step Size (可不用)
        #主要控制overshoot(过冲步长), 搭配SDE,可造成柔化效果(要小心使用)
        - overshot_mode/substep: 一般只调整子步长会不太影响构图,hard最强
        - overshot/substep: 较大的值会柔化

    * Sigma Scaling
        #打破SDE的噪声缩放数学.
        s_noise: 推荐1.05`1.1,显著提高绘画图像的饱和度,substep保持1.
        noise_anchor_sde : 0.5作为起步, 越小使图像看起来脏
        lying: 0.95开始, 值越低越脏.

    * DetailBoost
        #Detail_Daemon的替代品
        method: mode为推荐参数
        mode: 正弦为推荐

    * Implicit Steps (性价比不高)
        #隐式步骤,会加重渲染时长,可以减少总step来获得更高的质量.

- 参数:
    * eta: 控制每一步之后添加的noise量.0值等同于euler_normal, 保持默认0.5.
    * noise_type_init: 初始noise类型, 默认gaussian等于ksampler
    * noise_type_sde: sde采样期间的noise类型
    * noise_mode_sde: 添加eta(下一步noise)的方法, hard最强
    * steps_to_run:
        -1代表所有step.
        ⚠️当模式为resample(多次采样)时, -1表示运行剩下所有步骤.
        ⚠️多次采样时,seed = -1, fixed, 表示继续运行的步数,配合steps_to_run
    * sampler_mode: 一般第一个采样器为standard, 后续选择resample等于继续之前的latent潜在图像包括noise方式进行后续采样.会禁用噪音添加.
    * implicit_steps: 隐式步骤, 每增加1步,计算时间成倍增加.
    * denoise: 仅限于img2img时,对原始图像的保留程度, 0为完全保留.
    * denoise_alt: 仅限于img2img, 乘以denoise.
    ### sde和ode的区别 : 针对增加的noise随机性, sde每一步都随机抖动, ode更稳定.根据不同类型选择, 而 Uni_pc,是在ODE基础上进行的更准确的新采样器
* 链式多重采样
主要节点: ClownsharkChainsampler
    - 第一个为clownsharksampler标准采样(standard模式)
    - 后续皆为 chainsampler(resample模式)
        ** chain只需连接前一个latent即可, 设置继承
        ** step_to_run : 设定继续采样的步骤, -1是采样剩余所有步数
```
