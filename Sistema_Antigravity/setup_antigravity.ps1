# Setup Antigravity and Claude Code Integration
Write-Host "Installing fnm (Fast Node Manager)..."
winget install Schniz.fnm --accept-source-agreements --accept-package-agreements

# Add fnm to current session path (assuming standard install location for winget)
$env:Path = "$env:LOCALAPPDATA\Microsoft\WinGet\Links;$env:Path"

Write-Host "Installing Node.js LTS via fnm..."
fnm install --lts
fnm use lts-latest
fnm env --use-on-cd | Out-String | Invoke-Expression

Write-Host "Verifying Node.js..."
node --version
npm --version

Write-Host "Installing antigravity-claude-proxy..."
npm install -g antigravity-claude-proxy@latest

Write-Host "Creating Directories..."
$claudePath = "$env:USERPROFILE\.claude"
$claudeAgPath = "$env:USERPROFILE\.claude-antigravity"
if (!(Test-Path $claudePath)) { New-Item -ItemType Directory -Path $claudePath -Force }
if (!(Test-Path $claudeAgPath)) { New-Item -ItemType Directory -Path $claudeAgPath -Force }

Write-Host "Configuration completed. Please run the start scripts created."
