# 🚀 GUÍA DE CLAUDE CODE PARA ANTIGRAVITY

## Instalación Completada ✅

**Claude Code v2.1.30** está instalado correctamente.

## Cómo Usarlo

### Opción 1: Script de Inicio

```powershell
cd C:\Users\Lenovo\OneDrive\Sistema_Antigravity
.\start_claude_code.ps1
```

### Opción 2: Configurar PATH Permanente

Añadir a PowerShell Profile (~\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1):

```powershell
$nodePath = "C:\Users\Lenovo\AppData\Local\ms-playwright-go\1.50.1"
$env:Path = "$nodePath;$env:Path"
```

### Opción 3: Variables de Entorno del Sistema

1. Win + X → Sistema → Configuración avanzada del sistema
2. Variables de entorno
3. PATH → Editar → Añadir:
   - `C:\Users\Lenovo\AppData\Local\ms-playwright-go\1.50.1`

## Comandos Básicos de Claude Code

```powershell
# Iniciar Claude Code en directorio actual
claude

# Ver versión
claude --version

# Ejecutar con prompt específico
claude -p "Describe this project"

# Modo conversacional
claude chat
```

## Uso con VS Code

1. Instalar extensión "Claude Code" desde VS Code Extensions
2. Ctrl+Shift+P → "Claude: Start Claude Code"
3. O usar terminal integrado: `claude`

## Extensión Chrome (Beta)

Para debugging en vivo y verificación de diseño web:
1. Ir a Chrome Web Store
2. Buscar "Claude Code"
3. Instalar la extensión beta

## Recursos

- [Documentación Oficial](https://docs.anthropic.com/en/docs/claude-code)
- [Quickstart Guide](https://docs.anthropic.com/en/docs/claude-code/getting-started/quickstart)
- [Common Workflows](https://docs.anthropic.com/en/docs/claude-code/getting-started/common-workflows)

---
**Versión Instalada**: v2.1.30
**Node.js**: v22.13.1 (vía Playwright)
**Fecha**: 2026-02-05
