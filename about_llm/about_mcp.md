## MCP Servers 笔记

[返回索引](../README.md)

---

```json
// 常用
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": [
        "-y",
        "@upstash/context7-mcp"
      ]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sequential-thinking"
      ]
    },
    "firecrawl-mcp": {
      "command": "npx",
      "args": [
        "-y",
        "firecrawl-mcp"
      ],
      "env": {
        "FIRECRAWL_API_KEY": "<api-key>"
      },
      "alwaysAllow": [
        "firecrawl_search"
      ]
    }
  }
}

// [exa](https://github.com/exa-labs/exa-mcp-server?tab=readme-ov-file)
  {
    "timeout": 60,
    "command": "npx",
    "args": ["exa-mcp-server"],
    "env": {
      "EXA_API_KEY": "<api-key>"
    },
    "transportType": "stdio",
    "disabled": true
  }

// supabase
  {
    "command": "npx",
    "args": [
      "-y",
      "@supabase/mcp-server-supabase@latest",
      "--access-token",
      "<api-key>"
    ]
  }

// puppeteer
  {
    "timeout": 60,
    "command": "npx",
    "args": ["-y", "@modelcontextprotocol/server-puppeteer"],
    "transportType": "stdio"
  }

// firecrawl
  {
    "command": "npx",
    "args": [
      "-y",
      "firecrawl-mcp"
    ],
    "env": {
      "FIRECRAWL_API_KEY": "<api-key>"
    },
    "alwaysAllow": [
      "firecrawl_search"
    ]
  }

// memory
  {
    "command": "npx",
    "args": [
      "-y",
      "@modelcontextprotocol/server-memory"
    ]
  }

// 21st
  {
    "command": "npx",
    "args": [
      "-y",
      "@21st-dev/magic@latest",
      "API_KEY='<api-key>'"
    ],
    "env": {
      "TWENTYFIRST

```
