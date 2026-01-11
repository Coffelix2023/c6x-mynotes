## Rust Basic 基础笔记

[返回索引](../../README.md)

---

### 📒 [About Rust](https://rust-lang.org/)

```bash
- 兼具 C/C++ 性能和编译期内存安全保证的现代系统编程语言
- “极速又安全”的系统编程语言
- 现代的 通用系统编程语言，它强调 高性能、静态类型、安全性（尤其是内存安全和并发安全），通过独特的 所有权/借用系统 在编译期保证无空指针、无数据竞争等常见错误而不依赖垃圾回收机制
- rustc 是 Rust 的编译器, [rustc book](https://doc.rust-lang.org/rustc/index.html)
```

- ==> [Rustup](https://rust-lang.github.io/rustup/) <==

```bash
# Rustup 是 Rust 的安装和版本管理工具
# installation:
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    rustup install stable
        # 自动安装 cargo/ clippy/ rust-docs/ rust-std/ rustc/
    rustup default stable
    rustup updtae  # 每 6 周更新一次
    rustup self uninstall
```

- ==> [Cargo](https://github.com/rust-lang/cargo) <==

```bash
# Cargo 是Rust 的构建工具和包管理器
# cargo.toml : 关键文件, 每个板条箱(crate)根目录下必备的清单文件
# 常用指令
    cargo build
    cargo update
    cargo run
    cargo test
    cargo doc —open
```

- ==> [Rustfmt](https://github.com/rust-lang/rustfmt) <==

```bash
# rustfmt 是 Rust 的格式化工具
# installation:
    rustup component add rustfmt
```

- ==> [Rust-Clippy](https://github.com/rust-lang/rust-clippy) <==

```bash
# Rust-clippy 是 Rust 的 lint 工具
# installation:
    rustup component add clippy
```

- ==> [Rust-analyzer](https://github.com/rust-lang/rust-analyzer) <==

```bash
# Rust-analyzer 是 Rust 的语言服务器
# installation:
    # 推荐使用 VSCode 插件安装
    rustup component add rust-src
```
