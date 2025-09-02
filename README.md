# Qwen Code Local

[![Qwen Code Local](https://github.com/fmueller/qwen-code-local/actions/workflows/qwen-code-local.yaml/badge.svg)](https://github.com/fmueller/qwen-code-local/actions/workflows/qwen-code-local.yaml)

A local-first version of Qwen Code

This repository contains configurations and scripts for running Qwen Code locally in a Docker container. It uses
a local-compatible OpenAI API (Ollama). Also, tracking is disabled.

The goal is to provide a local-first, asynchronous version of Qwen Code that creates branches and PRs on GitHub for you.

## Features

- Local-only
- Ollama API
- Tracking disabled
- Optionally clones a provided repository

## Next steps

- Add support for local OpenTelemetry tracking
- Add support for MCPs
- Add support for creating PRs after a successful run

## How to use

### Basic usage

```bash
docker build -t qwen-code-local .
docker run -it --rm \
  -e OPENAI_BASE_URL=http://localhost:11434/v1 \
  -e OPENAI_API_KEY=no-key \
  -e OPENAI_MODEL=qwen3:1.7b \
  qwen-code-local
```

Note: On macOS, `localhost` is not accessible, use `host.docker.internal` instead.

### Cloning a repository into the container

```bash
docker build -t qwen-code-local .
docker run -it --rm \
  -e OPENAI_BASE_URL=http://localhost:11434/v1 \
  -e OPENAI_API_KEY=no-key \
  -e OPENAI_MODEL=qwen3:1.7b \
  -e REPO_URL=github.com/username/repository.git \
  qwen-code-local
```

The repository will be cloned to `/home/qwen/repo` inside the container.

For private repositories, include your GitHub Personal Access Token:

```bash
docker build -t qwen-code-local .
docker run -it --rm \
  -e OPENAI_BASE_URL=http://localhost:11434/v1 \
  -e OPENAI_API_KEY=no-key \
  -e OPENAI_MODEL=qwen3:1.7b \
  -e REPO_URL=github.com/username/private-repo.git \
  -e GITHUB_PAT=your_github_token \
  qwen-code-local
```

### Cloning big repositories with shallow clones

For faster cloning of large repositories, use shallow clone:

```bash
docker build -t qwen-code-local .
docker run -it --rm \
  -e OPENAI_BASE_URL=http://localhost:11434/v1 \
  -e OPENAI_API_KEY=no-key \
  -e OPENAI_MODEL=qwen3:1.7b \
  -e REPO_URL=github.com/username/repository.git \
  -e CLONE_SHALLOW=1 \
  qwen-code-local
```

## License

[MIT License](LICENSE)

## Contribute

Feel free to open issues or PRs.
