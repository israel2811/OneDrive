# 🔧 MCP Servers Configuration

Este archivo documenta todos los MCP servers a instalar para maximizar las capacidades del sistema.

## ✅ MCP Servers Activos (3)

| Server | Estado | Uso |
|--------|--------|-----|
| `everything` | ✅ Activo | Herramientas generales |
| `github` | ✅ Activo | Operaciones Git/GitHub |
| `memory` | ✅ Activo | Memoria persistente |

## 📋 MCP Servers Prioritarios (Top 10 para instalar)

### 1. @mcp/google-drive
```json
{
  "google-drive": {
    "command": "npx",
    "args": ["-y", "@anthropic/mcp-google-drive"],
    "env": { "GOOGLE_CREDENTIALS_PATH": "path/to/credentials.json" }
  }
}
```

### 2. @mcp/notion
```json
{
  "notion": {
    "command": "npx",
    "args": ["-y", "@mcp/notion"],
    "env": { "NOTION_API_KEY": "secret_xxx" }
  }
}
```

### 3. @mcp/openai
```json
{
  "openai": {
    "command": "npx",
    "args": ["-y", "@mcp/openai"],
    "env": { "OPENAI_API_KEY": "sk-xxx" }
  }
}
```

### 4. @mcp/perplexity
```json
{
  "perplexity": {
    "command": "npx",
    "args": ["-y", "@mcp/perplexity"],
    "env": { "PERPLEXITY_API_KEY": "pplx-xxx" }
  }
}
```

### 5. @mcp/postgres
```json
{
  "postgres": {
    "command": "npx",
    "args": ["-y", "@mcp/postgres"],
    "env": { "DATABASE_URL": "postgresql://..." }
  }
}
```

### 6. @mcp/slack
```json
{
  "slack": {
    "command": "npx",
    "args": ["-y", "@mcp/slack"],
    "env": { "SLACK_TOKEN": "xoxb-xxx" }
  }
}
```

### 7. @mcp/docker
```json
{
  "docker": {
    "command": "npx",
    "args": ["-y", "@mcp/docker"]
  }
}
```

### 8. @mcp/puppeteer
```json
{
  "puppeteer": {
    "command": "npx",
    "args": ["-y", "@anthropic/mcp-puppeteer"]
  }
}
```

### 9. @mcp/filesystem
```json
{
  "filesystem": {
    "command": "npx",
    "args": ["-y", "@anthropic/mcp-filesystem", "C:/Users/Lenovo/OneDrive"]
  }
}
```

### 10. @mcp/fetch
```json
{
  "fetch": {
    "command": "npx",
    "args": ["-y", "@anthropic/mcp-fetch"]
  }
}
```

---

## 📁 Ubicación del archivo de configuración

**Windows**: `%APPDATA%\Anthropic\settings.json`
**Path completo**: `C:\Users\Lenovo\AppData\Roaming\Anthropic\settings.json`

---

## 🚀 Comando para agregar todos los MCP servers

Una vez que tengas las API keys, ejecuta:

```powershell
# Editar settings.json de Antigravity
notepad "$env:APPDATA\Anthropic\settings.json"
```

Y agrega los servidores en la sección `mcpServers`.

---

**Última actualización**: 2026-02-05
