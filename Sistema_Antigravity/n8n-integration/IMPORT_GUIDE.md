# 🤖 GUÍA DE IMPORTACIÓN DE WORKFLOWS N8N

## ¡n8n ESTÁ LISTO! 🚀
Ya solucionamos el problema de Node.js y n8n está corriendo en tu máquina.

Sigue estos pasos EXACTOS para activar tu automatización:

### 1. Abrir n8n
Ve a tu navegador y abre:
👉 **http://localhost:5678**

*(Si te pide crear cuenta, crea una simple con tu email)*

### 2. Importar Workflows
Tienes 10 workflows listos en:
`C:\Users\Lenovo\OneDrive\Sistema_Antigravity\n8n-integration\workflows\`

**Opción A (Rápida - Bulk Import):**
1. En n8n, ve a menú **Workflows**
2. Clic en **Import from File**
3. Selecciona TODOS los archivos JSON de la carpeta mencionada arriba
4. Clic en Open

**Opción B (Uno por uno):**
1. Abre el archivo JSON con Notepad
2. Copia todo el texto
3. En n8n, crea nuevo workflow
4. Pega el texto (Ctrl+V) en el canvas
5. Guarda y activa

### 3. Activar Webhooks
Una vez importados, busca el workflow **"02 - Conversation Sync"** y actívalo (switch arriba a la derecha).

Ahora tienes esta URL activa:
`http://localhost:5678/webhook/save-conversation`

### 4. Configurar Google Cloud (CRÍTICO PARA BACKUPS)
Para que los backups funcionen:
1. Ve a **Credentials** en n8n
2. Crea nueva credential "Google Drive OAuth2 API"
3. Usa estos datos:
   - Client ID: `587757437379-c4s4dtaq1ano9gqc2ka15jo941be8ibd.apps.googleusercontent.com`
   - Client Secret: `(Necesitas obtenerlo de Google Cloud Console)`
4. Clic en "Connect my account"

---

## 🆘 ¿PROBLEMAS?
Si n8n no abre, ejecuta este script de reinicio:
`C:\Users\Lenovo\OneDrive\Sistema_Antigravity\start_system.ps1`

