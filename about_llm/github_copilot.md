## Github Copilot Notes

**VScode 的 AI agent - Github Copilot 使用笔记**

[about_llm/github_copilot.md]

[返回索引](../README.md)

- Github Copilot Customize
    - ✅ instructions(指令)
        - 自动加入上下文
        - 定义: 项目/团队的编码实践、风格指南、稳定的规则/约定
        - filename: `*.instructions.md`
        - path:
            - `user/prompts/` : Global
            - `.github/instructions/` : Workspace
        - Header-yaml:
            - `name:`
            - `description:`
            - `applyTo: "**/*.py"`

    - ✅ Agents (代理助手)
        - 自动加入上下文
        - 定义: 角色任务化的 AI 代理, 角色范围、权限、可访问工具、默认模型偏好
        - filename: `*.agents.md`
        - path:
            - `user/prompts/` : Global
            - `.github/agents/` : Workspace
        - Header-yaml:
            - `name:`
            - `description:`
            - `tools: ["web","search"]` - 工具应用
                - [tools 参数](https://code.visualstudio.com/docs/copilot/chat/chat-tools):
            - `model: Claude Sonnet 4.5` - 补全提示的模型
