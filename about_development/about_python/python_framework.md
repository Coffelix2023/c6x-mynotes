## Python Framework 笔记

[_about_development/about_python/python_framework.md_]

[返回索引](../../README.md)

[查看 Python 新手指南](https://wiki.python.org/moin/BeginnersGuide/NonProgrammers)

---

```bash
# 快速创建python项目
    uv init PROJECT_NAME
    cd PROJECT_NAME
    uv sync  #自动创建.venv
    uv add PACKAGE | uv add --dev PACKAGE ( uv remove --dev PACKAGE)

```

### 📒 常用 Python 框架

#### - [Django: 全栈框架](https://www.djangoproject.com/)®

    - Django 是一个高级 Python Web 框架，它鼓励快速开发和简洁实用的设计。它由经验丰富的开发者构建，处理了 Web 开发中的许多繁琐工作，让您可以专注于编写应用程序，而无需重复造轮子。它是免费且开源的

#### - [FastAPI: API框架](https://github.com/fastapi/fastapi)

    - FastAPI 是一个现代化的、快速的（高性能的）Web 框架，用于使用 Python 构建基于标准 Python 类型提示的 API

#### - [Flask: 轻量框架](https://flask.palletsprojects.com/zh-cn/stable/)

    - Flask 是一个轻量级的 WSGI Web 应用框架。它的设计宗旨是让用户能够快速轻松地入门，同时又能扩展到复杂的应用程序
    - [Flask 快速入门](https://flask.palletsprojects.com/zh-cn/stable/quickstart/)

---

### 📒 轻量级小框架,快速web ui界面

- [Streamlit](https://streamlit.io/)
    - 开源的 Python 框架，专为数据科学家和 AI/ML 工程师设计，只需几行代码即可构建动态数据应用。几分钟内即可构建并部署强大的数据应用

    ```python
        uv pip install streamlit
        import streamlit as st
        streamlit run app.py

        - st.write()
            st.write('hello, world')
    ```

- [NiceGUI](https://nicegui.io/)
    - 用 Python 轻松创建基于 Web 的用户界面
    - 开源的 Python 库，用于编写可在浏览器中运行的图形用户界面。它学习曲线平缓，同时又提供了高级自定义选项。NiceGUI 遵循后端优先的设计理念：它负责处理所有 Web 开发细节，让您可以专注于编写 Python 代码。这使得它非常适合各种项目，包括短脚本、仪表盘、机器人项目、物联网解决方案、智能家居自动化和机器学习

    ```python
    # installation:
        python3 -m pip install nicegui
       	from nicegui import ui
    # Text Elements
    from nicegui import ui
        ui.label : 标签
        ui.label('hello label')

        ui.link : 超链接
        ui.link('text', 'https://', new_tab=false)

        ui.chat_message : 聊天消息
        ui.chat_message('hello felix',
            name='chatbot',
            stamp='now',
            avatar='https://robohash.org/ui')

        ui.markdown
        ui.markdown('this is **markdown**')

        ui.restructured_text : 比markdown更复杂文本编辑
        ui.html

    # Controls
        ui.button : 按钮
        ui.button('click me', on_click=lambda: ui_notify('you clicked me!'))

        ui.dropdown_button : 下拉菜单
        ui.color_input : 输入颜色
        label = ui.label('change my color')
        ui.color_input(
            label = 'Color',
            value = '#00ff00',
            on_change = lambda e: lable.style(f'color:{e.vaule}')
        )
    ```

- [Gradio](https://www.gradio.app/)
    - 开源的 Python 包，可让您快速构建机器学习模型、API 或任何 Python 函数的演示或 Web 应用程序。然后，您可以使用 Gradio 内置的分享功能，在几秒钟内分享您的演示或 Web 应用程序的链接。 无需任何 JavaScript、CSS 或 Web 托管经验！
    ```python
        # 进入gradio目录和venv
            uv pip install --upgrade gradio
            import gradio as gr
        # gr.Interface
            # 为ML 创建demos, 模型接受多个inputs, outputs
            # 核心参数
            - fn
                # 包装UI函数(function to wrap UI around)
                # 示例
                    fn=greet
            - inputs
                # 输入组件, 与函数定义的参数数量匹配
                #示例
                    inputs=["text", "slider"]
            - outputs
                # 输出组件, 与函数返回值的参数数量匹配
        - demo.launch(share=True)
            #外部链接共享
        - gr.Blocks
            # 自定义布局模块(高级webUI)
        - gr.ChatInterface
            # 构建聊天机器人UI
    ```

---

### 📒 Python UI 框架

- [Kivy](https://kivy.org/) ([查看仓库](https://github.com/kivy/kivy))
    > Kivy 是一个开源的 Python 框架，用于开发跨平台的 GUI 应用程序，包括桌面、移动和嵌入式平台, 其目标是实现快速简便的交互设计和快速原型制作，同时使您的代码可重用和可部署：轻松打造创新用户界面.

---

#### 开发流程笔记

```
开发一个程序项目的专业流程通常会按照一系列结构化的步骤进行，这些步骤确保项目从概念到交付都能高效、有序地推进。以下是一个典型的软件开发流程：

1. 需求分析
	- 目标： 明确项目的功能、性能要求、目标用户、技术栈等。
	- 活动：
	- 与客户或利益相关者沟通，收集需求。
	- 形成需求文档或用户故事，明确系统的核心需求。
	- 确定项目的范围，避免需求蔓延。

2. 项目规划
	- 目标： 规划项目的时间表、资源、人员分配等。
	- 活动：
	- 制定项目时间表，确定里程碑（Milestone）。
	- 确定开发团队成员角色（如开发、设计、测试、运维等）。
	- 预估项目预算，安排资源（硬件、软件等）。
	- 风险评估与管理，准备应对突发问题。

3. 系统设计
	- 目标： 设计程序的架构和具体实现方案。
	- 活动：
	- 架构设计： 确定系统的总体结构，选择合适的架构模式（如MVC、微服务、客户端-服务器等）。
	- 数据库设计： 设计数据模型、数据库结构（关系型或非关系型）。
	- 接口设计： 确定系统与外部系统或组件的交互方式（如API设计）。
	- 详细设计： 针对具体模块或功能，设计详细的实现方案。

4. 编码实现
	- 目标： 按照设计文档开发实际功能。
	- 活动：
	- 根据模块划分，分配开发任务。
	- 编写代码，遵循编码规范和命名规则。
	- 单元测试（Unit Testing），确保每个模块的功能正确。

5. 测试阶段
	- 目标： 确保程序满足需求且没有重大bug。
	- 活动：
	- 功能测试： 测试程序的功能是否正常，是否符合需求。
	- 集成测试： 测试不同模块之间的协作。
	- 性能测试： 检查系统在高负载条件下的表现。
	- 用户验收测试： 客户或用户测试系统，确保符合预期。
	- 安全测试： 进行漏洞扫描、数据保护测试等。

6. 部署与发布
	- 目标： 将程序部署到生产环境中。
	- 活动：
	- 将代码打包或构建成可部署的版本（如Docker镜像、安装包等）。
	- 配置服务器或云服务，确保生产环境配置正确。
	- 部署到生产环境，执行发布。
	- 确保有监控工具跟踪系统的运行状态，快速响应潜在问题。

7. 维护与更新
	- 目标： 在产品发布后，持续修复bug，推出新功能或优化性能。
	- 活动：
	- 收集用户反馈，处理缺陷。
	- 根据需求变化，进行产品迭代。
	- 进行代码优化和性能调优。
	- 定期发布更新和修复补丁。

8. 文档编写与培训
	- 目标： 确保项目有清晰的文档支持，方便后期使用和维护。
	- 活动：
	- 开发文档： 包括系统设计文档、API文档、架构图等。
	- 用户文档： 帮助用户理解如何使用系统。
	- 维护文档： 记录常见问题和解决方案。
	- 对团队或客户进行培训，确保他们能够高效使用和维护系统。

9. 项目总结
	- 目标： 对项目进行回顾，总结经验教训，持续改进。
	- 活动：
	- 进行项目评审，总结项目的成功经验与不足。
	- 汇总开发中遇到的问题及解决方案。
	- 进行团队反馈，以便提升后续项目的执行效率。

方法论与工具
	- 敏捷开发： 采用迭代式开发，每个迭代周期通常包括需求分析、设计、开发和测试，适合快速变化的需求。
	- Scrum/Kanban： 适用于管理项目的任务和进度，帮助团队高效协作。
	- DevOps： 强调开发和运维的紧密协作，持续集成和持续交付（CI/CD）是其核心实践。
	- 版本控制： 使用Git等工具管理代码版本，确保团队协作无冲突。

小结

整个过程强调了需求的准确性、设计的合理性、编码的规范性、测试的全面性和部署的可行性。通过精细化管理和规范化操作，能够确保项目顺利完成，并且具有高质量的交付。

```
