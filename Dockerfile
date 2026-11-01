FROM ghcr.io/ggml-org/llama.cpp:server

ENV MODEL_URL=https://huggingface.co/bartowski/SmolLM2-135M-Instruct-GGUF/resolve/main/SmolLM2-135M-Instruct-Q4_K_M.gguf
ENV MODEL_PATH=/tmp/aria-model.gguf
ENV PORT=10000
ENV CTX_SIZE=1024
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 10000
ENTRYPOINT ["/start.sh"]
