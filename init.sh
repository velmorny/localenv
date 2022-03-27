#!/bin/bash

BASE_DIR="$(pwd -P)"

OS="`uname`"
SETUP_SCRIPT_PATH="${BASE_DIR}/scripts/init_darwin.sh"

if [[ "$OS" == "Linux" ]]; then
    OS='Linux'
    SETUP_SCRIPT_PATH="${BASE_DIR}/scripts/init_linux.sh"
fi

echo "[localenv] setting up with init script"
/bin/bash $SETUP_SCRIPT_PATH

echo "[localenv] setting up with go-task"
task apply
