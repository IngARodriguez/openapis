<!--
  README TEMPLATE
  ───────────────
  To change the endpoint URL:
    1. Edit endpoint.txt (single line, base URL without path)
    2. Run:
         scripts/update-readme.ps1   (Windows PowerShell)
         scripts/update-readme.sh    (Linux/macOS/WSL/Git Bash)
    3. This regenerates README.md, replacing https://api.openapis.online with the new URL
    4. git add README.md endpoint.txt && git commit && git push
  Do not edit README.md by hand — it gets overwritten.
-->

[![API — ONLINE ](https://img.shields.io/badge/✨_API_ONLINE-22c55e?style=for-the-badge&labelColor=22c55e)](#-open-beta--free)
# Open**A**P**I**s

> **Free Claude API + free OpenAI API** in one unified proxy. Drop-in compatible with the official **Anthropic SDK**, **OpenAI SDK**, **Claude Code CLI**, **OpenCode**, and any **OpenAI-compatible** client. 100+ models — Claude Opus 4.7, Sonnet 4.6, Haiku 4.5, GPT-5.5, GPT-5.4-mini, GPT-5.3-codex — totally free during the open beta.

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
|:--|:--|
| ![Drop-in compatible](https://img.shields.io/badge/DROP--IN_COMPATIBLE-6e56cf?style=for-the-badge&labelColor=4c3a9c) | Your existing code with the official SDKs keeps working — zero refactor |
| ![Native streaming](https://img.shields.io/badge/NATIVE_STREAMING-3b82f6?style=for-the-badge&labelColor=1e40af) | End-to-end SSE. Tokens arrive instantly, no buffering |
| ![Single key](https://img.shields.io/badge/SINGLE_KEY-22c55e?style=for-the-badge&labelColor=15803d) | Forget juggling multiple accounts, dashboards, and bills |
| ![Multi-provider](https://img.shields.io/badge/MULTI--PROVIDER-eab308?style=for-the-badge&labelColor=a16207) | OpenAI + Anthropic + Claude Code under one URL |

---

## Set up your env vars (recommended)

The official OpenAI and Anthropic SDKs read these variables automatically, so you never have to pass `base_url` or `api_key` in code.

```bash
# OpenAI
export OPENAI_API_KEY=admin
export OPENAI_BASE_URL=https://api.openapis.online/openai

# Anthropic
export ANTHROPIC_API_KEY=admin
export ANTHROPIC_BASE_URL=https://api.openapis.online/anthropic
```

```powershell
# Windows PowerShell
$env:OPENAI_API_KEY = "admin"
$env:OPENAI_BASE_URL = "https://api.openapis.online/openai"
$env:ANTHROPIC_API_KEY = "admin"
$env:ANTHROPIC_BASE_URL = "https://api.openapis.online/anthropic"
```

---

## Quickstart

### OpenAI

#### curl — with streaming
```bash
curl https://api.openapis.online/openai/v1/chat/completions \
  -H "Authorization: Bearer admin" \
  -H "content-type: application/json" \
  -d '{
    "model": "gpt-5.4",
    "max_completion_tokens": 1024,
    "stream": true,
    "messages": [{"role": "user", "content": "Hello"}]
  }'
```

#### Python — official SDK
```python
from openai import OpenAI

client = OpenAI(
    api_key="admin",
    base_url="https://api.openapis.online/openai/v1",
)

# Without streaming
response = client.chat.completions.create(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": "Hello"}],
)
print(response.choices[0].message.content)

# With streaming
with client.chat.completions.stream(
    model="gpt-4o-mini",
    messages=[{"role": "user", "content": "Hello"}],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
```

### Anthropic

#### curl — with streaming
```bash
curl -N https://api.openapis.online/anthropic/v1/messages \
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
    base_url="https://api.openapis.online/anthropic",
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
export ANTHROPIC_BASE_URL="https://api.openapis.online/anthropic"
export ANTHROPIC_API_KEY="admin"

claude
```

```powershell
# Windows PowerShell
$env:ANTHROPIC_BASE_URL = "https://api.openapis.online/anthropic"
$env:ANTHROPIC_API_KEY = "admin"

claude
```

### OpenCode (CLI)

```bash
# Linux / macOS / WSL
export ANTHROPIC_BASE_URL="https://api.openapis.online/anthropic"
export ANTHROPIC_API_KEY="admin"
export OPENAI_BASE_URL="https://api.openapis.online/openai"
export OPENAI_API_KEY="admin"

opencode
```

```powershell
# Windows PowerShell
$env:ANTHROPIC_BASE_URL = "https://api.openapis.online/anthropic"
$env:ANTHROPIC_API_KEY = "admin"
$env:OPENAI_BASE_URL = "https://api.openapis.online/openai"
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

## FAQ

### How do I use Claude Code for free?
Set `ANTHROPIC_BASE_URL` and `ANTHROPIC_API_KEY` to point at OpenAPIs (see [Claude Code (CLI)](#claude-code-cli)). While the open beta lasts, every Claude Code request goes through the proxy at no cost — no Anthropic billing key needed on your side.

### Is the Anthropic API really free here?
Yes. During the open beta, the proxy gives you **free Anthropic API access** to the entire Claude catalog: `claude-opus-4-7`, `claude-sonnet-4-6`, `claude-haiku-4-5`, plus the rest of 3.x → 4.x. You never pass an Anthropic key — only the beta key.

### Can I use this as a free OpenAI API?
Yes. The same proxy serves OpenAI-compatible chat completions for the full GPT-5 family. Point your OpenAI SDK at `/openai/v1` and it behaves identically to the official endpoint — `client.chat.completions.create(...)` works unchanged.

### Does Claude Code work without an Anthropic API key?
Through OpenAPIs, yes. Claude Code accepts any Anthropic-compatible endpoint, so by setting `ANTHROPIC_BASE_URL` to OpenAPIs you skip the official key entirely. This is the same trick proxies like `claude-code-proxy`, `anthropic-proxy`, and `claude-code-router` use, but hosted for you.

### Is OpenCode supported?
Yes. OpenCode reads the standard `OPENAI_API_KEY`, `OPENAI_BASE_URL`, `ANTHROPIC_API_KEY`, and `ANTHROPIC_BASE_URL` env vars — set all four and run `opencode`. Full setup in [OpenCode (CLI)](#opencode-cli).

### Which models can I call?
Over **100**, covering OpenAI text/reasoning models (GPT-5.5, GPT-5.5-pro, GPT-5.4-mini, GPT-5.4-nano, GPT-5.4-thinking, GPT-5.3-codex, plus dated snapshots) and the full Claude 3.x → 4.x catalog. Image, video, and audio models are intentionally excluded. See [Available models](#available-models-100).

### How is this different from OpenRouter, LiteLLM, or claude-code-proxy?
OpenRouter aggregates many providers behind a unified billing page; LiteLLM is a Python library you self-host; `claude-code-proxy` is a translation layer you run locally. **OpenAPIs is a hosted proxy** that keeps the official OpenAI and Anthropic API shapes intact, so any client built for those APIs (including Claude Code, which is strict about the Anthropic format) works without translation layers or local processes.

### What about rate limits?
None during the open beta. Be considerate — the beta key is shared.

### Does it support streaming?
Yes, native SSE end-to-end on both `/openai` and `/anthropic` endpoints. See the curl `-N` and Python `client.*.stream()` examples above.

---

## Contact

- 🐙 [GitHub Issues](https://github.com/IngARodriguez/openapis/issues) — bugs, feature requests, and beta access

---

## Keywords

Free Claude API · Free Anthropic API · Free OpenAI API · Free Claude Code · Claude Code free · Claude Code without API key · Claude Code proxy · Anthropic proxy · Anthropic to OpenAI · OpenAI compatible proxy · OpenAI reverse proxy · OpenCode proxy · OpenCode free · GPT-5 free · GPT-5.5 free · Claude Opus free · Claude Sonnet free · Claude Haiku free · LLM proxy · AI gateway · LiteLLM alternative · OpenRouter alternative · Free LLM API · Unified AI API · OpenAI Anthropic gateway

---

## License

[MIT](LICENSE) — the landing page and examples are open source. The service behind the proxy is proprietary.
