# ARIA — assistente local experimental

ARIA é um protótipo de chat que tenta executar um LLM pequeno no próprio serviço Docker do Render usando `llama.cpp` e um GGUF quantizado.

## Modelo padrão
`HuggingFaceTB/SmolLM2-135M-Instruct-GGUF` (arquivo Q4_K_M). É minúsculo e pode responder de forma limitada; não espere desempenho comparável a modelos grandes. O serviço gratuito do Render pode não ter memória suficiente ou pode reiniciar/suspender.

## Publicar
1. Crie um repositório **público ou privado** chamado `aria` no GitHub.
2. Envie estes arquivos para a raiz do repositório.
3. No Render, crie um **Web Service** conectado ao repositório, selecione runtime **Docker**, região `Frankfurt` (mais próxima do Brasil entre as opções disponíveis pode variar; escolha a mais próxima oferecida), plano Free para teste.
4. Configure `MODEL_URL` se quiser usar outro GGUF compatível. Não são necessárias chaves de API.
5. O serviço pode levar alguns minutos no primeiro boot para baixar o modelo.

## Limitações importantes
- Render Free tem memória e armazenamento limitados, suspende serviços inativos e o disco é efêmero. Um modelo local pode falhar, demorar para iniciar ou ser baixado novamente após reinícios.
- Para confiabilidade, use um plano com mais RAM e disco persistente, ou rode o modelo no seu próprio computador.
- Não envie segredos para o GitHub. O protótipo não oferece autenticação; não compartilhe o URL público se for usar com dados privados.

## Testar
Depois do deploy, o endpoint OpenAI-compatible do `llama.cpp` é:
- `GET /health`
- `POST /v1/chat/completions`

Exemplo de corpo para `POST /v1/chat/completions`:
```json
{
  "messages": [
    {"role": "system", "content": "Você é ARIA, uma assistente útil. Responda em português."},
    {"role": "user", "content": "Olá, quem é você?"}
  ],
  "temperature": 0.7,
  "max_tokens": 180
}
```
