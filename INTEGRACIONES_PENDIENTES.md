# Integraciones y configuraciones solicitadas (historial de conversaciones)

Estado a 2026-02-07.

- Claude Code + Antigravity: configurado; falta documentar flujo final de uso en VS Code (pendiente).
- Multi-IA (Claude, Gemini, OpenAI): fusion operativa en `App/` (Streamlit + pipeline); falta robustez avanzada con browser_use opcional.
- Voz permanente: sintetizador gTTS activo en dashboard; pendiente version TTS local/offline.
- Workflows n8n (10): archivos listos e import script creado; falta instalar n8n CLI (npm -g n8n) e importarlos/activarlos con credenciales.
- Backups automáticos: script reforzado + tarea programable (`schedule_auto_backup.ps1`); falta revisar ejecución diaria y comprobar hashes.
- Sincronización Cloud (Drive/Docs): script `sync_thesis_to_drive.ps1` listo; requiere `rclone` + credenciales Google (remote `gdrive`).
- Git auto-commit: workflow `06_git_auto_commit.json` existe; falta token GitHub y activarlo.
- Limpieza de disco: `disk_cleanup.ps1` existente; ya hay agenda semanal (`schedule_disk_cleanup.ps1`).
- Health/alertas: `healthcheck.ps1` añadido; falta integrar alertas (correo/Telegram) o activarlas via n8n.
- MCP servers catalogados: pendientes de instalación y carga masiva en entorno actual.
- Publicación de tesis: pendiente subir los 10 capítulos a Drive/Docs y generar visualizaciones/figuras.
