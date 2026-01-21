## Github Copilot Notes

**VScode 的 AI agent - Github Copilot 使用笔记**

[about_llm/github_copilot.md]

[返回索引](../README.md)

## Github Copilot Customize 配置介绍.

[Awesome-Copilot 模版参考](https://github.com/github/awesome-copilot/blob/main/collections/awesome-copilot.md)

- 为 Vscode自定义聊天功能,主要基于copilot, 可配置编码习惯和项目需求等.
- 分类:
    - Agent | 智能体 ([Agent 模版参考](https://github.com/github/awesome-copilot/blob/main/docs/README.agents.md))
        - sample.agent.md
    - Prompt | 提示 ([Prompt 模版参考](https://github.com/github/awesome-copilot/blob/main/docs/README.prompts.md))
        - sample.prompt.md
    - Instructions | 指令 ([Instructions 模版参考](https://github.com/github/awesome-copilot/blob/main/docs/README.instructions.md))
        - sample.instructions.md
    - Toolsets | 工具 ([模版参考]())
        - sample.toolsets.jsonc
    - Skill(new) ([Skills 模版参考](https://github.com/github/awesome-copilot/blob/main/docs/README.skills.md))
        - sample.SKILL.md

## Github Copilot 配置详细解释

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
        - `tools: ["web","search"]` - 启用的工具数组
            - [查看 tools 参数](https://code.visualstudio.com/docs/copilot/chat/chat-tools):
        - `model: Claude Sonnet 4.5` - 补全提示的模型

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
        - `applyTo: "**/*.py"` - `"**"`为应用到所有文件
