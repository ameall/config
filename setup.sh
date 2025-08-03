#!/bin/bash

# Exit if any command fails
set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/config-repo-root"
    exit 1
fi

CONFIG_DIR=$(realpath "$1")
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Error: '$CONFIG_DIR' is not a directory." >&2
    exit 1
fi

declare -A links=(
    ["tmux"]="$HOME/.config/tmux"
    ["nvim"]="$HOME/.config/nvim"
    ["foot"]="$HOME/.config/foot"
)

for src_rel in "${!links[@]}"; do
    src="$CONFIG_DIR/$src_rel"
    dest="${links[$src_rel]}"

    if [ ! -e "$src" ]; then
        echo "Warning: source does not exist, skipping: $src_rel" >&2
        continue
    fi

    if [ -L "$dest" ]; then
        current_target=$(readlink -- "$dest")

        # Symlink already exists
        if [ "$current_target" = "$src" ]; then
            echo "Symlink '$dest' already points to '$src'; skipping"
            continue
        else
            echo "Warning: A symlink already exists at $dest; skipping"
            continue
        fi
    elif [ -e "$dest" ]; then
        # Exists but is not a symlink
        echo "Warning: Path $dest already exists; skipping" >&2
        continue
    fi

    ln -s "$src" "$dest"
    echo "Created symlink from '$dest' to '$src'"
done
