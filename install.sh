#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

if ! command -v fzf; then
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
rsync -azv "$SCRIPT_DIR/.config" "$SCRIPT_DIR/.local" "$SCRIPT_DIR/.bashrc" \
    "$SCRIPT_DIR/.profile" "$SCRIPT_DIR/.inputrc" "$HOME"
