#!/bin/bash

# Exit if any command fails
set -euo pipefail

# Get the absolute path of the current directory
CONFIG_DIR=$(dirname "$(realpath "$0")")
# CONFIG_DIR=$(realpath "$PWD")
if [ -d "$CONFIG_DIR" ]; then
    cd $CONFIG_DIR
    echo "Running setup.sh script from '$CONFIG_DIR'"
else
    echo "Error: '$CONFIG_DIR' is not a directory."
    exit 1
fi

# Update and initialize all submodules
echo "Initializing git submodules..."
git submodule update --init --recursive
echo "Git submodules initialized."

# These are the directories that need to be symlinked
declare -A links=(
    ["foot"]="$HOME/.config/foot"
    ["nvim"]="$HOME/.config/nvim"
    ["tmux/.tmux.conf"]="$HOME/.tmux.conf"
    ["tmux"]="$HOME/.tmux"
    ["zsh/.zshrc"]="$HOME/.zshrc"
)

# Attempt to symlink the directories
for src_rel in "${!links[@]}"; do
    src="$CONFIG_DIR/$src_rel"
    dest="${links[$src_rel]}"

    # Check that the source directory exists
    if [ ! -e "$src" ]; then
        echo "Warning: source does not exist, skipping: $src_rel"
        continue
    fi

    # Ensure parent directories for destination exist
    dest_parent=$(dirname "$dest")
    if [ ! -d "$dest_parent" ]; then
        mkdir -p "$dest_parent"
        echo "Created parent directories for '$dest'"
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
        echo "Warning: Path $dest already exists; skipping"
        continue
    fi

    ln -s "$src" "$dest"
    echo "Created symlink from '$dest' to '$src'"
done
