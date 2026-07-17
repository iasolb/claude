# Personal Claude Code config

Versioned subset of `~/.claude`: global instructions, settings, rules, custom
commands, agents, and hooks. Everything here is meant to be portable across
machines.

**Not stored here** (stays local/machine-specific, lives only in `~/.claude`):
`.credentials.json`, `sessions/`, `session-env/`, `shell-snapshots/`, `cache/`,
`downloads/`, `backups/`, `policy-limits.json`, `remote-settings.json`.

## Layout
- `CLAUDE.md` — global instructions, loaded in every session
- `settings.json` — permissions, hooks, env vars
- `rules/` — standing rules, one file per topic, imported by `CLAUDE.md`
- `commands/` — custom slash commands
- `agents/` — custom subagents
- `hooks/` — scripts for global hooks wired up in `settings.json` (deterministic
  automation, not something Claude decides to do, runs on every matching
  trigger). Project-specific hooks (e.g. a formatter that only applies to one
  repo) live in that repo's own `.claude/`, not here.

## Install
Run the installer for your machine from `install/`:
- macOS/Linux: `install/mac.sh`
- Windows: `install/windows.ps1`

Either symlinks each tracked file/folder into `~/.claude`, so edits here take
effect immediately and `git status` in `~/.claude` never risks staging
credentials or session state. Existing non-symlink targets are backed up with
a `.bak` suffix, never silently overwritten.
