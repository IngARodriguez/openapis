#!/usr/bin/env bash
# Regenera README.md desde README.template.md sustituyendo {{BASE_URL}} con
# el contenido de endpoint.txt.
#
# Uso:
#   ./scripts/update-readme.sh
#
# Después haz: git add README.md endpoint.txt && git commit -m "..." && git push

set -euo pipefail

cd "$(dirname "$0")/.."

[[ -f endpoint.txt ]]         || { echo "No se encontró endpoint.txt" >&2; exit 1; }
[[ -f README.template.md ]]   || { echo "No se encontró README.template.md" >&2; exit 1; }

URL=$(tr -d '[:space:]' < endpoint.txt)
[[ -n "$URL" ]] || { echo "endpoint.txt está vacío" >&2; exit 1; }

# Quita slash final si existe
URL="${URL%/}"

# Sustitución usando un delimitador raro para sed (la URL contiene /)
sed "s|{{BASE_URL}}|${URL}|g" README.template.md > README.md

echo "OK. README.md regenerado con BASE_URL = ${URL}"
