## Comfy-SDXL 笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

- 不能使用cache
- 分辨率在768, 1024,portrait与landscapte会得到截然不同的结果
- sampler组合:
    - euler - sgm_uniform
    - sa_solver - sgm_uniform
    - dpmpp_2m - karras

- JuggernautXL_ragnarokBy(hyper/ v9 类似)
    - 偏写实风格, 遵循提示词
    - cfg: 2.5-3.5
    - step16+
    - sampler
        - dpmpp_2m会更好
- Zavychromaxl
    - 偏CG风格, 细腻

- SuperPixelart
    - 像素风
    - cfg: 1
    - step: 8-16

- EpicRealismXL_v7
    - 写实, 对于奇怪的描述不太遵循提示词
    - 推荐dmppp_2m - karras
