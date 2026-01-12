## Nginx 笔记

[返回索引](../../README.md)

---

### 📒 [Nginx](https://nginx.org/en/)

```bash
# 集 HTTP Web 服务器、反向代理、内容缓存、负载均衡、TCP/UDP 代理服务器和邮件代理服务器于一体的综合性服务商。最初由 Igor Sysoev 编写.

# 最受欢迎的docker image:
    docker pull nginx:trixie-perl
    docker pull nginx:stable-alpine3.23

# nginx 的结构
    # 主进程 (master process)
        读取和评估配置， 并维护工作进程
    # 工作进程 (worker process)
        负责实际处理请求
```
