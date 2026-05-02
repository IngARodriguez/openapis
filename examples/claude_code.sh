#!/usr/bin/env bash
# Claude Code → OpenAPIs

export ANTHROPIC_BASE_URL="https://api.openapis.dev/anthropic"
export ANTHROPIC_AUTH_TOKEN="${OPENAPIS_KEY:-tu_clave_secreta}"

# Verifica que tienes claude code instalado
if ! command -v claude &>/dev/null; then
  echo "claude no encontrado. Instala con:"
  echo "  npm install -g @anthropic-ai/claude-code"
  exit 1
fi

claude "$@"
