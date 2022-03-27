#!/bin/bash

BASE_DIR="$(pwd -P)"

OS="`uname`"
SETUP_SCRIPT_PATH="${BASE_DIR}/scripts/init_mac.sh"

if [[ "$OS" == "Linux" ]]; then
    OS='Linux'
    SETUP_SCRIPT_PATH="${BASE_DIR}/scripts/init_linux.sh"
fi

/bin/bash $SETUP_SCRIPT_PATH
