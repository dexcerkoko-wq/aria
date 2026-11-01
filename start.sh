#!/bin/sh
set -eu
mkdir -p "$(dirname "$MODEL_PATH")"
if [ ! -s "$MODEL_PATH" ]; then
  echo "ARIA: baixando modelo GGUF..."
  curl -fL --retry 3 "$MODEL_URL" -o "$MODEL_PATH"
fi
exec /app/llama-server \
  --model "$MODEL_PATH" \
  --host 0.0.0.0 \
  --port "${PORT:-10000}" \
  --ctx-size "${CTX_SIZE:-1024}" \
  --threads 2 \
  --n-gpu-layers 0
