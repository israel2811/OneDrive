# Sistema Antigravity - Guia Rapida (2026-02-07)

## 1. App (Gravity/Antigravity/Core)
```powershell
cd C:\Users\Lenovo\OneDrive\Sistema_Antigravity
python -m venv .venv
. .venv\Scripts\Activate.ps1
pip install -r requirements.txt
streamlit run App\gravity_app.py
```
- Ingresa las API keys en la barra lateral.
- Selecciona velocidad: `Rapido` (flash/mini) o `Profundo` (premium).
- El dashboard ya llama a `process_request` de `fusion_antigravity.py` y devuelve respuesta real con cache de 1h.

## 2. Backups
```powershell
pwsh .\auto_backup.ps1          # backup inmediato + hash
pwsh .\schedule_auto_backup.ps1 # registra tarea horaria
pwsh .\healthcheck.ps1          # valida backups/n8n/espacio
```

## 3. n8n
- Arranca n8n (http://localhost:5678).
- Importa flujos: `pwsh .\n8n-integration\import_all_workflows.ps1`
- En n8n UI, configura credenciales: Google OAuth2, OpenAI, Anthropic, Perplexity, GitHub token. Luego activa los 10 workflows.

## 4. Sync a Google Drive
- Requiere `rclone` con un remote llamado `gdrive`.
```powershell
pwsh .\sync_thesis_to_drive.ps1
```
Sube MEGA_MASTER e indices a `gdrive:Antigravity/Tesis/<timestamp>`.

## 5. Mantenimiento adicional
- Programar limpieza semanal: `pwsh .\schedule_disk_cleanup.ps1`
- Importar workflows n8n (requiere n8n CLI instalado): `pwsh .\n8n-integration\import_all_workflows.ps1`

## 5. Notas tecnicas
- Requisitos clave: Python 3.10+, Brave con remote debugging (solo para la demo avanzada en `main_demo`), rclone opcional.
- Todos los scripts son ASCII-safe para evitar problemas de codificacion.
