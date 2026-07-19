---
name: memory-bank-branch-workflow
description: Per-machine branches (windows/mac) with Claude-run merge/commit/push; Mac one-time migration steps live here
metadata:
  type: project
---

Set up 2026-07-19 on the PC (Ian's design: per-machine branches so pushes
never collide and Claude sorts out merges itself). The PC checkout lives on
`windows` permanently. SessionStart hooks (`session-start-sync-windows.ps1`
/ `-mac.sh`) run doctor checks (memory symlink resolves into the repo,
correct branch, stale paths) then fetch and merge the other machine's branch
plus legacy `master` during the transition. Conflicts are Claude's to
resolve on the spot: keep both sides' facts, dedupe MEMORY.md. Claude has
full git autonomy in this repo only (merge, commit, push), scoped allows in
settings.json; full policy in `rules/git-github.md`. `master` is dormant,
never commit to it.

**One-time Mac migration, do this early in the next Mac session:**

1. Find the repo: `~/claude-memory-bank`, or `~/claude/claude-memory-bank`
   if Ian has mirrored the PC's `~/claude` layout by then (he intends to;
   creating `~/claude/session/{context,working,outputs}` goes with it, see
   the session-dirs rule).
2. `git fetch origin`, then `git switch -c mac origin/windows` (branch off
   the windows tip so the hooks/settings/rules changes come along).
3. `git push -u origin mac` (allowed here, scoped).
4. If the repo path moved, re-run `install/mac.sh` from whatever directory
   `claude` sessions launch from on the Mac (project-key gotcha, same one
   documented in [[pc-layout]]).
5. Sanity: `~/.claude/hooks/` shows the session-start-sync scripts, the
   memory symlink resolves, and the next session opens with `[memory-bank]`
   hook output.

The same Mac session should also handle the machine-sync Mac install and the
PC->Mac ssh bootstrap, see [[ssh-tooling-project]].
