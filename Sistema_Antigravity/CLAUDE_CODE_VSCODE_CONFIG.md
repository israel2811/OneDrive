# 🔧 GUÍA DE CONFIGURACIÓN DE CLAUDE CODE PARA VS CODE

## Estado Actual

| Componente | Estado |
|------------|--------|
| Claude Code CLI | ✅ Instalado (v2.1.30) |
| Node.js | ✅ v22.13.1 |
| VS Code Extension Settings | ✅ Configurado |
| WSL | ❌ No instalado |

---

## Configuración Actual (Windows Nativo)

La extensión está configurada en `settings.json` para usar:

```json
{
    "claude-code.nodePath": "C:\\Users\\Lenovo\\AppData\\Local\\ms-playwright-go\\1.50.1\\node.exe",
    "claude-code.claudePath": "C:\\Users\\Lenovo\\AppData\\Roaming\\npm\\claude.cmd",
    "claude-code.wsl.enabled": false
}
```

---

## Para Instalar WSL (Opcional)

Si deseas usar Claude Code dentro de WSL:

### Paso 1: Instalar WSL

**Abrir PowerShell como Administrador** y ejecutar:

```powershell
wsl --install -d Ubuntu
```

Esto instalará:
- Windows Subsystem for Linux
- Ubuntu como distribución por defecto

**Reiniciar el equipo cuando se pida.**

### Paso 2: Configurar Ubuntu

Después del reinicio, abrir Ubuntu y:

```bash
# Actualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar Node.js (via nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.bashrc
nvm install --lts

# Verificar Node
node --version
which node   # Debería mostrar: /home/usuario/.nvm/versions/node/vXX.X.X/bin/node

# Instalar Claude Code
curl -fsSL https://claude.ai/install.sh | bash

# Verificar Claude
claude --version
which claude   # Debería mostrar: /usr/local/bin/claude o ~/.local/bin/claude
```

### Paso 3: Actualizar VS Code Settings

Una vez instalado, editar `settings.json` en VS Code:

```json
{
    "claude-code.wsl.enabled": true,
    "claude-code.wsl.distribution": "Ubuntu",
    "claude-code.wsl.nodePath": "/home/tuusuario/.nvm/versions/node/vXX.X.X/bin/node",
    "claude-code.wsl.claudePath": "/usr/local/bin/claude"
}
```

---

## Permisos Auto-Permitidos

Los siguientes permisos están configurados para auto-aprobación:

```json
"claude-code.permissions.alwaysAllow": [
    "Read",
    "Edit", 
    "List",
    "Write"
]
```

### Para agregar más permisos:

1. Abrir VS Code
2. Ctrl+Shift+P → "Claude Code: Settings"
3. En "Permissions" → "+Add permission"
4. Agregar permisos como: `Bash(*)`, `Execute`, `Terminal`

---

## Modo YOLO (Auto-permitir TODO)

⚠️ **PRECAUCIÓN**: Este modo permite TODAS las operaciones sin preguntar.

Para activar en `settings.json`:

```json
"claude-code.yoloMode": true
```

**Solo recomendado para proyectos personales, NO para producción.**

---

## Cómo Usar Claude Code en VS Code

### Método 1: Panel de Chat
1. Ctrl+Shift+P → "Claude Code: Open Chat"
2. Escribir consulta o tarea

### Método 2: Inline (en código)
1. Seleccionar código
2. Ctrl+I (o clic derecho → "Ask Claude")
3. Escribir instrucción

### Método 3: Terminal Integrado
1. Abrir terminal en VS Code
2. Ejecutar: `claude`

---

## Troubleshooting

### Error: "Node not found"

```powershell
# Verificar que Node está en PATH
$env:Path += ";C:\Users\Lenovo\AppData\Local\ms-playwright-go\1.50.1"
node --version
```

### Error: "Claude not found"

```powershell
# Verificar instalación
& "C:\Users\Lenovo\AppData\Roaming\npm\claude.cmd" --version
```

### Reinstalar Claude Code

```powershell
# Windows
irm https://claude.ai/install.ps1 | iex

# WSL/Linux
curl -fsSL https://claude.ai/install.sh | bash
```

---

## Archivos de Configuración

| Archivo | Ubicación |
|---------|-----------|
| VS Code Settings | `C:\Users\Lenovo\AppData\Roaming\Code\User\settings.json` |
| Claude Code CLI | `C:\Users\Lenovo\AppData\Roaming\npm\claude.cmd` |
| Node.js | `C:\Users\Lenovo\AppData\Local\ms-playwright-go\1.50.1\node.exe` |
| Script de inicio | `C:\Users\Lenovo\OneDrive\Sistema_Antigravity\start_claude_code.ps1` |

---

**Actualizado**: 2026-02-05
**Versión Claude Code**: v2.1.30
