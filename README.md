<!--
  README TEMPLATE
  ───────────────
  Para cambiar la URL del endpoint:
    1. Edita endpoint.txt (una sola línea, la URL base sin path)
    2. Ejecuta:
         scripts/update-readme.ps1   (Windows PowerShell)
         scripts/update-readme.sh    (Linux/macOS/WSL/Git Bash)
    3. Esto regenera README.md sustituyendo https://tapeless-recluse-disperser.ngrok-free.dev por la URL nueva
    4. git add README.md endpoint.txt && git commit && git push
  No edites README.md a mano — se sobrescribe.
-->
# Open**A**P**I**s

> Una sola URL. Una sola clave. Acceso unificado a las mejores IAs del mundo, vía proxy compatible con sus SDKs oficiales.

[![Beta abierta](https://img.shields.io/badge/beta-abierta-22c55e?style=flat-square)](#-beta-abierta--gratis)
[![License: MIT](https://img.shields.io/badge/License-MIT-6e56cf?style=flat-square)](LICENSE)
[![OpenAI compatible](https://img.shields.io/badge/OpenAI-compatible-000?style=flat-square&logo=openai&logoColor=white)](#openai)
[![Anthropic compatible](https://img.shields.io/badge/Anthropic-compatible-D97757?style=flat-square)](#anthropic)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-CLI%20ready-D97757?style=flat-square)](#claude-code-cli)
[![OpenCode](https://img.shields.io/badge/OpenCode-CLI%20ready-FF5C00?style=flat-square)](#opencode-cli)

**OpenAPIs** es un proxy unificado a **OpenAI** y **Anthropic**. Drop-in compatible con los SDKs oficiales — solo cambia el `base_url`, conserva tu código.

---

## 🎁 Beta abierta — gratis

> Actualmente en **beta abierta**. Acceso **totalmente gratis** durante la beta.
>
> 👉 Escríbenos para tu clave: **hola@openapis.dev**

---

## Por qué OpenAPIs

| | |
|---|---|
| 🔌 **Drop-in compatible** | Tu código existente con los SDKs oficiales sigue funcionando — cero refactor |
| ⚡ **Streaming nativo** | SSE end-to-end. Los tokens llegan al instante, sin buffering |
| 🔐 **Una sola clave** | Olvídate de gestionar múltiples cuentas, dashboards y facturas |
| 🌐 **Multi-proveedor** | OpenAI + Anthropic + Claude Code bajo la misma URL |
| 💸 **Único pago** | Sin suscripciones, sin renovaciones, sin sorpresas a fin de mes |

---

## Configura tus env vars (recomendado)

Los SDKs oficiales de OpenAI y Anthropic leen estas variables automáticamente, así no tienes que pasar `base_url` ni `api_key` en código.

```bash
# OpenAI
export OPENAI_API_KEY=admin
export OPENAI_BASE_URL=https://tapeless-recluse-disperser.ngrok-free.dev/openai

# Anthropic
export ANTHROPIC_API_KEY=admin
export ANTHROPIC_BASE_URL=https://tapeless-recluse-disperser.ngrok-free.dev/anthropic
```

```powershell
# Windows PowerShell
$env:OPENAI_API_KEY = "admin"
$env:OPENAI_BASE_URL = "https://tapeless-recluse-disperser.ngrok-free.dev/openai"
$env:ANTHROPIC_API_KEY = "admin"
$env:ANTHROPIC_BASE_URL = "https://tapeless-recluse-disperser.ngrok-free.dev/anthropic"
```

> 🚧 **Beta** — el endpoint actual es un túnel ngrok que puede rotar entre reinicios. Si tu request falla, vuelve aquí para la URL actualizada.

---

## Quickstart

### OpenAI

#### curl — sin streaming
```bash
curl https://tapeless-recluse-disperser.ngrok-free.dev/openai/v1/chat/completions \
  -H "Authorization: Bearer admin" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.5",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hola"}]
  }'
```

#### curl — con streaming
```bash
curl -N https://tapeless-recluse-disperser.ngrok-free.dev/openai/v1/chat/completions \
  -H "Authorization: Bearer admin" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.5",
    "max_tokens": 1024,
    "stream": true,
    "messages": [{"role": "user", "content": "Hola"}]
  }'
```

#### Python — SDK oficial
```python
from openai import OpenAI

client = OpenAI(
    api_key="admin",
    base_url="https://tapeless-recluse-disperser.ngrok-free.dev/openai/v1",
)

# Sin streaming
response = client.chat.completions.create(
    model="gpt-5.5",
    messages=[{"role": "user", "content": "Hola"}],
)
print(response.choices[0].message.content)

# Con streaming
with client.chat.completions.stream(
    model="gpt-5.5",
    messages=[{"role": "user", "content": "Hola"}],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

### Anthropic

#### curl — sin streaming
```bash
curl https://tapeless-recluse-disperser.ngrok-free.dev/anthropic/v1/messages \
  -H "x-api-key: admin" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-opus-4-7",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hola"}]
  }'
```

#### curl — con streaming
```bash
curl -N https://tapeless-recluse-disperser.ngrok-free.dev/anthropic/v1/messages \
  -H "x-api-key: admin" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-opus-4-7",
    "max_tokens": 1024,
    "stream": true,
    "messages": [{"role": "user", "content": "Hola"}]
  }'
```

#### Python — SDK oficial
```python
from anthropic import Anthropic

client = Anthropic(
    api_key="admin",
    base_url="https://tapeless-recluse-disperser.ngrok-free.dev/anthropic",
)

# Sin streaming
response = client.messages.create(
    model="claude-opus-4-7",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hola"}],
)
print(response.content[0].text)

# Con streaming
with client.messages.stream(
    model="claude-opus-4-7",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hola"}],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

### Claude Code (CLI)

```bash
# Linux / macOS / WSL
export ANTHROPIC_BASE_URL="https://tapeless-recluse-disperser.ngrok-free.dev/anthropic"
export ANTHROPIC_AUTH_TOKEN="admin"

claude
```

```powershell
# Windows PowerShell
$env:ANTHROPIC_BASE_URL = "https://tapeless-recluse-disperser.ngrok-free.dev/anthropic"
$env:ANTHROPIC_AUTH_TOKEN = "admin"

claude
```

### OpenCode (CLI)

```bash
# Linux / macOS / WSL
export ANTHROPIC_BASE_URL="https://tapeless-recluse-disperser.ngrok-free.dev/anthropic"
export ANTHROPIC_API_KEY="admin"
export OPENAI_BASE_URL="https://tapeless-recluse-disperser.ngrok-free.dev/openai"
export OPENAI_API_KEY="admin"

opencode
```

```powershell
# Windows PowerShell
$env:ANTHROPIC_BASE_URL = "https://tapeless-recluse-disperser.ngrok-free.dev/anthropic"
$env:ANTHROPIC_API_KEY = "admin"
$env:OPENAI_BASE_URL = "https://tapeless-recluse-disperser.ngrok-free.dev/openai"
$env:OPENAI_API_KEY = "admin"

opencode
```

---

## Modelos disponibles (100+)

### OpenAI — endpoint `/openai`
- `gpt-5.5` · `gpt-5.5-pro`
- `gpt-5.4-mini` · `gpt-5.4-nano` · `gpt-5.4-pro` · `gpt-5.4-thinking`
- `gpt-5.3-codex` · `gpt-5.3-instant`
- … toda la familia GPT-5 con sus snapshots

### Anthropic — endpoint `/anthropic`
- `claude-opus-4-7` · `claude-opus-4-6`
- `claude-sonnet-4-6` · `claude-sonnet-4-5`
- `claude-haiku-4-5` · `claude-haiku-4`
- … todo el catálogo Claude (3.x → 4.x)

---

## Stack compatible

Todo lo que use el formato OpenAI o Anthropic Messages API funciona out-of-the-box:

- **OpenAI SDK** (Python, Node, Go, Java, .NET)
- **Anthropic SDK** (Python, Node)
- **Claude Code** — CLI oficial de Anthropic
- **LangChain** / **LangGraph**
- **Vercel AI SDK**
- **LiteLLM**
- **OpenRouter-style routers**
- **Continue.dev**, **Cursor**, **Cline** y otros IDEs con base URL configurable

---

## Contacto

- 📧 **hola@openapis.dev** — para conseguir tu clave de la beta
- 🐙 GitHub Issues — bugs y feature requests

---

## Licencia

[MIT](LICENSE) — la landing y los ejemplos son open source. El servicio detrás del proxy es propietario.
