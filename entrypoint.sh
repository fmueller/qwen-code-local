#!/bin/bash
set -e

CLONE_DEPTH=""
if [[ "$CLONE_SHALLOW" == "1" ]]; then
  CLONE_DEPTH="--depth 1"
fi

if [[ -n "$REPO_URL" ]]; then
  if [ ! -d "/home/qwen/repo" ]; then
    if [[ -n "$GITHUB_PAT" ]]; then
      git clone $CLONE_DEPTH https://${GITHUB_PAT}@${REPO_URL} /home/qwen/repo
    else
      git clone $CLONE_DEPTH https://${REPO_URL} /home/qwen/repo
    fi
    cd /home/qwen/repo
  fi
fi

exec "$@"
