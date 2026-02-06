# 🔑 GUÍA RÁPIDA: Obtener Google Client Secret para n8n

Esto es lo ÚNICO que falta para activar tus backups automáticos.
Toma 2 minutos.

### 1. Ir a la Consola de Google Cloud
Haz clic aquí:
👉 **[https://console.cloud.google.com/apis/credentials](https://console.cloud.google.com/apis/credentials)**

### 2. Selecciona tu Proyecto
En la barra superior, asegúrate de estar en el proyecto "Antigravity" o el que creaste para esto.

### 3. Crear Credenciales (Si no existen)
1. Clic en **+ CREATE CREDENTIALS** (arriba)
2. Elige **OAuth client ID**
3. Application type: **Web application**
4. Name: `n8n Antigravity`
5. **Authorized redirect URIs** (¡IMPORTANTE!):
   Agrega exactamente estas dos:
   - `http://localhost:5678/rest/oauth2-credential/callback`
   - `https://oauth.n8n.io/v2/callback`
6. Clic **CREATE**

### 4. Copiar Datos
Te mostrará una ventana con dos códigos largos. Cópialos aquí:

**Client ID**: (Ya lo tenemos, suele empezar con números y terminar en .apps.googleusercontent.com)
**Client Secret**: (Este es el que necesitamos, empieza con `GOCSPX-`...)

---

### 5. Ponerlos en n8n
1. Abre http://localhost:5678
2. Ve a **Credentials** > **Add Credential**
3. Busca **Google Drive OAuth2 API**
4. Pega el Client ID y Client Secret
5. Clic **Connect my account**
6. ¡LISTO! 🎉

---

### 💡 ¿Por qué hacemos esto?
Esto le da permiso a tu n8n local para guardar:
- Backups de tu Tesis
- Logs de chat
- Archivos de sincronización
Directamente en tu Google Drive sin intervención manual.
