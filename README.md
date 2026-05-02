<!--
  README TEMPLATE
  ───────────────
  To change the endpoint URL:
    1. Edit endpoint.txt (single line, base URL without path)
    2. Run:
         scripts/update-readme.ps1   (Windows PowerShell)
         scripts/update-readme.sh    (Linux/macOS/WSL/Git Bash)
    3. This regenerates README.md, replacing https://tapeless-recluse-disperser.ngrok-free.dev with the new URL
    4. git add README.md endpoint.txt && git commit && git push
  Do not edit README.md by hand — it gets overwritten.
-->
# Open**A**P**I**s

> One URL. One key. Unified access to the world's best AI models, via a proxy compatible with their official SDKs.

[![Open Beta — Free](https://img.shields.io/badge/✨_OPEN_BETA-FREE-22c55e?style=for-the-badge&labelColor=15803d)](#-open-beta--free)
[![License: MIT](https://img.shields.io/badge/LICENSE-MIT-6e56cf?style=for-the-badge&labelColor=4c3a9c)](LICENSE)
&nbsp;

[![OpenAI compatible](https://img.shields.io/badge/OpenAI-COMPATIBLE-412991?style=for-the-badge&logo=openai&logoColor=white&labelColor=000000)](#openai)
[![Anthropic compatible](https://img.shields.io/badge/Anthropic-COMPATIBLE-D97757?style=for-the-badge&logo=anthropic&logoColor=white&labelColor=8b3f25)](#anthropic)
[![Claude Code](https://img.shields.io/badge/Claude_Code-CLI_READY-D97757?style=for-the-badge&logo=anthropic&logoColor=white&labelColor=1a1a1a)](#claude-code-cli)
[![OpenCode](https://img.shields.io/badge/OpenCode-CLI_READY-FF5C00?style=for-the-badge&logo=gnubash&logoColor=white&labelColor=1a1a1a)](#opencode-cli)

**OpenAPIs** is a unified proxy to **OpenAI** and **Anthropic**. Drop-in compatible with their official SDKs — just swap the `base_url`, keep your code.

---

## 🎁 Open Beta — Free

> Currently in **open beta**. **Completely free** access while the beta lasts.

---

## Why OpenAPIs

| | |
|---|---|
| 🔌 **Drop-in compatible** | Your existing code with the official SDKs keeps working — zero refactor |
| ⚡ **Native streaming** | End-to-end SSE. Tokens arrive instantly, no buffering |
| 🔐 **Single key** | Forget juggling multiple accounts, dashboards, and bills |
| 🌐 **Multi-provider** | OpenAI + Anthropic + Claude Code under one URL |
| 💸 **One-time payment** | No subscriptions, no renewals, no end-of-month surprises |

---

## Set up your env vars (recommended)

The official OpenAI and Anthropic SDKs read these variables automatically, so you never have to pass `base_url` or `api_key` in code.

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

> 🚧 **Beta** — the current endpoint is an ngrok tunnel that may rotate on restart. If a request fails, come back here for the updated URL.

---

## Quickstart

### OpenAI

#### curl — without streaming
```bash
curl https://tapeless-recluse-disperser.ngrok-free.dev/openai/v1/chat/completions \
  -H "Authorization: Bearer admin" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.5",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

#### curl — with streaming
```bash
curl -N https://tapeless-recluse-disperser.ngrok-free.dev/openai/v1/chat/completions \
  -H "Authorization: Bearer admin" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.5",
    "max_tokens": 1024,
    "stream": true,
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

#### Python — official SDK
```python
from openai import OpenAI

client = OpenAI(
    api_key="admin",
    base_url="https://tapeless-recluse-disperser.ngrok-free.dev/openai/v1",
)

# Without streaming
response = client.chat.completions.create(
    model="gpt-5.5",
    messages=[{"role": "user", "content": "Hello"}],
)
print(response.choices[0].message.content)

# With streaming
with client.chat.completions.stream(
    model="gpt-5.5",
    messages=[{"role": "user", "content": "Hello"}],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

### Anthropic

#### curl — without streaming
```bash
curl https://tapeless-recluse-disperser.ngrok-free.dev/anthropic/v1/messages \
  -H "x-api-key: admin" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-opus-4-7",
    "max_tokens": 1024,
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

#### curl — with streaming
```bash
curl -N https://tapeless-recluse-disperser.ngrok-free.dev/anthropic/v1/messages \
  -H "x-api-key: admin" \
  -H "anthropic-version: 2023-06-01" \
  -H "content-type: application/json" \
  -d '{
    "model": "claude-opus-4-7",
    "max_tokens": 1024,
    "stream": true,
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

#### Python — official SDK
```python
from anthropic import Anthropic

client = Anthropic(
    api_key="admin",
    base_url="https://tapeless-recluse-disperser.ngrok-free.dev/anthropic",
)

# Without streaming
response = client.messages.create(
    model="claude-opus-4-7",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}],
)
print(response.content[0].text)

# With streaming
with client.messages.stream(
    model="claude-opus-4-7",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hello"}],
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

## Available models (100+)

### OpenAI — endpoint `/openai`
- `gpt-5.5` · `gpt-5.5-pro`
- `gpt-5.4-mini` · `gpt-5.4-nano` · `gpt-5.4-pro` · `gpt-5.4-thinking`
- `gpt-5.3-codex` · `gpt-5.3-instant`
- … the entire GPT-5 family with all snapshots

### Anthropic — endpoint `/anthropic`
- `claude-opus-4-7` · `claude-opus-4-6`
- `claude-sonnet-4-6` · `claude-sonnet-4-5`
- `claude-haiku-4-5` · `claude-haiku-4`
- … the full Claude catalog (3.x → 4.x)

---

## Compatible stack

Anything that speaks the OpenAI or Anthropic Messages API format works out of the box:

- **OpenAI SDK** (Python, Node, Go, Java, .NET)
- **Anthropic SDK** (Python, Node)
- **Claude Code** — Anthropic's official CLI
- **LangChain** / **LangGraph**
- **Vercel AI SDK**
- **LiteLLM**
- **OpenRouter-style routers**
- **Continue.dev**, **Cursor**, **Cline**, and any other IDE with a configurable base URL

---

## Contact

- 🐙 [GitHub Issues](https://github.com/IngARodriguez/openapis/issues) — bugs, feature requests, and beta access

---

## License

[MIT](LICENSE) — the landing page and examples are open source. The service behind the proxy is proprietary.
