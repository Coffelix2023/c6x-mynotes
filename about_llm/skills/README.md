# 全局技能集 (Global Skills)

本仓库包含一组生产级技能（skills），用于扩展 AI 代理的能力边界。每个 skill 封装特定领域的专家经验、最佳实践与检查清单，便于在对话或自动化流程中被发现与调度。本文件为技能索引与最小描述（MVP），便于快速查找与后续完善。

---

变更说明（MVP）

- 目标：补齐并列出 `about_llm/skills` 目录下的所有 skill 条目，采用简短且可验证的一行描述。
- 范围：仅修改/维护文档（此 README），不改动任何 skill 代码或目录结构。
- 回滚：已保留原文件备份 `about_llm/skills/README.md.bak`（如需还原，请复原该备份文件）。
- 验证：人工打开本文件核对条目是否齐全；可通过版本控制查看变更差异。

---

目录（按功能分组）

## 🚀 核心与策略 (Core & Strategy)

- **using-superpowers**: 技能发现与调度的枢纽；在对话开始时选择与加载合适的技能与工作流。
- **brainstorming**: 系统化需求分析与创意发散，用于在执行前明确目标与约束。
- **writing-plans**: 编写技术规格与实施计划的模板与检查项，支持分阶段交付与验收。
- **executing-plans**: 将已批准计划系统化执行的流程与监控机制。
- **subagent-driven-development**: 使用独立子代理并行拆分任务、协调交付的实践与模式。

## 💻 工程与语言 (Engineering & Languages)

- **typescript-pro**: 现代 TypeScript 开发实践、类型设计与工程化建议。
- **javascript-pro**: JavaScript 工程实战、兼容性与性能优化要点。
- **python-pro**: 面向 Python (3.11+) 的类型化、异步与架构建议。
- **rust-engineer**: Rust 系统级编程与性能/安全实践。
- **vue-expert**: Vue 3 / Nuxt 3 前端工程与状态管理实务。
- **tauri-expert**: 使用 Tauri 构建跨平台桌面应用的实践要点。
- **mcp-builder**: 多组件项目脚手架与自动化构建流程模板。

## 🎨 设计与创意 (Design & Creative)

- **frontend-design**: 面向生产级 UI/UX 的设计系统与可实现规范。
- **canvas-design**: 可用于海报、插画与视觉排版的设计流程与资源建议。
- **theme-factory**: 生成与管理视觉主题（文档/界面）的模式与样式库。
- **imagen**: 基于 Imagen 模型的视觉原型、图标与素材生成参考。
- **brand-guidelines**: 企业品牌一致性检查与视觉识别 (VI) 实施要点。

## 🔍 专业领域 (Specialized Domains)

- **deep-research**: 深度研究与情报收集代理，包含市场/竞争/文献汇总方法。
- **architecture-designer**: 系统架构设计、模式评审与 ADR（决策记录）模板。
- **code-reviewer**: 代码审计流程、常见风险检查项与修复建议模板。
- **code-documenter**: 自动与手工相结合的代码文档生成与维护策略。
- **game-developer**: 游戏引擎相关逻辑、性能优化与调试实践。
- **fine-tuning-expert**: LLM 微调流程、数据标注标准与评估方法。
- **prompt-engineer**: 提示词设计、分步推理与提示链（chain-of-thought）构建策略。
- **kontext-expert**: 上下文管理、检索增强生成（RAG）与文档片段工程实践。
- **xiaohongshu-recruiter**: 针对小红书等社交平台的内容/人才筛选与策略支持（行业专用）。

## 📋 通用工具 (Utilities)

- **hello-skill**: 会话启动与技能加载状态的标准化声明。
- **skill-creator**: 用于快速创建/扩展 skill 架构与元数据的工具/模板说明。
- **create-content**: 内容生产流水线与多渠道格式化的最佳实践集合。
- **build-app-step01**: 应用构建初期的引导步骤（项目初始化、依赖、骨架）。
- **build-app-workflow**: 从开发到发布的工作流模板（CI/CD、测试策略、发布步骤）。
- **executing-plans**:（在“核心与策略”中也列出）用于执行与跟踪计划的流水线与检查项。

---

使用与维护建议（简要）

- 每个 skill 目录应包含一个 README，说明用途、输入/输出、调用方式与检查表（若尚未添加，请逐步补充）。
- 文档更新须与实际能力同步：新增/修改 skill 时同时更新此索引、skill 内 README 与调用示例。
- 禁止在代码或文档中硬编码密钥/令牌；示例中使用占位符并在 README 中标注安全注意事项。

任务清单（后续可选）

- [ ] 为每个 skill 添加详细元信息：作者、接口、入口文件、依赖、示例用法、测试步骤。
- [ ] 为常用 skill 生成 quickstart 链接或示例脚本（便于快速验证）。
- [ ] 定期（例如季度）审查 skill 列表与描述以确保一致性与准确性。

风险提示

- 描述为 MVP 级别，若需对外发布或作为团队说明文档，建议由对应技能维护者确认并补充细节。
- 若需要对 skill 功能做更精确的描述，请提供各 skill 的 README 或负责人信息，以便我协助丰富内容。

验证（本地）

- 打开并检查 `c6x-mynotes/about_llm/skills/README.md`，核对条目完整性与措辞。
- 如使用 git：
    - `git status` 查看变更。
    - `git diff -- about_llm/skills/README.md` 检查差异并确认内容符合预期。

---

作者备注

- 本文件以最小可行文档为目标（MVP），旨在补齐索引并确保每个已存在的 skill 都可被发现与审阅。若你希望我进一步为每个 skill 自动生成更详尽的 README 模板或附加元数据，请回复所需字段与优先级，我将按 PDCA 流程逐步实施。
