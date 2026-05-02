# Claude Code -> OpenAPIs (Windows PowerShell)

$env:ANTHROPIC_BASE_URL = "https://api.openapis.dev/anthropic"
$env:ANTHROPIC_AUTH_TOKEN = if ($env:OPENAPIS_KEY) { $env:OPENAPIS_KEY } else { "tu_clave_secreta" }

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "claude no encontrado. Instala con:"
    Write-Host "  npm install -g @anthropic-ai/claude-code"
    exit 1
}

claude $args
