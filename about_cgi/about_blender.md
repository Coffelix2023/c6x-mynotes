## Blender 笔记

[返回索引](../README.md)

- 📒 Tips
    - 渲染设置

    ```bash
        1. 采样核心是Volume和Trassport，其他影响不大（开到1-2即可)
        2. 体积建议反弹2，透明Trassparent反弹8， 总采样4
    ```

    - 烟雾测试

    ```bash
    # 制作雪尘：
        1. 粒子发射的关键是控制初始密度与尺寸，大约3-5帧进行由粗到细的变化，可以制造出喷溅效果。
        2. 控制雪尘重量的核心是浮力，-2以下的低温可以让雪尘快速落地。
        3. 烘焙形态满意的情况下，噪波的强度（代表密度）可以值为0，否则下落形态会延迟。
        4. 噪波可以让体积精度更高，是对分辨率的补充。噪波强度（密度）大于2会显得太扰乱，没有雪尘的丝滑。
        5. 雪尘发动粒子与雪块可以在一个粒子系统中分两个子系统同时发射，体积流使用其中一个驱动。
        6. 粒子发射源及初始帧放在域外。

    # Mantaflow Smoke
        1. 初始温差将影响体积运动速度，与Domain的热度是Multiply关系。当初始温度为负数，热度越大，体积下降越迅速。

        2. 让烟变细可以使用粒子尺寸，但不要小于0.2，除非粒子数量在50000以上。

        3. 紊流是个好东西，让体积有纹理，一般尺寸物体，紊流强度在1左右，尺寸会影响体积发散的范围，1以内可以。噪波让细节更多，20左右可以。同时加上轴向的随机扰乱（曲线编辑器）。

        4. 对于快速运动物体，Flow的步长可以在48以上。

        5. Domain的步长可以稍微加快一点，让细节更多，更真实。

        6. 自适配域容易跳帧，记得预览检查。优化可以增加范围48. 阈值0.002。（不推荐自适配）

        7. Domain的自扰乱紊流不宜过大，0.02左右即可。

        8. 最好分模块bake，噪波可以随时修改。噪波会加大一些体积范围，可以将缩放改到1，强度也可以减小。

        9. Volumes Shader Atrribute: color / density / flame / heat / velocity / particle / UV / P / pointiness / generate

        10. Volumes Shader: 将密度属性用两个不同范围（高对比）的渐变，做Add，可以得到细节，同时保留低密度的外圈。

        11. 使用物体的突然膨胀来模拟烟雾是个不错的方法，同时在最大值时开启“使用流”的关键帧，在后一帧关闭流可以得到好的膨胀形态。
    ```

    - 代码

    ```bash
    - 快速删除全部顶点组
        bpy.ops.object.vertex_group_remove(all=True)
    ```

- 📒 ACES

```bash

逻辑: Blende输出保证与Nuke中显示一样
working space: ACEScg ( linear )
View transform: sRGB-ACES ( Output - sRGB)
Look : 这个只有Blender有，是关键，需要将colorspace从ACEScg 切换到 ACES2065-1

ACES1.2 的标准空间：ACES2065-1（这个是所有ACES的核心标准）
input: 文件的空间（工作的空间），一般是ACEScg
显示设备：决定config，ACES或Blender sRGB都可以
view Transhform，监看空间：sRGB

ViewTransform: Blender与Nuke保持相同，sRGB-ACES，
Look(Blender) / ViewProcess(Nuke)：sRGB，保持与VT相同sRGB-ACES
因为直接更改Blender config，所以放在ACES或sRGB类都一样

ACES的核心colorspace都需要：
ACES - ACES2065-1
ACES - ACEScg
ACES - ACEScc
ACES - ACEScct
ACES - ACESproxy

增加以下字段：
displays:
ACES: - !<View> {name: sRGB - ACES, colorspace: Output - sRGB}
active_displays: [sRGB, ACES, XYZ, None]
active_views: [Standard, sRGB - ACES, Raw, False Color]

Colorspace需要把核心ACES的5个代码插入；
一般Arri流程中要加入的是EI800:

Output - sRGB 监看一定要加入：

- !<ColorSpace>
  name: Output - sRGB
  family: ACES
  equalitygroup:
  bitdepth: 32f
  description: |
  ACES 1.0 Output - sRGB Output Transform

    ACES Transform ID : urn:ampas:aces:transformId:v1.5:ODT.Academy.RGBmonitor_100nits_dim.a1.0.3
    isdata: false
    allocation: uniform
    allocationvars: [0, 1]
    to_reference: !<GroupTransform>
    children: - !<FileTransform> {src: InvRRT.sRGB.Log2_48_nits_Shaper.spi3d, interpolation: tetrahedral} - !<FileTransform> {src: Log2_48_nits_Shaper_to_linear.spi1d, interpolation: linear}
    from_reference: !<GroupTransform>
    children: - !<FileTransform> {src: Log2_48_nits_Shaper_to_linear.spi1d, interpolation: linear, direction: inverse} - !<FileTransform> {src: Log2_48_nits_Shaper.RRT.sRGB.spi3d, interpolation: tetrahedral}

Look ！可以忽略，在Blender中View窗口相机背景图像需要勾选View As Render

```
