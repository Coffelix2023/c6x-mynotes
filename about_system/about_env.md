## System Environment & PATH 笔记

[返回索引](../README.md)

---

### 🔘 **XDG PATH** 标准路径配置(遵循 XDG 规范)

```bash
# ~/.zshenv
ZDOTDIR="${HOME}/.zsh"  #zsh相关文件配置(.zshenv/.zprofile/.zshrc)
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_RUNTIME_DIR="/tmp/runtime-$UID"

# XDG Guard 路径防御
    for d in "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME"; do
    	[[ -d "$d" ]] || mkdir -p "$d"
    done
```

---

### 🔘 **Python HOME**

```bash
# ~/.zshenv
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/pythonrc"
export PVENV_ROOT="${XDG_DATA_HOME}/python/pyenv"
export PIPX_HOME="${XDG_DATA_HOME}/python/pipx"
export PIPX_BIN_DIR="${XDG_DATA_HOME}/python/bin"
export IPYTHONDIR="${XDG_CONFIG_HOME}/ipython"
export KERAS_HOME="${XDG_STATE_HOME}/keras"
export MPLCONFIGDIR="${XDG_CONFIG_HOME}/matplotlib"
```

### 🔘 **Node.js HOME**

```bash
# ~/.zshenv
export NODE_REPL_HISTORY="${XDG_DATA_HOME}/node_repl_history"

# npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# pnpm
export PNPM_HOME="${XDG_CONFIG_HOME}/pnpm"

# fnm
    export FNM_PATH="${XDG_DATA_HOME}/fnm"

    # fnm 初始化 path 优先级处理
    # 配置必须放入 .zshrc 中(因为command命令还未定义),否则无效
    if command -v fnm >/dev/null 2>&1; then  #检测 fnm 命令是否存在
        eval "$(fnm env --use-on-cd --shell zsh)"  #根据目录自动切换版本
    fi

# bun
    export BUN_INSTALL="${XDG_DATA_HOME}/bun"
    export BUN_BIN_DIR="${BUN_INSTALL}/bin"

```
