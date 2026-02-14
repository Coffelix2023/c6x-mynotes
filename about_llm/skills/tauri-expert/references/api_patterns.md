# Rust 指令与 TS 交互最佳实践

## Rust 端实现 (带初学者中文注释)

```rust
// 这是一个普通的 Rust 函数，通过 #[tauri::command] 宏将其暴露给前端
// #[tauri::command] 告诉 Tauri，这个函数可以被前端的 invoke API 调用
#[tauri::command]
pub fn greet(name: &str) -> String {
    // format! 宏用于创建一个格式化字符串
    // 在这里，我们将字符串 "Hello, " 与传入的 name 参数拼接在一起
    format!("你好, {}! 欢迎使用 Tauri!", name)
}

// 如果函数可能失败，应该返回 Result 类型
// Result 是一个枚举类型，可以是 Ok(成功) 或 Err(错误)
#[tauri::command]
pub fn save_data(data: String) -> Result<String, String> {
    if data.is_empty() {
        // 返回 Err 意味着调用失败，前端会进入 catch 块
        return Err("数据不能为空".into());
    }
    
    // 假设这里执行了保存操作...
    
    // 返回 Ok 意味着调用成功，前端会进入 then 块
    Ok("成功保存数据".into())
}

// 在 lib.rs 或 main.rs 中注册这些指令
/*
tauri::Builder::default()
    .invoke_handler(tauri::generate_handler![greet, save_data]) // 注册指令
    .run(tauri::generate_context!())
    .expect("运行 Tauri 应用程序时出错");
*/
```

## TypeScript 前端调用

```typescript
import { invoke } from "@tauri-apps/api/core";

// 调用普通指令
async function handleGreet() {
  try {
    // invoke('指令名称', { 参数名: 值 })
    const response = await invoke<string>("greet", { name: "Felix" });
    console.log(response); // 输出: 你好, Felix! 欢迎使用 Tauri!
  } catch (error) {
    console.error("调用指令出错:", error);
  }
}

// 处理带 Result 的指令
async function handleSave(content: string) {
  try {
    const message = await invoke<string>("save_data", { data: content });
    alert(message);
  } catch (error: any) {
    // 这里的 error 对应 Rust 中返回的 Err("...")
    alert(`错误: ${error}`);
  }
}
```

## 核心概念解释

1. **指令 (Command)**: 本质上是 Rust 函数，被 Tauri 包装后可以跨进程通信 (IPC) 被前端调用。
2. **Result 类型**: Rust 的错误处理机制。不再使用 try-catch 抛异常，而是显式返回一个包含成功或失败信息的值。
3. **IPC**: Inter-Process Communication。Tauri 的前端 Webview 和 Rust 后端运行在不同的进程中，`invoke` 是它们之间的桥梁。
