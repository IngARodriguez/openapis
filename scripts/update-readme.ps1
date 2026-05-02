# Regenera README.md desde README.template.md sustituyendo {{BASE_URL}} con
# el contenido de endpoint.txt.
#
# Uso:
#   .\scripts\update-readme.ps1
#
# Después haz: git add README.md endpoint.txt; git commit -m "..."; git push

$ErrorActionPreference = "Stop"

$repoRoot     = Split-Path -Parent $PSScriptRoot
$endpointFile = Join-Path $repoRoot "endpoint.txt"
$templateFile = Join-Path $repoRoot "README.template.md"
$readmeFile   = Join-Path $repoRoot "README.md"

if (-not (Test-Path $endpointFile)) {
    Write-Error "No se encontró endpoint.txt en $repoRoot"
}
if (-not (Test-Path $templateFile)) {
    Write-Error "No se encontró README.template.md en $repoRoot"
}

$url = (Get-Content -Raw $endpointFile).Trim()
if (-not $url) {
    Write-Error "endpoint.txt está vacío"
}

# Quita slash final si existe (la URL base no debe terminar en /)
$url = $url.TrimEnd("/")

$template = Get-Content -Raw $templateFile
$readme   = $template -replace "\{\{BASE_URL\}\}", $url

# UTF-8 sin BOM (lo que GitHub espera)
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[System.IO.File]::WriteAllText($readmeFile, $readme, $utf8NoBom)

Write-Host "OK. README.md regenerado con BASE_URL = $url"
