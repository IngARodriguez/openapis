"""
OpenAI compatible — OpenAPIs proxy.

Requiere: pip install openai
Configura: export OPENAPIS_KEY="tu_clave_secreta"
"""
import os
from openai import OpenAI

client = OpenAI(
    api_key=os.getenv("OPENAPIS_KEY", "tu_clave_secreta"),
    base_url="https://api.openapis.dev/openai/v1",
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
