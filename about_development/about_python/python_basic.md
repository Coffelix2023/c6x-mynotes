# Python Basic

_Python 基础笔记_

[about_development/about_python/python_basic.md]

[返回首页](../../README.md)

### Content

- [Base Concept](#base-concept)
- [Astral](#astral) (uv/ty/ruff)
- [Python LSP](#python-lsp)
- [Python Lint & Formatter](#python-lint-and-formatter)
- [Python Management](#python-management)
- [Code Blocks](#code-blocks)

---

## Base Concept

**扫盲区**

- [PyPA](https://www.pypa.io/en/latest/)
    - Python 打包权威机构 (PyPA) 是一个工作组，负责维护 Python 打包中使用的核心软件项目集
- [PyPI](https://pypi.org/)
    - python 官方软件包仓库
- [Setuptools](https://setuptools.pypa.io/en/latest/) ([仓库](https://github.com/pypa/setuptools))
    - Python 默认的构建工具,主要用于python的依赖包开发.
    - 轻松下载、构建、安装、升级和卸载 Python 包
    - installation: `pip install --upgrade setuptools[core]`
- [pip](https://pip.pypa.io/en/stable/) ([仓库](https://github.com/pypa/pip))
    - Python 的包安装程序,您可以使用它从 Python 包索引和其他索引安装包
    - pip 随python一起安装, 通过 `python -m pip install -U pip`来升级
    - `pip install`
    - `python -m pip install` #指定Python 解释器 python 来执行 pip
    - `pip install -r requirements.txt` #安装需求文档内的包依赖
    - `pip freeze` #列出当前环境安装的包及其版本(锁定), 添加 `> requirements.txt`
    - `pip cache dir` #显示pip cache 目录
    - `python -m ensurepip --upgrade` #这是一个特殊指令(如果找不到pip)
- [pipx](https://pipx.pypa.io/stable/)
    - pipx/pip等工具的[官方对比解释](https://pipx.pypa.io/stable/comparisons/)
    - 在隔离环境中安装和运行 Python 应用程序,每个程序各自有独立虚拟环境
    - pipx依赖于 pip 和 venv
    - pipx 取代了 pip 的部分功能；它允许你安装命令行应用程序，但不能安装你在代码中导入的库
    - pipx和brew都可以安装应用程序(来源不同)
    - 使用 uv 可以替代 pip 和 pipx

## Astral

**[Astral.sh](https://astral.sh/) 用 Rust 编写的 uv, ruff, ty**

- 🔘 [uv](https://docs.astral.sh/uv/) ([查看仓库](https://github.com/astral-sh/uv))

```bash
# 现代python管理工具, rust编写速度极快)
# quick start
    brew install uv
    brew upgrade uv
    # or
    python -m pip install -U uv
    uv self update
# PATH读取顺序: conda -> venv -> system
# 根据官网步骤 enable shell autocompletion for uv cmd
    echo 'eval "$(uvx --generate-shell-completion zsh)"' >> ~/.zshrc

# uv 用法
    uv cache clean/prune  # 清理缓存
    uv python list  # 列出 python 版本安装信息
    uv python pin PYTHON_VERSION  #显示/锁定当前目录python版本
    uv python pin --global  #显示/锁定全局python版本, 之后每次创建的py版本不变
    uv init         # 创建 python 项目
    uv add          # 添加dependency, uv add --dev (添加开发依赖)
    uv remove       # 移除dependency
    uv sync         # 根据 pyproject.toml 同步到env(会自动创建venv)
    uv run sample.py        # 运行指令, 相当于 python foo.py
    uv run bash sample.sh   # 运行bash

# uv tool 用法
    uv tool run # 无需安装即可使用调用工具
    uvx         # 等价于 uv tool run
                # 使用uvx, 工具会被安装到临时的、隔离的环境中
    uv tool install     # 安装工具, 添加到 PATH 中隔离的虚拟环境,持久性
    uv tool list        # 查看已安装包
```

- 🔘 使用 uv 创建项目
    - `uv init sample` 创建标准目录,包括.git
        - `uv init --app | --lib` 创建应用或者库
    - `uv init sample --bare` 创建极简项目, 只有一个pyproject.toml

- 🔘 [ty](https://docs.astral.sh/ty/) ([查看仓库](https://github.com/astral-sh/ty))

```bash
# 用 Rust 编写的、速度极快的 Python 类型检查器和语言服务器
# quick start:
	uvx ty check  #不安装ty的情况下运行检查
	uv add --dev tu	#利用uv在toml中添加开发包依赖
	python -m pip install -U ty
     brew install ty
     ty check
#
```

- 🔘 [ruff](https://docs.astral.sh/ruff/tutorial/) ([查看仓库](https://github.com/astral-sh/ruff))

```bash
# Rust 编写的、速度极快的 Python 代码检查和格式化工具
# 通过 pyproject.toml, ruff.toml, .ruff.toml配置
```

---

## Python LSP

**Python 语言服务器**

- 🔘 [Pyright](https://microsoft.github.io/pyright/#/)

```bash
# python静态类型检查器
```

- 🔘 [basedpyright]

```bash
# pyright的升级版本
```

---

## Python Lint And Formatter

**Python 质量检查与格式化**

> 可以先尝试用ruff + ty (官方推荐)

- 🔘 [black](https://github.com/psf/black)

```bash
# 毫不妥协的 Python 代码格式化程序
# installation
    python -m pip install -U black
```

- 🔘 [flake8](https://github.com/PyCQA/flake8)

```bash
# 检查脚本错误和未使用的import(F401), 示例: flake8 file.py
# installation:
    python -m pip install -U flake8
```

- 🔘 [autoflake](https://github.com/PyCQA/autoflake)

```bash
# 会从 Python 代码中移除未使用的导入语句和变量。它利用 pyflakes 来实现自动清洁
# installation:
    python -m pip install -U autoflake
    autoflake --remove-all-unused-imports -i file.py
```

- 🔘 [isort](https://github.com/PyCQA/isort)

```bash
# 对导入的文件进行排序(import sort in py)
# installation:
    python -m pip install -U isort
    isort file.py
```

---

## Python Management

**Python 解释器版本管理**

- 🔘 [Pyenv](https://github.com/pyenv/pyenv)

```bash
# 轻量的 python 版本管理, 轻松地在多个 Python 版本之间切换.
# pyenv 只专注于 python版本管理,不负责包依赖管理.

# installation:
    brew install pyenv
    pyenv install 3.12.10   #安装特定版本python
    pyenv global 3.12.10    #全局默认版本设置
    pyenv local 3.12.10     #项目目录内设定版本
    pyenv versions          #列出Pyhon版本
```

---

## Code Blocks

**备份: 常用函数与代码块**

```python
# >>> 这是在comfyui扩展开发过程积累的部分常用函数 <<<

# ====== 递归创建父目录 #若目录不存在,从父目录开始递归创建
def ensure_parent_dir(name: str) -> None:
parent = os.path.dirname(name)
if parent and not os.path.exists(parent):
os.makedirs(parent, exist_ok=True)

# ====== 规范化路径 #规划化之后进行检查,如果不存在则递归创建,可代替ensure_parent_dir()
def safe_mkdir(path: str) -> str:
p = os.path.expanduser(os.path.expandvars(path))
p = os.path.abspath(os.path.normpath(p))
os.makedirs(p, exist_ok=True)
return p

# ====== 拆分提示词为数组

# 示例: input = "a girl, red hair, white upper"

# 返回: ['a girl', 'red hair', 'white upper']

    def split_text(s: str) -> List[str]:
        # 按[]里的符号进行分割，并去除首尾空白
        parts = re.split(r'[.,\n;]+',s)
        return [p.strip() for p in parts if p and p.strip()]

# ====== 清理非法字符
def clean*string(name: Optional[str]) -> str:
if name is None:
print("⚠️ 来自clean_string: 文件不存在")
return
s = str(name).strip()
if not s:
print("⚠️ 来自clean_string: 文件不存在")
return
s = s.replace("..", "")
s = re.sub(r"[\/\\]+", "*", s)
s = s.lstrip(".")
s = s.replace(" ", "_")
s = re.sub(r"[^A-Za-z0-9_\-\.]", "\_", s)
return s

# ====== 拆分每个字符

# 示例: input = "a girl, red"

# 返回: ['a',' ','g','i','r','l',',',' ','r', 'e', 'd']

    def flatten_inputs(inputs: Iterable[Any]) -> List[str]:
        result = []
        for item in inputs:
            if item is None:
                continue
            if isinstance(item, (list, tuple, set)):
                result.extend(flatten_inputs(item))
            else:
                # 非字符串转换成字符串
                result.append(str(item))
        return result

# ====== 去重并保持原顺序

# 示例: input = "a girl, girl"

# 返回: ['a', ' ', 'g', 'i', 'r', 'l', ',']

    def unique_text(seq: List[str]) -> List[str]:
        seen = set()
        out = []
        for x in seq:
            if x not in seen:
                out.append(x)
                seen.add(x)
        return out

# ====== 拼接

# 需要 flatten_inputs, unique_text,

# 把任意数量/深度嵌套的字符串/列表联合成单个 prompt 字符串。

# 示例: input = ['a girl', 'red hair', 'red hair', 'red shoes']

# 返回: a girl,red hair,red shoes

    def join_parts(
        *parts: Any,
        split_tokens: bool = True,
        dedupe: bool = True,
        sep: str = ","
    ) -> str:
        flattened = flatten_inputs(parts)
        tokens: List[str] = []
        for s in flattened:
            if not s:
                continue
            s = s.strip()
            if not s:
                continue
            if split_tokens:
                tokens.extend(split_text(s))
            else:
                tokens.append(s)
        # 去重保留顺序（可选）
        if dedupe:
            tokens = unique_text(tokens)
        return sep.join(tokens)

# ====== yaml预设

# ====== 📌 map的文本结构(字典dict):

    ## presets_map:
    ##   preset1:
    ##     pos: "xxx"
    ##     neg: "yyy"
    ##   preset2: ...

====== 📌 options的文本结构(列表list) # opt的文本结构(列表): ## presets_opt: ## - preset1 ## - preset2

# ====== 📌 定义yaml文件路径

    yaml_dir = safe_mkdir(f"{base_dir}/presets/")
    yaml_base = os.path.join(yaml_dir, "base_presets.yaml")

# ====== 📌 将yaml转换为python数据格式

    with open(yaml_style, "r", encoding="utf-8") as f:
        data = yaml.safe_load(f) or {} #避免None
        # 格式判断,避免报错
        if not isinstance(data,dict):
            print("⚠️ yaml header 不是字典")
            pass
        print(data)
    返回: {'presets_map': {'none': {'pos': '', 'neg': ''}, 'located': {'pos': 'locked camera', 'neg': ''}}}

# ====== 📌 获取key 和 value的示例

    def get_yaml_key(yaml_path:str):
        data = _get_yaml(yaml_path)
        keys_view = data.keys()            #返回dict_keys([])
        keys_list = list(keys_view)        #返回list[]
        values_view = data.values()        #返回dict_values([])
        values_list = list(values_view)    #返回list[]

        return values_list

    #将字典的Keys和values拆分打组成列表list[]
    get_base_key = list(get_base_map.keys()) or ["<no_presets>"]
    get_base_key = list(get_base_map.values()) or ["<no_presets>"]

    # ====== 📌 根据条件创建集合 =======
    name = set()  #创建一个集合{}, 无序去重的集合.
    params: Optional[str] = None  #在comfy execute中, params允许函数调用时为None

# ====== 图像相关

# ========== 📌 通过图像名称获取图像路径

    def _get_image_path(
        image_input,
        img_dir=None,
    ):
        if img_dir:
            # 先按一层日期目录搜索
            pattern = os.path.join(img_dir, '*', image_input)
            matches = glob.glob(pattern)
            if matches:
                return os.path.abspath(matches[0])
            # 递归搜索（更慢，但更鲁棒）
            for p in glob.glob(os.path.join(img_dir, '**', image_input), recursive=True):
                return os.path.abspath(p)

        # 若都失败，抛出原始错误或返回 None
        raise FileNotFoundError(f"Cannot resolve image path for: {image_input}")

    x = safe_mkdir(f"{base_dir}/output/{NOW_FULL}")

    #获取图像列表
    files = [f for f in os.listdir(x) if os.path.isfile(os.path.join(x, f))]
    #过滤文件夹中非图像文件
    y = sorted(
        folder_paths.filter_files_content_types(files, ["image"])
        )

    _img = y[0]
    #根据选择的图像返回完整路径
    _img_path = _get_image_path(_img, img_dir=x)
    #查看图像
    _img_open = node_helpers.pillow(Image.open, _img_path)

# ====== 常用命令备忘

# ====== import click

    click.echo()  #相当于 print
    click.secho()  #可以用颜色文本: click.secho("text", fg="color")
        color=["red/ cyan/ green/ blue/ white/ black/ bright_red..."]
    click.style("text", blink/underline=True)

# ======

    在google翻译或 GLM 调用时,不显示终端http调用结果的信息:
        import logging
        logging.getLogger("httpx").setLevel(logging.WARNING)  #最主要,一般仅此即可
        logging.getLogger("httpcore").setLevel(logging.WARNING)
        logging.getLogger("urllib3").setLevel(logging.WARNING)

```
