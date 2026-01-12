## Faceswap 笔记

[返回索引](../README.md)

---

- 备份

```
* 需要创建conda 中python3.9的变量环境
* conda env list
* 30000张图 (2平方)* 24 / 1.8 = 11GB约 RAM计算公式
* 在你的模型的每一侧至少应该有 500 张不同的图像，但是数据越多，越多样化越好......在一定程度上。要使用的合理数量的图像介于 1,000 到 10,000 之间。添加比这更多的图像实际上会损害训练
* 图片数量换算成视频时长区间范围是：40s至7分钟。可以采用每组1分钟，共7组的组合方式，每组用不同的光线、角度、表情。
* 太多相似的图像对您的模型没有帮助。您需要尽可能多的不同角度、表情和照明条件。一个常见的误解是模型是针对特定场景训练的。这是“记忆”，而不是你想要达到的目的。您正在尝试训练模型以在所有角度、所有条件下的所有表情下理解一张脸，并将其与所有角度、所有条件下的所有表情的另一张脸交换。因此，您希望从尽可能多的不同来源为 A 集和 B 集构建训练集
* 每边的不同角度非常重要
* 在 A 侧和 B 侧之间尽可能多地匹配角度/表情/照明条件也很重要。如果您有很多 A 面的个人资料图像，而 B 面没有个人资料图像，那么模型将永远无法执行个人资料交换

【 Training 】
* 如果您的模型不断崩溃，或者您不断击中NaNs并且无法通过降低学习率或更改批量大小来解决问题，那么增加 Epsilon Exponent 的值应该是您绝对的最后选择。可以针对现有模型调整 Epsilon 指数
*
文件移动
find /path/to/source1/ /path/to/source2/ -type f -exec mv {} /path/to/destination/ \;

脸部生成型Facial tools
NAME	用途	Venv
Wav2Lip	通过wave生成口型	python=3.8, env=wav2lip
3DDFA_V2	根据脸部图片生成obj/uv_tex/3d/depth/pncc/2d_sparse/2d_dense
视频只能生成3d/3d_dense	python=3.9,env=3ddfa


[GFPGAN-onnxruntime]

python demo_onnx.py --model_path GFPGANv1.3.onnx --image_path ./cropped_faces/Adele_crop.png --save_path Adele_v3.jpg
```
