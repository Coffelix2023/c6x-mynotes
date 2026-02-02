# Skills

**Agent skills 笔记**

[返回索引](../README.md)

---

- What's Skills?
    - tl;dr: 被封装的可复用,版本化,测试的过程资源, 将通用 Agent编程半专用 Agent.
    - 包含模块: 说明书/模版/示例/脚本等
        - 指令(instructions): 工作方法/ 输出格式 / 条件
        - 元数据(metadata): 用途/ 触发条件/ 约束/ 依赖
        - 模版(template)
        - 示例(example)
        - 规范(style_guide)
        - 测试(evals)
    - 与 rules/ system prompt区别
        - rules/system prompt: 全局常驻,越来越臃肿.
        - skills: 按需加载,可组合/独立迭代, 类似 plugins
- Why Skills?
    - 如果开发任务需求一致性/可控/可回归, 需要skill
    - 符合模块化工程: 版本控制/代码审查/依赖管理等
    - 构建一次功能，即可将其部署到多个代理产品中
    - 技能支持允许最终用户为代理提供开箱即用的新功能
- 核心:
    - 包含skill.md文件的文件夹,例如:
    - ```bash
      my-skill/
      ├── SKILL.md          # 必须: instructions + metadata
      ├── scripts/          # 可选: executable code
      ├── references/       # 可选: documentation
      └── assets/           # 可选: templates, resources
      ```
    - my-skill/SKILL.md
        - YAML 前置元数据
            ```yaml
            - name: skill-name #小写与连字符,唯一,与父目录同名
            - description: 何时触发该skill
            ```
- 正文:
    - Step-by-step instructions: 渐进式指导
    - Examples of inputs and outputs: 输入输出示例(结构化)
    - Common edge cases: 常见边缘情况处理
    - Best practices and tips: 最佳实践与技巧

- 其他目录结构
    - scripts 脚本(可选): 包含代理可以运行的可执行代码.
    - references 文档(可选): 相关文档,如API参考,设计文档等.
        - REFERENCE.md: 详细技术参考.
        - FORMS.md: 表单模板或结构化数据格式.
    - assets 资源(可选): 模版,图片等辅助资源.
        - templates: 模版文件, 配置模版.
        - resources: 其他资源文件, 图片/图表/示例.
        - data: 结构化数据文件, 如JSON/CSV等.

- 运作方式
    - 启动加载
    - 命中激活
    - 执行
