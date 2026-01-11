## ComfyUI-Themes 主题json笔记

[返回 ComfyUI 笔记主页](about_comfyui.md)

---

```cfg

#=============
# 节点界面的配色
#=============
    "litegraph_base": {
      "BACKGROUND_IMAGE": "",
      "CLEAR_BACKGROUND_COLOR": "#555",
      "NODE_TITLE_COLOR": "#ddd",  #节点标题文字
      "NODE_SELECTED_TITLE_COLOR": "#fff",  #节点标题文字高亮
      "NODE_TEXT_SIZE": 11,  #节点字体大小
      "NODE_TEXT_COLOR": "#ddd",  #节点字体颜色
      "NODE_TEXT_HIGHLIGHT_COLOR": "#3f3",  #节点选项字体高亮
      "NODE_SUBTEXT_SIZE": 12,  #节点连线二级菜单字体大小
      "NODE_DEFAULT_COLOR": "#367",  #默认节点标题栏颜色
      "NODE_DEFAULT_BGCOLOR": "#aaa",  #默认节点主体色
      "NODE_DEFAULT_BOXCOLOR": "#666",  #节点左上角小方块颜色
      "NODE_DEFAULT_SHAPE": 3, #默认节点形状,1是box,2是round,3是card(底部直角)
      "NODE_BOX_OUTLINE_COLOR": "#FFF",  #选择节点的边框高亮
      "NODE_BYPASS_BGCOLOR": "#FF00FF",  #绕过节点的颜色
      "NODE_ERROR_COLOUR": "#E00",  #错误节点警告色
      "DEFAULT_SHADOW_COLOR": "rgba(0,0,0,0.2)", #节点阴影颜色
      "DEFAULT_GROUP_FONT": 24,  #默认组的标题字体大小
      "WIDGET_BGCOLOR": "#222",  #节点控件底色
      "WIDGET_OUTLINE_COLOR": "#666", #节点控件边框颜色
      "WIDGET_TEXT_COLOR": "#DDD",  #节点参数字体颜色
      "WIDGET_SECONDARY_TEXT_COLOR": "#999", #节点二级参数(combo)
      "WIDGET_DISABLED_TEXT_COLOR": "#666",  #无法继续选择的combo选项箭头
      "LINK_COLOR": "#999", #默认连线颜色
      "EVENT_LINK_COLOR": "#afa",  #?
      "CONNECTING_LINK_COLOR": "#aaf",  #正在被操控的连线颜色
      "BADGE_FG_COLOR": "#FFF",  #节点上方字体
      "BADGE_BG_COLOR": "#0F1F0F"  #节点上方字体底色
    },

#=============
# 工作区界面的配色
#=============
    "comfy_base": {
      "fg-color": "#fff", #?
      "bg-color": "#202020",  #?
      "comfy-menu-bg": "#171718",  #界面主要底色
      "comfy-menu-secondary-bg": "#303030",  #二级界面背景
      "comfy-input-bg": "#222",  #输入框的背景,包括string_input背景
      "input-text": "#ddd",  #控件输入字体颜色
      "descrip-text": "#999",  #描述字体颜色
      "drag-text": "#ccc",
      "error-text": "#ff4444",
      "border-color": "#4e4e4e",  #界面(比如comfyui-manager)的选项边框颜色
      "tr-even-bg-color": "#222",  #表格偶数行背景色
      "tr-odd-bg-color": "#353535", #表格单数行
      "content-bg": "#4e4e4e",
      "content-fg": "#fff",
      "content-hover-bg": "#222",
      "content-hover-fg": "#fff",
      "bar-shadow": "rgba(16, 16, 16, 0.5) 0 0 0.5rem"
        #以下是额外的
      "interface-panel-box-shadow": "rgba(0, 0, 0, 0.2) 0 0 0.2rem",
      "interface-panel-drop-shadow": "rgba(0, 0, 0, 0.4) 0 0 0.2rem",
      "interface-panel-hover-surface": "var(--color-gray-200)",
      "interface-panel-selected-surface": "color-mix(in srgb, var(--interface-panel-surface) 78%, var(--contrast-mix-color))",
      "contrast-mix-color": "#000"
    }

#=============
# 官方说明文档
#=============
{
  "id": "dark",                     // Must be unique, cannot be the same as other theme IDs
  "name": "Dark (Default)",         // Theme name, displayed in theme selector
  "colors": {
    "node_slot": {                  // 节点连线端口的颜色
        "CLIP": "#FFD500",            // CLIP model connection slot color
        "CLIP_VISION": "#A8DADC",     // CLIP Vision model connection slot color
        "CLIP_VISION_OUTPUT": "#ad7452", // CLIP Vision output connection slot color
        "CONDITIONING": "#FFA931",     // Conditioning control connection slot color
        "CONTROL_NET": "#6EE7B7",     // ControlNet model connection slot color
        "IMAGE": "#64B5F6",           // Image data connection slot color
        "LATENT": "#FF9CF9",          // Latent space connection slot color
        "MASK": "#81C784",            // Mask data connection slot color
        "MODEL": "#B39DDB",           // Model connection slot color
        "STYLE_MODEL": "#C2FFAE",     // Style model connection slot color
        "VAE": "#FF6E6E",             // VAE model connection slot color
        "NOISE": "#B0B0B0",           // Noise data connection slot color
        "GUIDER": "#66FFFF",          // Guider connection slot color
        "SAMPLER": "#ECB4B4",         // Sampler connection slot color
        "SIGMAS": "#CDFFCD",          // Sigmas data connection slot color
        "TAESD": "#DCC274"            // TAESD model connection slot color
    },

    "litegraph_base": {             // LiteGraph base interface configuration
        "BACKGROUND_IMAGE": "",            // Background image, default is empty
        "CLEAR_BACKGROUND_COLOR": "#222", // Main canvas background color
        "NODE_TITLE_COLOR": "#999",       // Node title text color
        "NODE_SELECTED_TITLE_COLOR": "#FFF", // Selected node title color
        "NODE_TEXT_SIZE": 14,          // Node text size
        "NODE_TEXT_COLOR": "#AAA",     // Node text color
        "NODE_TEXT_HIGHLIGHT_COLOR": "#FFF", // Node text highlight color
        "NODE_SUBTEXT_SIZE": 12,       // Node subtext size
        "NODE_DEFAULT_COLOR": "#333",   // Node default color
        "NODE_DEFAULT_BGCOLOR": "#353535", // Node default background color
        "NODE_DEFAULT_BOXCOLOR": "#666", // Node default border color
        "NODE_DEFAULT_SHAPE": 2,        // Node default shape
        "NODE_BOX_OUTLINE_COLOR": "#FFF", // Node border outline color
        "NODE_BYPASS_BGCOLOR": "#FF00FF", // Node bypass background color
        "NODE_ERROR_COLOUR": "#E00",    // Node error state color
        "DEFAULT_SHADOW_COLOR": "rgba(0,0,0,0.5)", // Default shadow color
        "DEFAULT_GROUP_FONT": 24,       // Group default font size
        "WIDGET_BGCOLOR": "#222",       // Widget background color
        "WIDGET_OUTLINE_COLOR": "#666", // Widget outline color
        "WIDGET_TEXT_COLOR": "#DDD",    // Widget text color
        "WIDGET_SECONDARY_TEXT_COLOR": "#999", // Widget secondary text color
        "WIDGET_DISABLED_TEXT_COLOR": "#666", // Widget disabled state text color
        "LINK_COLOR": "#9A9",          // Connection line color
        "EVENT_LINK_COLOR": "#A86",    // Event connection line color
        "CONNECTING_LINK_COLOR": "#AFA", // Connecting line color
        "BADGE_FG_COLOR": "#FFF",      // Badge foreground color
        "BADGE_BG_COLOR": "#0F1F0F"    // Badge background color
    },

    "comfy_base": {                  // ComfyUI base interface configuration
        "fg-color": "#fff",            // Foreground color
        "bg-color": "#202020",         // Background color
        "comfy-menu-bg": "#353535",    // Menu background color
        "comfy-menu-secondary-bg": "#303030", // Secondary menu background color
        "comfy-input-bg": "#222",      // Input field background color
        "input-text": "#ddd",          // Input text color
        "descrip-text": "#999",        // Description text color
        "drag-text": "#ccc",           // Drag text color
        "error-text": "#ff4444",       // Error text color
        "border-color": "#4e4e4e",     // Border color
        "tr-even-bg-color": "#222",    // Table even row background color
        "tr-odd-bg-color": "#353535",  // Table odd row background color
        "content-bg": "#4e4e4e",       // Content area background color
        "content-fg": "#fff",          // Content area foreground color
        "content-hover-bg": "#222",    // Content area hover background color
        "content-hover-fg": "#fff",    // Content area hover foreground color
        "bar-shadow": "rgba(16, 16, 16, 0.5) 0 0 0.5rem" // Bar shadow effect
    }
  }
}
```
