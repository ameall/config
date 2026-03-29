#!/bin/bash

# Exit if any command fails
set -euo pipefail

DRY_RUN=${DRY_RUN:-false}

# Get the absolute path of the current directory
CONFIG_DIR=$(dirname "$(realpath "$0")")
# CONFIG_DIR=$(realpath "$PWD")
if [ -d "$CONFIG_DIR" ]; then
    cd "$CONFIG_DIR"
    echo "Running setup.sh script from '$CONFIG_DIR'"
else
    echo "Error: '$CONFIG_DIR' is not a directory."
    exit 1
fi

if ! command -v git >/dev/null 2>&1; then
    echo "Error: git is not installed. Please install git before running this script."
    exit 1
fi

# Define the git submodule command
GIT_SUBMODULE_CMD="git submodule update --init --recursive"

if [ "$DRY_RUN" = true ]; then
    echo "[DRY-RUN] Would run: $GIT_SUBMODULE_CMD"
else
    # Update and initialize all submodules
    echo "Initializing git submodules..."
    if $GIT_SUBMODULE_CMD; then
        echo "Git submodules initialized."
    else
        echo "Warning: git submodule update failed, continuing..."
    fi
fi

# These are the directories that need to be symlinked
declare -A links=(
    ["foot"]="$HOME/.config/foot"
    ["gitui"]="$HOME/.config/gitui"
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
        if [ "$DRY_RUN" = true ]; then
            echo "[DRY-RUN] Would create parent directories: '$dest_parent'"
        else
            mkdir -p "$dest_parent"
            echo "Created parent directories for '$dest'"
        fi
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

    if [ "$DRY_RUN" = true ]; then
        echo "[DRY-RUN] Would create symlink: '$dest' -> '$src'"
    else
        ln -s "$src" "$dest" || echo "Failed to create symlink: $dest"
        echo "Created symlink from '$dest' to '$src'"
    fi
done
