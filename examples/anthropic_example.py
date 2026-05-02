"""
Anthropic compatible — OpenAPIs proxy.

Requiere: pip install anthropic

El SDK lee ANTHROPIC_API_KEY y ANTHROPIC_BASE_URL automáticamente:
  export ANTHROPIC_API_KEY=admin
  export ANTHROPIC_BASE_URL=https://tapeless-recluse-disperser.ngrok-free.dev/anthropic
"""
import os
from anthropic import Anthropic

# Si las env vars están definidas, Anthropic() las lee solas.
client = Anthropic(
    api_key=os.getenv("ANTHROPIC_API_KEY", "admin"),
    base_url=os.getenv(
        "ANTHROPIC_BASE_URL",
        "https://tapeless-recluse-disperser.ngrok-free.dev/anthropic",
    ),
)

# Sin streaming
response = client.messages.create(
    model="claude-opus-4-7",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hola"}],
)
print(response.content[0].text)

print("\n--- streaming ---\n")

# Con streaming
with client.messages.stream(
    model="claude-opus-4-7",
    max_tokens=1024,
    messages=[{"role": "user", "content": "Hola"}],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
print()
