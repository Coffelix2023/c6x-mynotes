## Python Basic 基础笔记

[返回索引](../../README.md)

### 📒[Astral.sh Products](https://astral.sh/)

> Astral用Rust 编写的 uv, ruff, ty

- 🔘 [**uv**](https://docs.astral.sh/uv/)

```bash
# 现代python管理工具, rust编写速度极快)
# quick start
    brew install uv
PATH : /opt/homebrew/bin/uv
Conda 也安装隔离uv 版本
设置export PATH, 确保python/pip 优先读取Conda环境

* uv常用指令
    * uv pip install
    照顾旧版本: python -m // pip installl等
    * uv pip list
    * uv init
    * uv venv
    * pip list --not-required
    列出全局手动装的pip包
    * pip cache purge
    * pip check
    类似brew doctor

* uv 创建项目流程
    * uv init
    * uv venv ...
    根据init后的toml创建python版本,默认是3.11+
    * source .venv/bin/activate
    * which python
    验证venv是否部署成功
```

### 🔘 Python LSP - 语言服务器

- [**PYRIGHT**](https://microsoft.github.io/pyright/#/)

```bash
# python静态类型检查器
```

- basedpyright
    - test
- ty
- ruff

### 🔘 Python Formatter - 格式化工具

- black

### 🔘 常用代码块

```
    flake8: 检查脚本错误和未使用的import(F401), flake8 file.py
    autoflake: 自动清洁, 终端显示修改内容
        --remove-all-unused-imports -i file.py
    isort: 对import进行排序和整理,用法: isort file.py

====== 递归创建父目录 #若目录不存在,从父目录开始递归创建
def ensure_parent_dir(name: str) -> None:
parent = os.path.dirname(name)
if parent and not os.path.exists(parent):
os.makedirs(parent, exist_ok=True)

====== 规范化路径 #规划化之后进行检查,如果不存在则递归创建,可代替ensure_parent_dir()
def safe_mkdir(path: str) -> str:
p = os.path.expanduser(os.path.expandvars(path))
p = os.path.abspath(os.path.normpath(p))
os.makedirs(p, exist_ok=True)
return p

====== 拆分提示词为数组

# 示例: input = "a girl, red hair, white upper"

# 返回: ['a girl', 'red hair', 'white upper']

    def split_text(s: str) -> List[str]:
        # 按[]里的符号进行分割，并去除首尾空白
        parts = re.split(r'[.,\n;]+',s)
        return [p.strip() for p in parts if p and p.strip()]

====== 清理非法字符
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

====== 拆分每个字符

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

====== 去重并保持原顺序

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

====== 拼接

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

====== yaml预设

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

====== 图像相关

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

====== 常用命令备忘

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
