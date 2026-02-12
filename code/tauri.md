# Tauri 常用代码

## 📒 src-tauri

_用于 Tauri 项目的 Rust 代码，包含了 Tauri 的核心功能和逻辑实现_

- Cargo.toml
    - 系统托盘 (Tray)
        - 托盘图标功能需要在 Cargo.toml 中启用 `tray-icon` 功能：

        ```toml
        [dependencies]
        tauri = { version = "2", features = ["tray-icon"] }
        ```

- main.rs
    - 系统托盘 (Tray)
        - 在 main.rs 中设置系统托盘图标和菜单：
        - 版本 A:

        ```rust
        <!-- 版本 A -->
        use tauri::{CustomMenuItem, SystemTray, SystemTrayMenu, SystemTrayEvent};

        fn main() {
            let tray_menu = SystemTrayMenu::new()
                .add_item(CustomMenuItem::new("show".to_string(), "Show"))
                .add_item(CustomMenuItem::new("quit".to_string(), "Quit"));

            let system_tray = SystemTray::new().with_menu(tray_menu);

            tauri::Builder::default()
                .system_tray(system_tray)
                .on_system_tray_event(|app, event| match event {
                    SystemTrayEvent::MenuItemClick { id, .. } => {
                        if id.as_str() == "show" {
                            let window = app.get_window("main").unwrap();
                            window.show().unwrap();
                        } else if id.as_str() == "quit" {
                            std::process::exit(0);
                        }
                    }
                    _ => {}
                })
                .run(tauri::generate_context!())
                .expect("error while running tauri application");
        }
        ```

        - 版本 B:

        ```rust
        <!-- 版本 B -->
        #![cfg_attr(not(debug_assertions), windows_subsystem = "windows")]

        use tauri::{
            menu::{Menu, MenuItem},
            tray::{MouseButton, MouseButtonState, TrayIconBuilder, TrayIconEvent},
            Manager, WindowEvent,
        };

        fn main() {
            tauri::Builder::default()
                .plugin(tauri_plugin_shell::init())
                .setup(|app| {
                    // 创建托盘菜单项
                    let quit = MenuItem::with_id(app, "quit", "退出", true, None::<&str>)?;
                    let show = MenuItem::with_id(app, "show", "显示窗口", true, None::<&str>)?;

                    // 构建托盘菜单
                    let menu = Menu::with_items(app, &[&show, &quit])?;

                    // 创建系统托盘
                    let _tray = TrayIconBuilder::new()
                        .icon(app.default_window_icon().unwrap().clone())
                        .menu(&menu)
                        .menu_on_left_click(false)
                        .tooltip("Tauri 系统托盘应用")
                        .on_menu_event(|app, event| match event.id.as_ref() {
                            "quit" => {
                                app.exit(0);
                            }
                            "show" => {
                                if let Some(window) = app.get_webview_window("main") {
                                    window.show().unwrap();
                                    window.set_focus().unwrap();
                                }
                            }
                            _ => {}
                        })
                        .on_tray_icon_event(|tray, event| {
                            // 左键点击显示窗口
                            if let TrayIconEvent::Click {
                                button: MouseButton::Left,
                                button_state: MouseButtonState::Up,
                                ..
                            } = event
                            {
                                let app = tray.app_handle();
                                if let Some(window) = app.get_webview_window("main") {
                                    window.show().unwrap();
                                    window.set_focus().unwrap();
                                }
                            }
                        })
                        .build(app)?;

                    Ok(())
                })
                .run(tauri::generate_context!())
                .expect("error while running tauri application");
        }

        ```

---

## 📒 src

_用于 Tauri 项目的前端代码，通常包含了应用的界面和交互逻辑_
