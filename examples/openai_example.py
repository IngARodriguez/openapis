"""
OpenAI compatible — OpenAPIs proxy.

Requiere: pip install openai

El SDK lee OPENAI_API_KEY y OPENAI_BASE_URL automáticamente:
  export OPENAI_API_KEY=admin
  export OPENAI_BASE_URL=https://tapeless-recluse-disperser.ngrok-free.dev/openai
"""
import os
from openai import OpenAI

# Si las env vars están definidas, OpenAI() las lee solas.
# Aquí las pasamos explícitas como fallback de demo.
client = OpenAI(
    api_key=os.getenv("OPENAI_API_KEY", "admin"),
    base_url=os.getenv(
        "OPENAI_BASE_URL",
        "https://tapeless-recluse-disperser.ngrok-free.dev/openai",
    ) + "/v1",
)

# Sin streaming
response = client.chat.completions.create(
    model="gpt-5.5",
    messages=[{"role": "user", "content": "Hola"}],
)
print(response.choices[0].message.content)

print("\n--- streaming ---\n")

# Con streaming
with client.chat.completions.stream(
    model="gpt-5.5",
    messages=[{"role": "user", "content": "Hola"}],
) as stream:
    for text in stream.text_stream:
        print(text, end="", flush=True)
print()
