# Open**A**P**I**s

> Una sola URL. Una sola clave. Acceso unificado a las mejores IAs del mundo, vía proxy compatible con sus SDKs oficiales.

[![Beta abierta](https://img.shields.io/badge/beta-abierta-22c55e?style=flat-square)](#-beta-abierta--gratis)
[![License: MIT](https://img.shields.io/badge/License-MIT-6e56cf?style=flat-square)](LICENSE)
[![OpenAI compatible](https://img.shields.io/badge/OpenAI-compatible-000?style=flat-square&logo=openai&logoColor=white)](#openai)
[![Anthropic compatible](https://img.shields.io/badge/Anthropic-compatible-D97757?style=flat-square)](#anthropic)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-CLI%20ready-D97757?style=flat-square)](#claude-code-cli)

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

## Quickstart

### OpenAI

#### curl — sin streaming
```bash
curl https://api.openapis.dev/openai/v1/chat/completions \
  -H "Authorization: Bearer tu_clave_secreta" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.5",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hola"}]
  }'
```

#### curl — con streaming
```bash
curl -N https://api.openapis.dev/openai/v1/chat/completions \
  -H "Authorization: Bearer tu_clave_secreta" \
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
    api_key="tu_clave_secreta",
    base_url="https://api.openapis.dev/openai/v1",
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
curl https://api.openapis.dev/anthropic/v1/messages \
  -H "x-api-key: tu_clave_secreta" \
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
curl -N https://api.openapis.dev/anthropic/v1/messages \
  -H "x-api-key: tu_clave_secreta" \
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
    api_key="tu_clave_secreta",
    base_url="https://api.openapis.dev/anthropic",
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
export ANTHROPIC_BASE_URL="https://api.openapis.dev/anthropic"
export ANTHROPIC_AUTH_TOKEN="tu_clave_secreta"

claude
```

```powershell
# Windows PowerShell
$env:ANTHROPIC_BASE_URL = "https://api.openapis.dev/anthropic"
$env:ANTHROPIC_AUTH_TOKEN = "tu_clave_secreta"

claude
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

## Demo / Landing

🌐 Landing oficial: **https://openapis.dev** *(próximamente)*

Para correrla localmente:

```bash
git clone https://github.com/USER/openapis.git
cd openapis
python -m http.server 8765
# Abre http://localhost:8765
```

---

## Roadmap

- [x] OpenAI compatible (`/openai/v1`)
- [x] Anthropic compatible (`/anthropic/v1`)
- [x] Streaming SSE
- [x] Compatibilidad Claude Code
- [ ] Logs y métricas por petición
- [ ] Rate limiting per-key
- [ ] Más proveedores (Google, Mistral, OpenRouter passthrough)

---

## Contacto

- 📧 **hola@openapis.dev** — para conseguir tu clave de la beta
- 🐙 GitHub Issues — bugs y feature requests

---

## Licencia

[MIT](LICENSE) — la landing y los ejemplos son open source. El servicio detrás del proxy es propietario.
