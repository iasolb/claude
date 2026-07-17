#!/usr/bin/env bash
# Symlinks this repo's tracked config into ~/.claude.
# Run from anywhere; resolves paths relative to this script's location.
# Existing targets are backed up with a .bak suffix before being replaced,
# never silently overwritten.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(dirname "$script_dir")"
claude_dir="$HOME/.claude"

items=(CLAUDE.md settings.json commands agents rules hooks)

mkdir -p "$claude_dir"

for item in "${items[@]}"; do
    source="$repo_root/$item"
    target="$claude_dir/$item"

    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        mv "$target" "$target.bak"
        echo "Backed up existing $item to $item.bak"
    fi

    ln -s "$source" "$target"
    echo "Linked $item"
done
