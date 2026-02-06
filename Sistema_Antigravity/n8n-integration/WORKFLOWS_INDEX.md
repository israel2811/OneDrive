# 📊 N8N Workflows Master Index

**Última actualización**: 2026-02-05T05:40:00-06:00
**Total Workflows**: 10
**Estado**: Listos para importar

---

## 🚀 Instrucciones de Importación

1. Abrir n8n en http://localhost:5678
2. Ir a Settings → Import from File
3. Seleccionar cada archivo .json de la carpeta `workflows/`
4. Activar cada workflow después de importar

---

## 📋 Lista de Workflows

### Automatización Core

| # | Workflow | Archivo | Trigger | Descripción |
|---|----------|---------|---------|-------------|
| 01 | Auto Backup | `01_auto_backup.json` | Cada hora | Backup a Google Drive |
| 02 | Conversation Sync | `02_conversation_sync.json` | Webhook | Guardar conversaciones |
| 03 | Daily Summary | `03_daily_summary.json` | 9 AM diario | Resumen por email |
| 04 | Thesis Tracker | `04_thesis_tracker.json` | 6 PM diario | Conteo de palabras |
| 05 | Multi-AI | `05_multi_ai.json` | Webhook | Consultar múltiples IAs |

### Automatización Avanzada

| # | Workflow | Archivo | Trigger | Descripción |
|---|----------|---------|---------|-------------|
| 06 | Git Auto-Commit | `06_git_auto_commit.json` | Cada 2 horas | Commits automáticos |
| 07 | Error Recovery | `07_error_recovery.json` | Webhook | Recuperación de errores |
| 08 | Health Check | `08_health_check.json` | Cada 5 min | Monitoreo de n8n |
| 09 | Conversation Logger | `09_conversation_logger.json` | Webhook | Log de conversaciones |
| 10 | File Watcher | `10_file_watcher.json` | Cambio de archivo | Sync de cambios |

---

## 🔗 Webhooks Disponibles

Una vez activados, estos webhooks estarán disponibles:

| Endpoint | Método | Uso |
|----------|--------|-----|
| `http://localhost:5678/webhook/save-conversation` | POST | Guardar conversación |
| `http://localhost:5678/webhook/ask-all-ais` | POST | Multi-AI query |
| `http://localhost:5678/webhook/error-detected` | POST | Reportar error |
| `http://localhost:5678/webhook/log-conversation` | POST | Log conversation |

### Ejemplo de uso (PowerShell):

```powershell
# Guardar una conversación
$body = @{
    title = "Mi conversación"
    content = "Contenido de la conversación..."
    tags = "thesis,research"
} | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:5678/webhook/save-conversation" -Method POST -Body $body -ContentType "application/json"
```

---

## ⚙️ Credenciales Necesarias

Para funcionalidad completa, configura estas credenciales en n8n:

- [ ] **Google OAuth2** - Para Drive, Docs, Gmail
- [ ] **OpenAI API Key** - Para GPT-4
- [ ] **Anthropic API Key** - Para Claude
- [ ] **Perplexity API Key** - Para research
- [ ] **GitHub Token** - Para Git operations

---

## 📈 Métricas de Automatización

| Métrica | Valor |
|---------|-------|
| Tareas automatizadas/día | ~50+ |
| Backups automáticos/día | 24 |
| Reports generados/día | 1 |
| Commits automáticos/día | 12 |

---

**Generado por**: Antigravity
**Ubicación**: OneDrive/Sistema_Antigravity/n8n-integration/
