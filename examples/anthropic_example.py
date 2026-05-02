"""
Anthropic compatible — OpenAPIs proxy.

Requiere: pip install anthropic
Configura: export OPENAPIS_KEY="tu_clave_secreta"
"""
import os
from anthropic import Anthropic

client = Anthropic(
    api_key=os.getenv("OPENAPIS_KEY", "tu_clave_secreta"),
    base_url="https://api.openapis.dev/anthropic",
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
