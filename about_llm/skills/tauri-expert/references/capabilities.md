# Tauri v2 安全能力配置 (Capabilities)

在 Tauri v2 中，`capabilities` 取代了 v1 的 `allowlist`。它是基于 JSON/TOML 的细粒度权限控制。

## 配置路径

文件通常位于: `src-tauri/capabilities/default.json`

## 常用权限模板

### 1. 基础文件读写隔离

```json
{
  "$schema": "../gen/schemas/desktop-schema.json",
  "identifier": "main-capability",
  "description": "允许主窗口使用的核心 API",
  "windows": ["main"],
  "permissions": [
    "path:default",
    "fs:default",
    {
      "identifier": "fs:allow-read",
      "allow": [{ "path": "$APPDATA/**" }]
    }
  ]
}
```

### 2. HTTP 权限

```json
{
  "permissions": [
    "http:default",
    {
      "identifier": "http:allow-request",
      "allow": [{ "url": "https://api.github.com/**" }]
    }
  ]
}
```

## 权限说明

- `identifier`: 权限的唯一标识。
- `allow`/`deny`: 明确允许或拒绝的资源范围。
- `windows`: 定义这些权限适用于哪些前端窗口。

## 技巧

- 使用 `pnpm tauri dev` 时，如果控制台报错 "Permission Denied"，通常是因为 `capabilities` 中未包含对应的权限条目。
