#!/usr/bin/env bash
# Claude Code → OpenAPIs

export ANTHROPIC_BASE_URL="${ANTHROPIC_BASE_URL:-https://tapeless-recluse-disperser.ngrok-free.dev/anthropic}"
export ANTHROPIC_AUTH_TOKEN="${ANTHROPIC_AUTH_TOKEN:-${ANTHROPIC_API_KEY:-admin}}"

# Verifica que tienes claude code instalado
if ! command -v claude &>/dev/null; then
  echo "claude no encontrado. Instala con:"
  echo "  npm install -g @anthropic-ai/claude-code"
  exit 1
fi

claude "$@"
