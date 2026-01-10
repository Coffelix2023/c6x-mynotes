## RPG Maker MZ 笔记

[返回索引](../README.md)

> RPG Maker MV : $12 | RPG Maker MZ : $38

- 目录结构介绍

```bash
    # js/main.js
    * 游戏启动核心入口
    * 定义了加载scripts的顺序
        1. js/libs/ : 第三方库文件
            - pixi.js : 2D渲染引擎
            - pako.min.js : 数据压缩/解压库
            - localforage.min.js : 本地存储管理
            - effekseer.min.js : 特效库
            - vorbisdecoder.js : 音频解码器
        2. js/rmmz_core.js : 核心基础设施层
        3. js/rmmz_managers.js : 管理器系统层
        4. js/rmmz_objects.js : 游戏逻辑层(游戏对象/数据结构和逻辑)
        5. js/rmmz_scenes.js : 场景系统(标题/地图/战斗等)
        6. js/rmmz_sprites.js : 精灵渲染系统(各类可视化对象渲染逻辑)
        7. js/rmmz_windows.js : 窗口UI系统(UI交互层)
        8. js/plugins.js : 插件配置 和加载列表
```

- 常用尺寸
    - 游戏画面宽高(screen-resolution)
        - 默认 : 816 _ 624 (17 _ 13)
        - 推荐 : 960 _ 540 (20 _ 12) | 1280 _ 720( 27 _ 15 )

- 地图宽高(map-tiles)
    - 默认 : 17 * 13 (48*17=816, 48\*13=624)
    - 瓷砖数量(tiles) = resolution / tileSize(48px)
      比如: 1920 / 48  = 40, 1080 / 48  = 22.5(需要23, 即 1104 px )

- UI布局, 一般等于resolution

- rmmz 默认以 48 \* 48 为基本单元像素宽高比, 以整数倍绘制画布

- 对话变量
    ```bash
    \V[n] : n是角色编号, V 变量 | N 名字 | P 队员
    \{ : 字体放大, 缩小是\}
    \$ : 打开金币窗口
    \! : 等待玩家按下后继续对话, \| : 等待1秒后显示后面的文本, \. 是等待1/4秒
    ```
