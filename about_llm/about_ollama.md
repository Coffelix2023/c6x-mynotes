## OLlama 笔记

[返回索引](../README.md)

---

### 📒 [Ollama](https://ollama.com/)

```bash
# 环境变量设置 ~/.zshrc
    OLLAMA_HOST
    OLLAMA_MODELS
    OLLAMA_CONTEXT_LENGTH=

# 运行中的参数设置
    ollama run <model>
    >> /set nothink(think/hidethinking) #关闭思考
    >> /show parameter

# 从GGUF导入
    touch Modelfile -> FROM ./GGUF.gguf
    ollama create <name> -f Modelfile

# 从 Safetensors 导入
    FROM <model-dir>

# 导出量化模型(From f16/32)
    ollama create --quantize q4_K_M <my-model>
    # 支持q4_K_M / q4_K_S / q8_0
    #
# modelfile内容语法参考(点击查看github解释)
    - PARAMETER <key> <value>
    - MESSAGE <role> <text>
    - SYSTEM """<system prompt>"""
    - TEMPLATE 点击查看详细

# 示例:
    ollama create qwen3-moe-tl-30b-a3b_q5 -f ./ollama.modelfile

```
