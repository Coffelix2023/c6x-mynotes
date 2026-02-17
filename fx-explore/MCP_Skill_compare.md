# 用示例来解释"MCP 和 SKILL 的区别与联系"

MCP 让 Agent “连得上工具”，Skill 让 Agent “知道何时、按什么步骤去用这些工具”。
非常好的例子。你这个目标（“用户自然语言 → Agent 自主开发 Godot 游戏”）如果要稳定落地，不是“把所有 Godot 知识塞进模型”，而是要做成：
• Skill 负责“开发方法论与决策流程”
• MCP 负责“可执行能力与可验证事实来源”

也就是：Skill 决策，MCP 落地，官方文档做真值校验。

1. 定义
   • MCP（Model Context Protocol）：标准化 client-server 协议，定义模型如何发现与调用 Tools、读取 Resources、使用 Prompts。
   • Skill：面向任务的能力包（指令+方法论+可选命令触发），用于扩展 Agent 在特定场景下的表现。

2. 核心功能
   • MCP 核心功能
   • Tool 调用（有 schema，能执行外部动作）
   • Resource 注入（文件/数据库 schema/上下文）
   • Prompt 模板复用（结构化消息模板）
   • Skill 核心功能
   • 封装“任务打法”（例如文档生成、分析流程）
   • 在运行时按相关性自动触发，或手动触发（如 slash command）
   • 统一团队经验，提高一致性与复用效率

3. 本质区别（最关键）
   • MCP 是“可执行能力的标准化接入”：偏底层接口与互操作性。
   • Skill 是“任务智能的组织形式”：偏上层策略与业务语义。

⸻

结论优先（可直接执行）

你需要一个 三层架构：1. Knowledge Layer（知识层）
• Godot 官方文档（命令行、导出、GDScript、场景/资源、ProjectSettings）作为权威来源。
• 不把“全知识”硬编码进 prompt，而是通过 MCP resources 检索注入上下文。
• 例如 Godot 官方明确了 CLI 导出 --export-release/--export-debug/--export-pack、--headless 等能力。 2. Skill Layer（流程层）
• 把“需求澄清→任务拆解→改代码→运行验证→导出构建→回归测试→产出报告”封装为技能。
• Skills 本身就是这类“可复用任务能力”容器。 3. MCP Execution Layer（执行层）
• MCP server 暴露 tools/resources/prompts：
• tools：运行 Godot CLI、读写工程文件、运行测试
• resources：项目结构、导出预设、API cheat sheet
• prompts：固定输出模板（如“变更说明/风险清单”）
• 这正是 MCP 协议的标准能力分层。

⸻

本质分工（针对 Godot 场景）

Skill 做什么（“怎么做”）

以 build_godot_feature skill 为例：
• 输入：用户自然语言（“做个 2D 横版角色跳跃+双段跳+死亡重生”）
• 固定流程：1. 需求澄清（平台、输入设备、帧率目标）2. 生成任务树（scene/script/resource）3. 调用 MCP tool 改动项目 4. 调用 MCP tool 执行 godot --headless ... 验证 5. 输出验收结果 + 回滚点
• 输出：PR 风格变更报告 + 测试结论

MCP 做什么（“能做”）

以 godot-dev-mcp 为例，暴露以下 tool：
• project.scan()：扫描 project.godot、场景树、autoload
• scene.create(name, path, template)：创建/更新 .tscn
• script.apply(path, patch)：修改 GDScript
• godot.run(args)：运行 Godot 命令（如 --headless, --export-release）
• export.build(preset, out)：读取 preset 后执行导出
• docs.lookup(topic)：从本地镜像/官方文档索引取依据

MCP 侧只关心“安全执行 + 参数验证 + 可审计日志”，不关心“策略”。

⸻

你关心的“必须具备 Godot 一切知识”怎么实现？

答案：不要一次性内化全部知识，采用“检索+执行+验证闭环”。

必备知识域（作为 MCP resources 索引）1. 命令行参数与运行模式（--upwards, --headless 等） 2. 导出体系（--export-release/debug/pack + export preset 依赖） 3. GDScript 语法与类型（函数参数/返回类型） 4. 项目设置与自定义参数读取（OS/ProjectSettings 相关）

Skill 运行时按任务只取相关片段，避免一次塞满上下文。

⸻

MVP 方案（先跑通再扩展）

Plan（变更计划）
• 新增 1 个 Skill：godot_feature_mvp
• 新增 1 个 MCP Server：mcp-godot-local
• 先做 6 个工具：1. project.scan 2. scene.create_or_update 3. script.edit 4. godot.run_headless 5. export.release 6. validate.report
• 影响面：/scenes, /scripts, project.godot, export_presets.cfg
• 回滚点：每步工具调用前自动 git commit（小粒度）

Do（实施）
• Skill 模板里写死 PDCA：
• P：先列改动计划
• D：逐步执行 MCP tools
• C：执行 headless run + smoke test
• A：输出改进建议，不自动继续
• MCP tool schema 强类型（path/preset/scene_name 必填且校验）

Check（本地验证）
• godot --headless --path <project> --quit（项目可加载）
• godot --export-debug "<preset>" <out>（导出可执行）
• 运行后生成：
• 变更清单
• 错误日志摘要
• 回滚命令

Act（优化）
• 增加“玩法模板 skill”（platformer/topdown/rpg）
• 增加“性能与包体预算 skill”
• 增加“微信小游戏/抖音小游戏特化导出 skill”

⸻

最小协同示例（Skill × MCP）

Skill：godot_add_double_jump
• 用户输入：“给 player 加双段跳，保持现有移动手感”
• Skill 决策：1. 找 Player.gd 2. 插入 jump_count/max_jumps 3. 更新输入映射验证 4. 跑 headless 启动检查 5. 输出验收步骤（手测与自动）

MCP 实际执行
• project.scan("player movement script location")
• script.edit("scripts/player.gd", patch_json)
• godot.run("--headless --path . --quit")
• validate.report()

⸻

风险与防呆（必须做）1. 误改场景资源：MCP 侧做路径白名单（只改 scenes/ scripts/）。2. 命令参数漂移：所有 CLI 参数来源于官方文档索引，而非模型记忆。 3. 导出失败不可追溯：每次导出保存完整 stdout/stderr 与 preset 快照。4. Skill 过度自动化：高风险操作（删除资源、批量重命名）要求二次确认。

⸻

给你的推荐搭配（开发 Godot Agent 的最佳实践）
• MCP：
• Godot CLI 执行器 + 文件系统编辑器 + 文档检索器
• Skill：
• 需求理解 Skill
• 场景搭建 Skill
• GDScript 修改 Skill
• 导出与发布 Skill
• 回归测试 Skill

顺序是：先建 MCP 基础工具，再叠 Skill。
没有 MCP，Skill 会“会说不会做”；没有 Skill，MCP 会“能做但不稳”。

⸻

如果你要，我下一步可以直接给你一套可落地的 mcp-godot-local 工具清单 + Skill 目录结构模板（按你常用的项目结构：scenes/ scripts/ assets/），并附上最小可运行的命令约定。
==~~~~==
