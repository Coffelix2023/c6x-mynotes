## ComfyUI-TextEncoder 文本编码笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

### 📒 关于clip encoder (文本编码)

- set clip last layer(skip-clip)仅对sd生效,对于flux/qwen等模型不推荐使用
- clip
    - ClipTextFlux: 将clip_l 和 t5xxl分开, 如果用相同提示词,等效于单一clipText
    - clip_l 的替代(zer0int1的clipL模型改名备注):
        - ViT-L-14-KO-LITE-FULL-model-OpenAI-format.safetensors
          -> ko_lite_full_openai
        - ViT-L-14-TEXT-detail-improved-hiT-GmP-HF.safetensors
          -> text_detail_gmp
        - ViT-L-14-KO-LITE-FULL-model-state_dict-OpenAI.pt
          -> ko_lite_openai_dict.pt
        - LongCLIP-L-Text-Encoder-HF-only.safetensors
          -> clip_l_long_hfonly # 同clip_l_hidream
        - Long-ViT-L-14-KO-LITE-HuggingFace-TE-only.safetensors
          -> ko_lite_long_TEonly
        - ViT-L-14-336-KO-LITE-HuggingFace-TE-only.safetensors
          -> ko_lite_336_TEonly
    - dual clip加载器调试
        - t5xxl + clipL : 默认
            - clip_hidream:
            - clip_mania:
            - text_detail:
            - clip_l_long:
            - ko_336:
            - ko_opanai:
            - ko_openai_pt:
            - ko_long:
        - clip_l + umt5xxl_enc_fp8: 加载花屏

### 📒 关于Conditioning 条件的作用

- conditioning concat : 合并多个条件, 优点是不会影响已经输入的条件,减少语义分歧
- comditioning combine/averange
