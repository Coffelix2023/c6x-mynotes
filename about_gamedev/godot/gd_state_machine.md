## Godot StateMachine 笔记

[返回 Godot 主页](./about_godot.md)

### 状态机（State Machine）

** 管理游戏流程是一种高效且可维护的设计模式。以下是基于 Godot 引擎的 **专业、模块化状态机系统设计\*\*，可直接作为模板适配到棋类、RPG、策略等各类游戏中。

---

### **1. 核心设计原则**

#### **1.1 模块化（Modularity）**

- 每个状态独立为脚本，遵循 **单一职责原则**。
- 状态之间通过事件（Event）和条件（Condition）通信，**解耦逻辑**。

#### **1.2 可扩展性（Extensibility）**

- 新增状态只需继承基类，无需修改现有代码。
- 支持动态注册/注销状态。

#### **1.3 安全性（Safety）**

- 状态转换需验证合法性，避免非法跳转。
- 提供调试工具和日志跟踪。

---

### **2. 架构实现**

#### **2.1 状态基类（State Base）**

定义所有状态的通用接口，强制子类实现关键方法。

```gdscript
# state_base.gd
class_name StateBase extends Node

# 状态唯一标识（必须全局唯一）
var state_id: String = "undefined"

# === 必须实现的方法 ===
# 进入状态时调用（可传递参数）
func enter(args: Dictionary = {}) -> void:
    pass

# 退出状态时调用
func exit() -> void:
    pass

# 状态内每帧更新
func update(delta: float) -> void:
    pass

# === 可选事件处理 ===
# 接收自定义事件（如用户输入、网络消息）
func handle_event(event: String, data: Dictionary) -> void:
    pass
```

#### **2.2 状态机管理器（State Machine Manager）**

全局单例，负责状态注册、转换和事件分发。

```gdscript
# state_machine.gd
extends Node

# 当前状态和上一个状态
var current_state: StateBase = null
var previous_state: StateBase = null

# 所有注册的状态 [state_id: StateBase]
var _states: Dictionary = {}

# === 核心方法 ===
# 注册状态
func register_state(state: StateBase) -> void:
    assert(not _states.has(state.state_id), "状态ID已存在: %s" % state.state_id)
    _states[state.state_id] = state
    add_child(state)  # 挂载到状态机节点下

# 切换到目标状态
func transition_to(target_state_id: String, args: Dictionary = {}) -> void:
    assert(_states.has(target_state_id), "无效状态ID: %s" % target_state_id

    var target_state = _states[target_state_id]
    if current_state == target_state:
        return

    # 触发退出和进入逻辑
    if current_state:
        current_state.exit()

    previous_state = current_state
    current_state = target_state
    current_state.enter(args)

    # 记录日志（调试用）
    print("状态切换: %s -> %s" % [previous_state.state_id if previous_state else "null", current_state.state_id])

# 发送事件到当前状态
func send_event(event: String, data: Dictionary = {}) -> void:
    if current_state:
        current_state.handle_event(event, data)
```

---

### **3. 实战应用（以棋类游戏为例）**

#### **3.1 定义具体状态**

每个状态继承 `StateBase`，实现业务逻辑。

```gdscript
# state_main_menu.gd
class_name StateMainMenu extends StateBase

func _init():
    state_id = "main_menu"

func enter(args: Dictionary) -> void:
    # 显示主菜单界面
    UI.show_menu("main")
    # 监听按钮事件
    UI.connect("start_button_pressed", _on_start_button_pressed)

func exit() -> void:
    UI.hide_menu("main")
    UI.disconnect("start_button_pressed", _on_start_button_pressed)

func _on_start_button_pressed() -> void:
    # 触发切换到游戏状态
    StateMachine.transition_to("game_playing", {"level": 1})
```

```gdscript
# state_game_playing.gd
class_name StateGamePlaying extends StateBase

func _init():
    state_id = "game_playing"

func enter(args: Dictionary) -> void:
    var level = args.get("level", 1)
    Game.start_game(level)
    Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)

func handle_event(event: String, data: Dictionary) -> void:
    match event:
        "piece_clicked":
            var piece = data["piece"]
            handle_piece_selection(piece)
        "request_pause":
            StateMachine.transition_to("game_paused")
```

#### **3.2 初始化状态机**

```gdscript
# game_root.gd
extends Node

func _ready():
    # 注册所有状态
    StateMachine.register_state(StateMainMenu.new())
    StateMachine.register_state(StateGamePlaying.new())
    StateMachine.register_state(StateGamePaused.new())

    # 初始状态
    StateMachine.transition_to("main_menu")
```

---

### **4. 高级功能扩展**

#### **4.1 状态转换条件验证**

在切换状态前增加条件检查：

```gdscript
# state_machine.gd 扩展
func transition_to(target_state_id: String, args: Dictionary = {}) -> void:
    # ...原有代码...
    if not _validate_transition(target_state):
        push_error("非法状态转换: %s -> %s" % [current_state.state_id, target_state_id])
        return

func _validate_transition(target_state: StateBase) -> bool:
    # 示例：禁止从游戏中直接返回主菜单
    if current_state.state_id == "game_playing" and target_state.state_id == "main_menu":
        return false
    return true
```

#### **4.2 状态历史堆栈**

支持撤销操作（如返回上一个状态）：

```gdscript
# state_machine.gd 扩展
var _state_stack: Array = []

func transition_to(target_state_id: String, args: Dictionary = {}, remember_previous: bool = true):
    # ...原有代码...
    if remember_previous and previous_state:
        _state_stack.push_back(previous_state.state_id)

func rollback_to_previous() -> void:
    if _state_stack.is_empty():
        return
    var previous_id = _state_stack.pop_back()
    transition_to(previous_id, {}, false)  # 避免再次记录堆栈
```

#### **4.3 异步状态加载**

处理资源预加载或网络请求：

```gdscript
# state_loading.gd
class_name StateLoading extends StateBase

func enter(args: Dictionary) -> void:
    ResourceLoader.load_threaded_request("res://levels/level_1.tscn")

func update(delta: float) -> void:
    var progress = []
    var status = ResourceLoader.load_threaded_get_status("res://levels/level_1.tscn", progress)
    if status == ResourceLoader.THREAD_LOAD_LOADED:
        StateMachine.transition_to("game_playing", {"scene": ResourceLoader.load_threaded_get("res://levels/level_1.tscn")})
```

---

### **5. 调试与优化**

#### **5.1 状态监控面板**

在游戏中显示当前状态和堆栈：

```gdscript
# debug_overlay.gd
func _process(delta: float) -> void:
    var text = "当前状态: %s\n状态堆栈: %s" % [
        StateMachine.current_state.state_id if StateMachine.current_state else "null",
        StateMachine._state_stack
    ]
    $DebugLabel.text = text
```

#### **5.2 性能优化**

- **对象池管理**：频繁切换的状态（如 `Loading`）可复用实例。
- **事件过滤**：非当前状态的事件可被忽略，减少无效处理。

---

### **6. 模板化最佳实践**

1. **目录结构**：

    ```
    /states/
       state_base.gd
       state_main_menu.gd
       state_game_playing.gd
       ...
    ```

2. **命名规范**：
    - 状态ID使用全小写+下划线（如 `game_paused`）。
    - 事件名采用 `动词_名词` 格式（如 `piece_selected`）。

3. **文档注释**：
    ```gdscript
    ## 游戏进行状态
    ## - 处理玩家操作和棋子移动
    ## - 可接收事件: "piece_clicked", "request_pause"
    class_name StateGamePlaying extends StateBase
    ```

---

### **7. 跨项目复用**

- 将状态机核心代码（`state_machine.gd` 和 `state_base.gd`）封装为 **Godot插件**。
- 通过 **配置文件（JSON）** 定义状态转换规则：
    ```json
    // transitions.json
    {
        "from_state": "main_menu",
        "to_state": "game_playing",
        "conditions": ["!is_game_over"]
    }
    ```

---

### **总结**

此设计通过 **高内聚、低耦合** 的模块化架构，提供了：

- **清晰的流程控制**：状态切换和事件处理集中管理。
- **灵活的扩展性**：新增状态无需修改现有逻辑。
- **强大的调试支持**：内置日志、监控面板和验证机制。
- **跨项目复用**：核心逻辑与业务逻辑分离。

适用于需要严格流程控制的游戏类型（如策略、RPG、棋类），开发者可在此模板基础上快速构建健壮的状态管理系统。
