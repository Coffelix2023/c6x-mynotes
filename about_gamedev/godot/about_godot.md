## Godot 笔记

[返回索引](../../README.md)

[StateMachine 笔记](gd_state_machine.md)

[Minigame 笔记](gd_minigame.md)

[示例笔记](gd_samples.md)

---

### 📒 Godot 插件

- 插件识别两个重要文件:
    - plugin.cfg 配置文件
    - gdscript 工具脚本
        - 必须是 @tool 脚本, 否则无法正确加载
        - 必须继承自 EditorPlugin
            - EditorPlugin 类提供的方法: add_custom_type()
- 标准路径: addon / <plugin-name/>

---

### 📒 Godot touch 触控面板操作

测试触控操作
可以通过多种方式实现，以下是一些关键方法和工具：

### **1. 在 Godot 编辑器内模拟触控**

- **启用模拟触控**：
  在编辑器运行游戏时，可通过鼠标模拟触控事件：
    - 在项目设置中开启 `Input Devices/Pointing/Emulate Touch From Mouse`，或直接在运行场景时按 `F1` 启用模拟。
    - 此时鼠标点击会被识别为单指触控。

- **模拟多点触控**：
    - 按住 `Alt` + 鼠标左键拖动：模拟第二根手指的操作。
    - 使用 **虚拟触控面板**（需自行实现或使用插件）：在屏幕上显示可交互区域，便于调试复杂手势。

### **2. 真机测试（必须步骤）**

模拟无法完全替代真实设备，最终需在手机上测试：

#### **Android 设备**

1. **导出项目**：
    - 安装 Android 导出模板（下载并配置 JDK、Android SDK、NDK）。
    - 在 Godot 的 `Project -> Export` 中添加 Android 预设，填写包名、签名密钥等。
2. **连接设备**：
    - 开启手机的 USB 调试模式（开发者选项）。
    - 通过 USB 连接电脑，Godot 可直接选择 `One-click Deploy` 部署到设备。
3. **实时调试**：
    - 使用 `adb logcat` 查看日志：`adb logcat -s godot`。
    - Godot 的 `Remote Debugger` 可实时监控游戏状态。

#### **iOS 设备**

1. **导出配置**：
    - 需要 macOS 和 Xcode，配置 Apple 开发者账号。
    - 生成 `.ipa` 文件并通过 Xcode 安装到设备。
2. **无线调试**：
    - 通过 Xcode 的无线部署功能，避免频繁插拔设备。

### **3. 触控输入调试工具**

- **打印触控事件**：
  在 `_input(event)` 函数中输出触控信息：

    ```gdscript
    func _input(event):
        if event is InputEventScreenTouch:
            print("触控点:", event.index, " 状态:", "按下" if event.pressed else "抬起")
        elif event is InputEventScreenDrag:
            print("拖拽点:", event.index, " 位置:", event.position)
    ```

- **可视化触控点**：
  在游戏中绘制触控点的位置（例如用 `Sprite2D` 或 `Control` 节点实时显示坐标）。

### **4. 测试不同手势**

- **滑动（Swipe）**：
  通过 `InputEventScreenDrag` 事件检测拖拽距离和速度。
- **捏合缩放（Pinch）**：
  处理两个 `InputEventScreenDrag` 事件，计算两点间距离变化。
- **长按（Long Press）**：
  使用计时器检测 `InputEventScreenTouch` 的持续按压时间。

### **5. 多设备兼容性测试**

- **不同分辨率和比例**：
  测试不同屏幕尺寸（如 16:9、18:9、刘海屏等），确保 UI 适配。
- **性能测试**：
  低端设备可能出现触控延迟，需优化代码逻辑和渲染性能。

### **6. 使用第三方工具**

- **自动化测试工具**：
  如 **Appium** 或 **TouchPortal**，可编写脚本模拟复杂触控操作。
- **云测试平台**：
  使用 **Firebase Test Lab** 或 **AWS Device Farm** 在多台真实设备上批量测试。

### **总结**

- **开发阶段**：优先用编辑器模拟和简单真机测试。
- **深度测试**：覆盖不同手势、设备和性能场景。
- **调试技巧**：结合日志输出和可视化反馈快速定位问题。

通过以上方法，可以有效验证触控操作的准确性和流畅性。

---

- 游戏界面分辨率

```bash
# 非像素游戏
    - landscape : 1920 * 1080
    - portal : 1080 * 1920 / 1440 * 2560 / 736 * 1308 / 576 * 1280
# 像素游戏
  640 * 360
```

- 小游戏玩法总结
    1. 一个按键 : 最好让玩家只用一个按键触控游戏(方向键除外)
    2. 节奏与音效很重要
    3. 循序渐进 : 3-5关提升一个难度
    4. Rogue盲盒 : 未知乐趣的上瘾模式
    5. 等级 与 成就 奖励

- 游戏发布平台
    - Steam
        - 每款游戏 $100, 收入超过 $1000 返还 $100, 官方抽成-30%, 直接存入银行账户
        - 提供 Steamworks-API 可以集成Steam功能
    - Epic
        - 无佣金, 收入抽成-12%, 存入 Hyperwallet
    - itch.io
        - 无佣金, 收入抽成-10%(可自行调整), Paypal 和 Stripe
        - Game Jams : 推广作品渠道
    - 小游戏
        - 微信小游戏
        - TapTap小游戏
