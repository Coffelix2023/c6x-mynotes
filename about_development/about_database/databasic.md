## Database 数据库基础笔记

[返回索引](../../README.md)

---

```bash
# what's Database?
    # 组织、存储和管理数据的仓库
    # 结构:
        SQL : 操作数据库而开发的一种语言
    # 数据库引擎
    # 管理系统 (MySQL, Oracle, SQL server)
    # 数据库的分类
        SQL : 传统型(关系型)数据库
        NoSQL : 非关系型数据库 Not Only SQL
        文档型数据库

# FerretDB
    * 开源 MongoDB 替代品
    * 无缝地使用 MongoDB 驱动程序和 PostgreSQL 作为数据库后端
    * Docker安装
    IMAGE : ghcr.io/ferretdb/ferretdb:2.3.1
# Chroma
    * 什么是Chroma
        * 开源AI数据库(矢量Vector)
        * 使知识、事实(facts)和技能(skills)插入 LLM，从而简化 LLM 应用程序的构建
        * 可以检索:
            * 存储embeddings 及其 metadata
            * 向量搜索 vector
            * 全文搜素 full-text
            * 文件存储 document storage
            * 元数据过滤 metadata filtering
            * 多模态检索 multimodal retrieval
    * Docker:
    docker run -v <path>:/data -p 8000:8000 chromadb/chroma -d
    docker compose -p chroma-compose up --build -d
    * 运行chroma:
        * chroma run
# Supabase
    superbase-cli :
        - brew install supabase/tap/supabase
        - brew upgrade supabase
        - supabase init
        - supabase start
    * 本地管理
        * supabase login
        * supabase projects list
# Qdrant


# SQlite
    世界上使用最广泛的嵌入式数据库引擎, 点击查看
    * 特点: : 没有单独的服务器进程
```
