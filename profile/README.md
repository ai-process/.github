<a href="https://ai-process.dev"><img src="https://raw.githubusercontent.com/ai-process/.github/main/assets/banner.png" alt="ai-process: open-source infrastructure for production LLMs" width="100%"></a>

<p align="center">
  <a href="https://ai-process.dev"><b>Website</b></a> ·
  <a href="https://ai-process.dev/docs/"><b>Docs</b></a> ·
  <a href="https://blog.ai-process.dev"><b>Blog</b></a> ·
  <a href="https://hub.docker.com/u/coyl"><b>Docker Hub</b></a>
</p>

We build small, self-hosted services for teams that run LLMs in production: one gateway in front of every model, honest token accounting and a console to manage both. Everything is written in Go and released under Apache-2.0, with no enterprise edition.

## Projects

| | Project | What it does |
|---|---|---|
| 🔀 | **[Keystone. The Model Switchboard. (KTMS)](https://github.com/ai-process/ktms)** | LLM gateway: encrypted vendor keys, routing by effort with fallbacks, RPM and token budgets, batches, a local GPU node pool. gRPC and OpenAI-compatible HTTP. · [docs](https://ai-process.dev/docs/ktms/) |
| 📊 | **[light-tokenmeter](https://github.com/ai-process/light-tokenmeter)** | Usage meter: one event per model call, daily summaries by project, user, model or action, and who is greedy vs worthy. · [docs](https://ai-process.dev/docs/light-tokenmeter/) |
| 🖥️ | **[ktms-admin](https://github.com/ai-process/ktms-admin)** | Web console for both: models, rules, keys, a prompt playground and the spend dashboard. · [docs](https://ai-process.dev/docs/ktms-admin/) |

## Try Keystone in a minute

```bash
git clone https://github.com/ai-process/ktms.git && cd ktms
OPENAI_API_KEY=sk-... docker compose up -d --build

curl -s http://localhost:8080/v1/chat/completions \
  -H "Authorization: Bearer ktms_dev_default_key" \
  -H "Content-Type: application/json" \
  -d '{"model":"auto","messages":[{"role":"user","content":"Say hi"}]}'
```

Point any OpenAI SDK at `http://localhost:8080/v1` and KTMS picks the model, falls back when a vendor fails and enforces your limits. See the [architecture guide](https://ai-process.dev/docs/architecture/) to run the whole stack.
