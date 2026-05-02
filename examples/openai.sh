#!/usr/bin/env bash
# OpenAI compatible — OpenAPIs proxy

API_KEY="${OPENAI_API_KEY:-admin}"
BASE_URL="${OPENAI_BASE_URL:-https://tapeless-recluse-disperser.ngrok-free.dev/openai}/v1"

# Sin streaming
curl "$BASE_URL/chat/completions" \
  -H "Authorization: Bearer $API_KEY" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.5",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hola"}]
  }'

echo
echo "--- streaming ---"

# Con streaming (-N desactiva el buffer y muestra los eventos SSE en vivo)
curl -N "$BASE_URL/chat/completions" \
  -H "Authorization: Bearer $API_KEY" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.5",
    "max_tokens": 1024,
    "stream": true,
    "messages": [{"role": "user", "content": "Hola"}]
  }'
