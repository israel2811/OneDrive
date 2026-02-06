# 🔧 INSTRUCCIONES PARA INICIAR n8n

## ⚠️ Problema Detectado

Tu versión de Node.js (v25.4.0) es demasiado nueva para n8n.
n8n requiere: Node.js v18, v20, o v22

---

## 🚀 OPCIÓN 1: Instalar nvm-windows (Recomendada)

### Paso 1: Verificar si nvm ya está instalado
Abre una **nueva** terminal PowerShell y ejecuta:
```powershell
nvm version
```

Si funciona, salta al Paso 3.

### Paso 2: Si nvm no funciona, reinstalar
1. Descarga nvm-windows desde: https://github.com/coreybutler/nvm-windows/releases
2. Descarga `nvm-setup.exe` de la última versión
3. Ejecuta el instalador como administrador
4. Cierra y abre una nueva terminal PowerShell

### Paso 3: Instalar Node.js v20
```powershell
nvm install 20
nvm use 20
node --version  # Debería mostrar v20.x.x
```

### Paso 4: Iniciar n8n
```powershell
cd "C:\Users\Lenovo\OneDrive\Sistema_Antigravity\n8n-integration"
npx -y n8n
```

### Paso 5: Abrir en navegador
Ir a: http://localhost:5678

---

## 🐳 OPCIÓN 2: Usar Docker (Si tienes Docker)

```powershell
docker run -it --rm --name n8n -p 5678:5678 -v "$env:USERPROFILE\.n8n:/home/node/.n8n" n8nio/n8n
```

---

## 📦 OPCIÓN 3: Instalar Node.js v20 directamente

1. Ir a: https://nodejs.org/en/download/
2. Descargar Node.js v20 LTS
3. Desinstalar Node.js v25 actual (opcional pero recomendado)
4. Instalar Node.js v20
5. Ejecutar `npx -y n8n`

---

## 📝 Una vez n8n esté corriendo

1. Abrir http://localhost:5678
2. Crear cuenta de administrador
3. Ir a Settings → Import from File
4. Importar los workflows de:
   `C:\Users\Lenovo\OneDrive\Sistema_Antigravity\n8n-integration\workflows\`

---

## 🔌 Workflows listos para importar

| Archivo | Función |
|---------|---------|
| 01_auto_backup.json | Backup automático cada hora |
| 02_conversation_sync.json | Sincronizar conversaciones |
| 03_daily_summary.json | Resumen diario 9 AM |
| 04_thesis_tracker.json | Tracking de tesis |
| 05_multi_ai.json | Multi-AI orchestration |
| 06_git_auto_commit.json | Auto-commit Git |
| 07_error_recovery.json | Recuperación de errores |
| 08_health_check.json | Health check del sistema |
| 09_conversation_logger.json | Log de conversaciones |
| 10_file_watcher.json | Sincronización de archivos |

---

**Generado**: 2026-02-05T06:00:00-06:00
**Por**: Antigravity
