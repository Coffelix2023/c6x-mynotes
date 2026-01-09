## Podman管理容器

用 [Podman](https://github.com/containers/podman) 管理docker的images/containers/pods/compose

[返回索引](../README.md)

```bash
brew install podman

# 常用指令:
	podman machine: list | init | start| stop | info | rm
	podman contaner: ps | list |  create |  init | prune | restart | stats | stop | rm
	podman compose: ps | ls |  create | up| down | run | start | pull | push | stats
	podman pod: ps | create |  prune |  restart | rm | start | stats
	podman volume: ls | prune | rm | reload | create

# 示例:
	podman run -d --name n8n -p 5678:5678 -v [local_dir]:[remote_dir]
```

1. 📒 关于 podman machine
    - 初次使用需要创建machine:
        - podman machine init
        - podman machine start
        - podman machine stop
        - podman machine list
        - podman machine rm [machine-name]

2. 📒 拉取镜像(image)
    - 仅拉取镜像: podman pull [image-name]
    - 查看已有镜像: podman images
    - 删除镜像: podman rmi [image-name]

---

- 📖 备用:
    - 🔘 docker context
        - 返回podman socket的路径
            - podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}'
        - 使用命令查看docker context
            - docker context --help
    - 🔘 Kubernetes (k8s)
        - 由google开源的容器编排引擎，用来对容器化应用进行自动化部署、扩缩和管理.
        - 容器编排(container orchestration) : 自动管理和调度docker的容器集群
            - 核心任务包括: 自动调度/负载均衡/容灾/高可用/弹性扩缩容
        - 容器 Container
            - 将应用程序及其运行时依赖项(runtime dependencies)打包的技术.
            - 容器镜像 Images:
                - 可立即运行的软件包，包含运行应用程序所需的一切
                - 无状态+不可变(只读)
            - 容器运行时 runtimes : 高效运行容器的基础组件:
                - containerd
                - CRI-0
                - Kubernetes CRI
        - Pods
            - 在 Kubernetes 中创建和管理的最小可部署计算单元.
            - 注意 :
                - pod不是一个进程, 而是一个容器运行的环境.
                - pod是一次性的, 直接创建容易失控, 一般由工作负载资源(workload)创建和管理.
            - 指一个或多个 容器 ，具有共享的存储和网络资源，以及如何运行容器的规范.
            - 类似于一组具有共享命名空间和共享文件系统卷的容器.
            - K8s集群中的pod使用方式:
                - 单容器 : 相当于单个容器的包装器(wrapper), K8s管理pod而不是container.
                - 多容器 : 封装由以下部分组成的应用程序 多个紧密耦合且需要共享资源的共置容器
                    - \*仅在容器紧密耦合的特定情况下使用此模式
            - 运行示例: `kubectl apply -f <yaml>`
    - 🔘 工作负载 Workloads
        - 在k8s上运行的应用程序
        - k8s提供的内置的工作负载资源:
            - Deployment and ReplicaSet
                - 部署 Deployments
                    - Deployment管理一组Pod来运行应用程序工作负载，通常不维护状态.
                    - 本质是管理pod的生命周期
                    - 运行示例和Pod一样, 不过apply的是deployment.yaml
                    - 检查状态 : kubelctl get deployments
            - StatefulSet
            - DaemonSet
            - Jobs

---

### 一些有用的镜像库

- [TensorZero](https://github.com/tensorzero/tensorzero)
    - 用于工业级 LLM 应用的开源堆栈
    - image: tensorzero/gateway:latest
    - volume: :/app/storage
    - port: 3000:3000
- [Qdrant](https://qdrant.tech/)
    - 面向下一代人工智能应用的向量搜索引擎
    - image: qdrant/qdrant:latest
    - volume: :/qdrant/storage
    - port: 6333:6333
- [AgentZero](https://github.com/agent0ai/agent-zero)
    - 用于构建和部署智能代理的开源框架
    - image: agent0ai/agent-zero:latest
    - volume: :/app/data
    - port: 8080:8080
- [RAGFlow](https://ragflow.io/)
    - 用于构建基于检索增强生成的应用程序的框架
    - image: infiniflow/ragflow:latest
    - volume: :/app/storage
    - port: 5000:5000
- [Docmost](https://github.com/docmost/docmost)
    - 用于文档问答和信息检索的开源平台, Notion平替
    - image: docmost/docmost:latest
    - volume: :/data/storage
    - port: 3000:3000
- [LangChain](https://github.com/langchain-ai/langchain)
    - 用于构建语言模型应用程序的框架
    - image: langchain/langchain:latest (比较旧了)
    - `pip install langchain`
    - volume: :/data/storage
    - port: 8000:8000
- [PromptOptimizer](https://github.com/linshenkx/prompt-optimizer)
    - 用于优化和管理提示词的工具
    - image: linshen/prompt-optimizer:latest
    - volume: :/data/storage
    - port: 8000:80
- [Archivebox]
    - 用于保存和存档网页内容的工具
    - image: archivebox/archivebox:latest
    - volume: :/data
    - port: 8000:8000
- [OpenWebui](https://github.com/open-webui/open-webui)
    - 用户友好的 AI 界面
    - image: ghcr.io/open-webui/open-webui:main
    - volume: :/app/backend/data
    - port: 8080:8080
    - 要跑本地ollama的情况:

    ```bash
    # openai-api
        podman run -d -p 3000:8080 -e OPENAI_API_KEY=your_secret_key \
        -v open-webui:/app/backend/data --name open-webui \
        --restart always ghcr.io/open-webui/open-webui:main
    # pip installation
        python -m pip install open-webui
    	open-webui serve
    ```

- [Crawl4AI](https://github.com/unclecode/crawl4ai)
    - 用于爬取网页内容并进行AI处理的工具
    - image: unclecode/crawl4ai:latest
    - volume: :/app/data
    - port: 11235:11235
    - extra: --shm-size=3g
- [LangFlow](https://github.com/langflow-ai/langflow)
    - 用于可视化构建和管理语言模型工作流的工具
    - image: langflowai/langflow:latest
    - volume: :/langflow/storage
    - port: 7860:7860
- [SearXNG](https://github.com/searxng/searxng)
    - 开源的元搜索引擎
    - image: searxng/searxng:latest
    - volume: [config]:/etc/searxng/ | [data]:/var/cache/searxng/
    - port: 8080:8080
