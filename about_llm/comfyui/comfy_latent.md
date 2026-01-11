## ComfyUI-Latent 潜在空间笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

```cfg

* ClipAttentionMultiply
* Unet-CrossAttentionMultiply
* Unet-SelfAttentionMultiply
* Unet-TemporalAttentionMultiply
* LatentConcat
    #官方解释: 沿指定维度组合两个潜在样本。它接受两个潜在输入，并沿所选轴（x、y 或 t 维度）将它们连接在一起。在执行连接操作之前，节点会自动调整第二个输入的批量大小以匹配第一个输入
    #相当于拼接image

* LatentInterpolate
    #官方解释: 用于根据指定比例在两组潜在样本之间进行插值，融合两组样本的特征，生成一组新的中间潜在样本
    #相当于简单blend image
    #参数: ratio=0, 产生samples1的副本, =1则是samples2.

```
