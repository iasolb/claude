#!/bin/bash
# SessionStart hook: memory-bank doctor + cross-machine branch sync.
# macOS only, self-guards and no-ops everywhere else, mirrors
# session-start-sync-windows.ps1. Prints [memory-bank] lines into session
# context and always exits 0: a broken check must never block a session.

if [[ "$(uname)" != "Darwin" ]]; then
    exit 0
fi

REPO=""
for c in "$HOME/claude/claude-memory-bank" "$HOME/claude-memory-bank"; do
    if [[ -d "$c/.git" ]]; then
        REPO="$c"
        break
    fi
done
if [[ -z "$REPO" ]]; then
    echo "[memory-bank] DOCTOR: repo not found at ~/claude/claude-memory-bank or ~/claude-memory-bank. It moved again: update hooks/session-start-sync-*.* and re-run install/mac.sh."
    exit 0
fi

# 1. The project-key memory symlink must resolve into this repo.
PROJECT_KEY="$(pwd | sed 's|[:/]|-|g')"
MEMORY_LINK="$HOME/.claude/projects/$PROJECT_KEY/memory"
EXPECTED="$REPO/memory"
if [[ ! -e "$MEMORY_LINK" ]]; then
    echo "[memory-bank] DOCTOR: no memory link at $MEMORY_LINK, memory writes are landing nowhere. Recreate it: ln -s \"$EXPECTED\" \"$MEMORY_LINK\""
elif [[ ! -L "$MEMORY_LINK" ]]; then
    echo "[memory-bank] DOCTOR: $MEMORY_LINK is a real directory, not a symlink into the repo, so memories are not syncing. Merge its contents into $EXPECTED and replace it with a symlink."
else
    TARGET="$(readlink "$MEMORY_LINK")"
    if [[ "$TARGET" != "$EXPECTED" ]]; then
        echo "[memory-bank] DOCTOR: memory link points at $TARGET, expected $EXPECTED. Re-point it."
    fi
fi

# 2. This machine lives on the mac branch, permanently (one-time migration:
# git switch -c mac origin/windows, see memory/memory-bank-branch-workflow.md).
BRANCH="$(git -C "$REPO" rev-parse --abbrev-ref HEAD)"
if [[ "$BRANCH" != "mac" ]]; then
    echo "[memory-bank] DOCTOR: checkout is on '$BRANCH', expected 'mac'. If the mac branch does not exist yet, run the one-time migration in memory/memory-bank-branch-workflow.md. Otherwise: git -C \"$REPO\" switch mac"
    exit 0
fi

if ! git -C "$REPO" fetch origin --quiet 2>/dev/null; then
    echo '[memory-bank] fetch failed (offline?), working from local state, possibly stale.'
    exit 0
fi

# 3. Leftovers from a previous session (SessionEnd stages, never commits).
DIRTY="$(git -C "$REPO" status --porcelain)"
if [[ -n "$DIRTY" ]]; then
    echo '[memory-bank] Uncommitted changes left from a previous session. Commit them now (draft the message from the diff), then push.'
fi

# 4. Converge: merge the other machine's branch (and legacy master while the
# transition lasts). Conflicts are deliberately left for Claude to resolve.
for OTHER in origin/windows origin/master; do
    git -C "$REPO" rev-parse --verify --quiet "$OTHER" >/dev/null 2>&1 || continue
    BEHIND="$(git -C "$REPO" rev-list --count "HEAD..$OTHER")"
    [[ "$BEHIND" -gt 0 ]] || continue
    if [[ -n "$DIRTY" ]]; then
        echo "[memory-bank] $OTHER has $BEHIND commit(s) not merged here. After committing the local changes above, run: git -C \"$REPO\" merge --no-edit $OTHER"
        continue
    fi
    if git -C "$REPO" merge --no-edit "$OTHER" >/dev/null 2>&1; then
        echo "[memory-bank] merged $BEHIND commit(s) from $OTHER."
    else
        echo "[memory-bank] MERGE CONFLICT with $OTHER. Resolve it in $REPO before any other work: keep both sides' facts, dedupe MEMORY.md, commit, push."
    fi
done

# 5. Anything unpushed, including merges just made.
if git -C "$REPO" rev-parse --verify --quiet origin/mac >/dev/null 2>&1; then
    AHEAD="$(git -C "$REPO" rev-list --count 'origin/mac..HEAD')"
    if [[ "$AHEAD" -gt 0 ]]; then
        echo "[memory-bank] $AHEAD unpushed commit(s) on mac. Push: git -C \"$REPO\" push"
    fi
else
    echo "[memory-bank] branch mac has no upstream yet. Push: git -C \"$REPO\" push -u origin mac"
fi

exit 0
