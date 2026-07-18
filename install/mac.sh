#!/usr/bin/env bash
# Symlinks this repo's tracked config into ~/.claude.
# Run from anywhere; resolves paths relative to this script's location.
# Existing targets are backed up with a .bak suffix before being replaced,
# never silently overwritten.
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(dirname "$script_dir")"
claude_dir="$HOME/.claude"

# Preflight: confirm we can actually create a symlink at the target location
# before touching any real config. macOS doesn't need elevation for this the
# way Windows does, but a read-only home dir or odd permission setup should
# still fail loudly up front instead of mid-removal.
mkdir -p "$claude_dir"
preflight_target="$claude_dir/.symlink-test-$$"
if ! ln -s "$repo_root" "$preflight_target" 2>/dev/null; then
    echo "Cannot create symlinks in $claude_dir. Nothing has been touched." >&2
    echo "Check permissions on $claude_dir and re-run." >&2
    exit 1
fi
rm -f "$preflight_target"

items=(CLAUDE.md settings.json commands agents rules hooks)

replace_with_symlink() {
    local target="$1" source="$2" label="$3"

    if [ -L "$target" ]; then
        rm "$target"
    elif [ -e "$target" ]; then
        mv "$target" "$target.bak"
        echo "Backed up existing $label to $label.bak"
    fi

    ln -s "$source" "$target"
    echo "Linked $label"
}

for item in "${items[@]}"; do
    replace_with_symlink "$claude_dir/$item" "$repo_root/$item" "$item"
done

# Cross-machine session memory: link the home-dir project's memory dir to the
# repo's memory/ so memories written on either machine sync through git.
# Claude Code derives the project key from $HOME by swapping path separators
# for dashes (/Users/ian -> -Users-ian).
memory_source="$repo_root/memory"
project_key="$(echo "$HOME" | tr '/' '-')"
memory_target="$claude_dir/projects/$project_key/memory"

mkdir -p "$(dirname "$memory_target")"
replace_with_symlink "$memory_target" "$memory_source" "memory"
