---
name: pc-layout
description: Layout of Ian's Windows PC, profiled 2026-07-18; also documents a project-key gotcha specific to this machine
metadata:
  type: project
---

Profiled 2026-07-18 (first real session on this machine). Home dir is
`C:\Users\ians0`. Project layout lives under `Documents/mf/`:

- `mf/work/tallpoppies/FinancialEdgeConnector` — live repo (`.git`, `.venv`,
  `.env` all present). See [[financialedge-brain-state]].
- `mf/work/edgewater/EdgewaterDB` — synced from the Mac later this same
  session (`git log` shows a "sync to other machine." commit on top of
  "frontend final pass"), on `main`, working tree clean, matches origin.
  See [[edgewater-state]] for the app itself. Neither `.env` (correctly
  gitignored) nor a `.venv` exist yet on this machine, both need setting up
  before it'll actually run here.
- `mf/personal/projects/code` — only a `leet/` folder (LeetCode practice
  scripts) so far. FRED_Loader/Census_Loader/ResearchFramework/
  SolbergMainframe (see [[research-tools-state]], [[solbergmainframe-state]])
  are NOT on this machine yet.
- `mf/school`, `mf/personal/training` — empty, left as placeholders
  intentionally (Ian's call, not stale).
- `mf/personal/notes` — actively used (journal, reference links).

General PC cleanup done this session: removed stale/duplicate installers and
zips from Downloads, removed Postman (installer + leftover home-dir folder,
per the no-Postman rule), moved Assetto Corsa mod archives from Desktop into
`Documents/Assetto Corsa Archives`, deleted a redundant
`FinancialEdgeConnector.zip` that duplicated the live repo.

This machine has a `D:\` drive (bigger than the Mac's), used as an archive
target. `D:\backups\` now holds the Mac's offloaded material (mp3dump,
Dartmouth internship archive, Ableton screen recordings, superseded-code
zip), transferred 2026-07-18 via Windows OpenSSH Server running on this
machine, see [[pc-ssh-access]]. `D:\backups\iphone\` also exists there,
predates this transfer, unrelated. Ian also wants to build out an SSH
tooling project on this machine specifically, see [[ssh-tooling-project]]
for the (currently thin) details.

**Project-key gotcha (fixed 2026-07-18):** `install/windows.ps1` originally
derived the memory-sync project key from `$env:USERPROFILE`
(`C--Users-ians0`), but this session's actual Claude Code project key was
`C--`, because the session's working directory was bare `C:\`, not the home
dir. Sessions on this machine apparently don't default to launching with cwd
= home dir the way the Mac install assumed. Fixed the script to derive the
key from the actual invocation directory (`Get-Location`) instead — run it
from whatever directory `claude` sessions actually launch from here, and
re-run if that changes. See [[memory-bank-ownership]].
