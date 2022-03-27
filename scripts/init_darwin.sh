#!/bin/bash

set -e -u

# Installing Homebrew
if ! command -v brew > /dev/null 2>&1; then
  echo "[localenv] Installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "[localenv] brew is already installed -> skipped"
fi

# Installing go-task
if ! brew list --formula go-task > /dev/null 2>&1; then
  echo "[localenv] Installing go-task"
  brew install go-task/tap/go-task
else
  echo "[localenv] go-task is already installed with brew -> skipped"
fi
