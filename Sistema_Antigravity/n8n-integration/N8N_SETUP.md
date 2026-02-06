# 🔄 n8n Integration Setup para Antigravity

## Descripción
n8n es un orquestador de workflows self-hosted que integrará todas las conversaciones y procesos de Antigravity.

## Estado: 🟡 En Configuración

---

## 📋 Configuración Rápida

### 1. Iniciar n8n (Opción A: NPX - Recomendada)
```powershell
npx -y n8n
```
Esto iniciará n8n en: http://localhost:5678

### 2. Iniciar n8n (Opción B: Docker)
```powershell
docker run -it --rm --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8nio/n8n
```

---

## 🔐 Credenciales OAuth Google Cloud

**Client ID:** `587757437379-c4s4dtaq1ano9gqc2ka15jo941be8ibd.apps.googleusercontent.com`
**Client Secret:** `[PENDIENTE - Usuario debe proporcionar]`
**Redirect URI:** `http://localhost:5678/rest/oauth2-credential/callback`

### Scopes necesarios para Google Cloud:
- `https://www.googleapis.com/auth/drive` - Google Drive
- `https://www.googleapis.com/auth/documents` - Google Docs
- `https://www.googleapis.com/auth/calendar` - Google Calendar
- `https://www.googleapis.com/auth/gmail.modify` - Gmail

---

## 🔧 Workflows a Crear en n8n

### 1. Sincronización de Conversaciones
Trigger: Webhook → Acción: Guardar en Google Drive
```
[Webhook Antigravity] → [Format Data] → [Google Drive: Upload]
```

### 2. Backup Automático de Archivos
Trigger: Schedule (cada hora) → Acción: Sincronizar carpetas
```
[Schedule Trigger] → [Read Files] → [Google Drive: Sync]
```

### 3. Notificaciones de Estado
Trigger: Cambio en STATUS_TRACKER.md → Acción: Notificar
```
[File Watcher] → [Parse Markdown] → [Gmail: Send]
```

### 4. Procesamiento de Consultas AI
Trigger: Webhook → Procesar con OpenAI → Responder
```
[Webhook] → [OpenAI: Chat] → [Webhook Response]
```

---

## 📁 Estructura de Archivos de Configuración

```
C:\Users\Lenovo\OneDrive\Sistema_Antigravity\n8n-integration\
├── N8N_SETUP.md                    ← Este archivo
├── credentials\
│   └── google_oauth.env            ← Credenciales (NO SUBIR A GIT)
├── workflows\
│   ├── sync_conversations.json
│   ├── auto_backup.json
│   ├── notifications.json
│   └── ai_processing.json
└── templates\
    ├── webhook_endpoint.md
    └── integration_guide.md
```

---

## ⚡ Comandos Útiles

### Iniciar n8n en modo producción:
```powershell
$env:N8N_PORT="5678"
$env:N8N_BASIC_AUTH_ACTIVE="true"
$env:N8N_BASIC_AUTH_USER="admin"
$env:N8N_BASIC_AUTH_PASSWORD="tu_password_seguro"
npx -y n8n
```

### Iniciar n8n con Google OAuth:
```powershell
$env:N8N_PORT="5678"
$env:GOOGLE_CLIENT_ID="587757437379-c4s4dtaq1ano9gqc2ka15jo941be8ibd.apps.googleusercontent.com"
$env:GOOGLE_CLIENT_SECRET="TU_CLIENT_SECRET_AQUI"
npx -y n8n
```

---

## 🔗 Integraciones Disponibles para Antigravity

| Servicio | Tipo | Estado |
|----------|------|--------|
| Google Drive | OAuth2 | 🟡 Pendiente secret |
| Google Docs | OAuth2 | 🟡 Pendiente secret |
| Gmail | OAuth2 | 🟡 Pendiente secret |
| Google Calendar | OAuth2 | 🟡 Pendiente secret |
| GitHub | Token | ✅ Disponible vía MCP |
| OpenAI | API Key | ⬜ Por configurar |
| Webhook | HTTP | ✅ Listo |
| Cron/Schedule | Interno | ✅ Listo |

---

## 📌 Próximos Pasos

1. [ ] Obtener Client Secret de Google OAuth
2. [ ] Iniciar n8n con `npx -y n8n`
3. [ ] Configurar credencial Google OAuth en n8n UI
4. [ ] Crear primer workflow de sincronización
5. [ ] Configurar webhooks para Antigravity

---

**Última actualización:** 2026-02-05
**Ubicación:** OneDrive\Sistema_Antigravity\n8n-integration\
