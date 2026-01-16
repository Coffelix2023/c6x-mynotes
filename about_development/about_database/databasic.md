## Database 数据库基础笔记

[_about_development/about_database/databasic.md_]

[返回索引](../../README.md)

---

- 🔘 [Postgres - 关系型数据库](https://dsf.berkeley.edu/postgres.html) ([官方FQ](https://dsf.berkeley.edu/postgres-v4r2/postgres.faq))

    ```bash
    # 目的是为数据库研究中新理念的实现测试提供平台和基础
    # 证明本质上是关系型数据库管理系统可以扩展以处理复杂对象、规则，并且具有高度可扩展性
    # POSTGRES 是由加州大学伯克利分校 Michael Stonebraker 教授指导的一个数据库研究项目
    # 为了便于研究工作，他们创建了一个软件测试平台，即 POSTGRES 数据库管理系统 (DBMS)。POSTGRES DBMS 可以是扩展关系型数据库，也可以是面向对象数据库，具体取决于当时的流行趋势.
    ```

- 🔘 [PostgreSQL - 对象关系数据库管理系统](https://www.postgresql.org/)
    ```bash
    # 开源对象关系数据库系统(使用并扩展了 SQL 语言)
    # 旨在帮助开发者构建应用程序，帮助管理员保护数据完整性并构建容错环境，并帮助您管理各种规模的数据集
    ```

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
