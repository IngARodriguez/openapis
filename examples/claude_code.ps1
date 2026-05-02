# Claude Code -> OpenAPIs (Windows PowerShell)

if (-not $env:ANTHROPIC_BASE_URL) {
    $env:ANTHROPIC_BASE_URL = "https://tapeless-recluse-disperser.ngrok-free.dev/anthropic"
}
if (-not $env:ANTHROPIC_AUTH_TOKEN) {
    $env:ANTHROPIC_AUTH_TOKEN = if ($env:ANTHROPIC_API_KEY) { $env:ANTHROPIC_API_KEY } else { "admin" }
}

if (-not (Get-Command claude -ErrorAction SilentlyContinue)) {
    Write-Host "claude no encontrado. Instala con:"
    Write-Host "  npm install -g @anthropic-ai/claude-code"
    exit 1
}

claude $args
