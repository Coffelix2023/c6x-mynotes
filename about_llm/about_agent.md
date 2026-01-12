## LLM-Agent 笔记

> 常用 LLM Local-Agents 一览

[返回索引](../README.md)

---

- [LMS (lm-studio)](https://lmstudio.ai/)

```bash
    brew install lm-studio
    lms-cli : $HOME/.lmstudio/bin/lms
    PATH : /opt/homebrew/Caskroom/lm-studio
    curl http://localhost:[port]/api/v0/models  #获取API端点
```

- [Flowise](https://github.com/FlowiseAI/Flowise)

```bash
git clone https://github.com/FlowiseAI/Flowise.git
cd Flowise
pnpm install
pnpm build
```

- [CrewAI](https://www.crewai.com/)

```bash
协调角色扮演和自主 AI 代理的框架, 使用任何 LLM 和云平台构建和部署自动化工作流程
```

- [vLLM](https://vllm.ai/)

```bash
# vLLM 是一个快速易用的 LLM 推理和服务库
# installation:
    python -m pip install vllm
```

- [Open-WebUI](https://github.com/open-webui/open-webui)

```
Open WebUI 是一个可扩展 、功能丰富且用户友好的自托管 AI 平台，设计为完全离线运行。 它支持各种 LLM 运行器，例如 Ollama 和与 OpenAI 兼容的 API ，并内置了 RAG 推理引擎 ，使其成为一个强大的 AI 部署解决方案
```

- [Private-GPT](https://github.com/zylon-ai/private-gpt)

```
PrivateGPT 是一个已投入生产环境的 AI 项目，它利用大型语言模型 (LLM) 的强大功能，即使在没有网络连接的情况下，也能让您就文档提出问题。100% 私密，任何数据都不会离开您的运行环境
```

- [GPT Academic 学术优化](https://github.com/binary-husky/gpt_academic)

```
为GPT/GLM等LLM大语言模型提供实用化交互接口，特别优化论文阅读/润色/写作体验，模块化设计，支持自定义快捷按钮&函数插件，支持Python和C++等项目剖析&自译解功能，PDF/LaTex论文翻译&总结功能，支持并行问询多种LLM模型，支持chatglm3等本地模型。接入通义千问, deepseekcoder, 讯飞星火, 文心一言, llama2, rwkv, claude2, moss等
```

- [Crawl4AI](https://github.com/unclecode/crawl4ai?tab=readme-ov-file)

```
- LLM网络爬虫抓取工具
- Crawl4AI 是 GitHub 上最热门的项目库，由活跃的社区积极维护。它提供速度极快、支持 AI 的网络爬虫功能 ， 专为大型语言模型、AI 代理和数据管道量身打造。Crawl4AI 完全开源、灵活且专为实时性能而构建，为开发者提供无与伦比的速度、精度和部署便捷性
```

- [Llama.cpp](https://github.com/ggml-org/llama.cpp)

```bash
- 用于在本地机器上 执行模型推理，尽可能高效、跨平台地让 LLM 运行起来
- 一个开源的 C/C++ 推理库，目标是在 各种硬件上高效执行业务级 LLM 推理，特别是没有 GPU 的设备也能跑

    brew install --formula llama.cpp
    llama-cli PATH : /opt/homebrew/bin/llama-cli
    # 使用方法
    llama-cli -m [GGUF-PATH]  # 本地模型运行
    llama-server -m [GGUF-PATH] --port 8080  # localhost
    llama-cli -hf [gguf-url]  # 下载模型
    llama-bench -m [GGUF-PATH] -t 9 # 模型基准测试
    llama-gguf [GGUF-PATH] r n # 查看gguf信息
    llama-simple -m [gguf]
```

- [llamaIndex](https://developers.llamaindex.ai/) ([仓库地址](https://github.com/run-llama/llama_index/))

```bash
- LlamaIndex 是构建基于 LLM 的代理的领先框架，适用于您的数据, 不是推理引擎，它本身并不执行模型推理
- 用于组织、索引和探查数据，并将这些数据与模型会话结合起来构建智能应用
#- llamaIndex (以前称为 GPT Index) 是一个用于构建基于 LLM 的应用程序的框架。 它提供了连接您的数据与大型语言模型 (LLM) 之间的桥梁，使您能够轻松地将 LLM 集成到您的应用程序中。LlamaIndex 支持多种数据源，包括文档、数据库和 API，使您能够从各种来源提取信息并将其用于生成响应或执行任务。

# installation:
    python -m pip install llama-index

# 包括以下packages:
    llama-index-core
    llama-index-llms-openai
    llama-index-embeddings-openai
    llama-index-program-openai
    llama-index-question-gen-openai
    llama-index-agent-openai
    llama-index-readers-file
    llama-index-multi-modal-llms-openai
    llama-index-llms-ollama
```
