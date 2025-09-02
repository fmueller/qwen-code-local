# qwen-code-local

[![Qwen Code Local](https://github.com/fmueller/qwen-code-local/actions/workflows/qwen-code-local.yaml/badge.svg)](https://github.com/fmueller/qwen-code-local/actions/workflows/qwen-code-local.yaml)

A local-only version of Qwen Code

This repository contains configurations and scripts for running Qwen Code locally in a Docker container. It uses
a local-compatible OpenAI API (Ollama). Also, tracking is disabled.

The goal is to provide a local-first, asynchronous version of Qwen Code that creates branches and PRs on GitHub for you.

## Features

- Local-only
- Ollama API
- Tracking disabled
- Optionally clones a provided repository

## How to use

```bash
docker build -t qwen-code-local .
docker run -it --rm \
  -e OPENAI_BASE_URL=http://localhost:11434/v1 \
  -e OPENAI_API_KEY=no-key \
  -e OPENAI_MODEL=qwen3:1.7b \
  qwen-code-local
```

Note: On macOS, `localhost` is not accessible, use `host.docker.internal` instead.

## Next steps

- Add support for local OpenTelemetry tracking
- Add support for MCPs
- Add support for creating PRs after a successful run

## License

[MIT License](LICENSE)

## Contribute

Feel free to open issues or PRs.
