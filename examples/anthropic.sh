#!/usr/bin/env bash
# Anthropic compatible — OpenAPIs proxy

API_KEY="${ANTHROPIC_API_KEY:-admin}"
BASE_URL="${ANTHROPIC_BASE_URL:-https://tapeless-recluse-disperser.ngrok-free.dev/anthropic}"

# Sin streaming
curl "$BASE_URL/v1/messages" \
  -H "x-api-key: $API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-opus-4-7",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hola"}]
  }'

echo
echo "--- streaming ---"

# Con streaming (-N desactiva el buffer y muestra los eventos SSE en vivo)
curl -N "$BASE_URL/v1/messages" \
  -H "x-api-key: $API_KEY" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-opus-4-7",
    "max_tokens": 1024,
    "stream": true,
    "messages": [{"role": "user", "content": "Hola"}]
  }'
