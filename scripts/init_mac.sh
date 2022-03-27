#!/bin/bash

set -e -u

echo "[Mac Setup] Start Mac setup scripts"

# Installing Homebrew
if ! command -v brew > /dev/null 2>&1; then
  echo "[Mac Setup] Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "[Mac Setup] brew is already installed -> skipped"
fi

# Installing go-task
if ! brew list --formula go-task > /dev/null 2>&1; then
  echo "[Mac Setup] Installing go-task"
  brew install go-task/tap/go-task
else
  echo "[Mac Setup] go-task is already installed with brew -> skipped"
fi
