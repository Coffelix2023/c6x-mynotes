## Blender 笔记

[返回索引](../README.md)

[**常用链接**]

- [Blender5.0 手册](https://docs.blender.org/manual/en/5.0/index.html)
- [Blender Python API](https://docs.blender.org/api/4.2/info_quickstart.html)
- [插件开发基础教程](https://docs.blender.org/manual/en/4.2/advanced/scripting/addon_tutorial.html#)
- [Blender 环境目录](https://docs.blender.org/manual/en/5.0/advanced/blender_directory_layout.html#)

🔘 [**Blender-Cli**]

- [管理扩展的命令-官方文档](https://docs.blender.org/manual/en/5.0/advanced/command_line/extension_arguments.html#)

```bash
blender -c(--command) extension list (-h)  # 列出已安装的 blender addons
blender -c extension update # 更新所有扩展
```

🔘 [**Blender Extension/Addon 笔记**]

```bash
# [重要更新]
# blender5.0版本推进Extensions体系,将扩展打造为流程标准化.
# 构建前检查(无需构建)
    blender -c extension validate
# 构建扩展(单个.py文件的插件归于旧版)
    blender -c extension build
```

🔘 [**Blender 插件开发**]

- 两个主要文件:
    - `__init__.py`
        - 入口文件
        - 定义 `bl_info` (可选, 新版已经在`manifest`中体现)
        - 注册/反注册：`register()` / `unregister()`
        - 导入并注册各个模块里的 `classes`
        - 核心逻辑（网络请求、解析、线程、UI 细节）放在单独模块里
    - `blender_manifest.toml`
        - 统一元数据入口
        - 兼容性与安全/权限声明的载体（随着扩展体系发展越来越重要）
        - 分发/更新机制依赖, 统一分发与版本管理

🔘 [**Tips**]

```bash
# 渲染设置
    1. 采样核心是Volume和Trassport，其他影响不大（开到1-2即可)
    2. 体积建议反弹2，透明Trassparent反弹8， 总采样4
# 代码
    # 快速删除全部顶点组
    bpy.ops.object.vertex_group_remove(all=True)
```

🔘 [**ACES Settings**]

```
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
