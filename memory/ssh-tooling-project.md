---
name: ssh-tooling-project
description: "machine-sync installed on both machines, Mac->PC transfers verified live; PC->Mac ssh blocked only on Remote Login toggle"
metadata: 
  node_type: memory
  type: project
  originSessionId: b2ea4edb-2592-4d5f-a9ac-1ae3d30b2939
---

Resolved 2026-07-19: the "proper pipeline for filing things between systems"
became **machine-sync**, built this session inside the myToolBox monorepo at
`~/claude/myToolBox` on the PC (git repo, committed and pushed by Ian
2026-07-19; the mystery
"ssh tooling system" turned out to be his work `workbench-sync` utility,
kept locally at `myToolBox/workbench-sync-master` and gitignored as
Wayfair-derived reference).

What machine-sync is: peer-to-peer tar-over-ssh transfer, commands on both
machines. PC gets `pull.mac`/`push.mac`/`pull.mac.claude`/`push.mac.claude`
(PowerShell profile functions), Mac gets `pull.pc`/`push.pc`/
`pull.pc.claude`/`push.pc.claude`. Hybrid path model (relative resolves
against configured roots: `Documents\mf` on PC, `~/Desktop/MAINFRAME` on
Mac; absolute passes through). `*.claude` variants target the claude working
dir (`~/claude/session/working` on both). Optional `--csv` runs
`csv-utf8/ensure_utf8.py` (toolbox tool #2) over the destination. Config at
`~/.machine-sync.ps1` / `~/.machine-sync.env`; ignore list at
`~/.machinesync-ignore`, never excludes `.git`.

State as of 2026-07-19 (evening, Mac session):
- Both sides installed. Mac: `install-mac.sh` run, seeded
  `~/.machine-sync.env` defaults were already correct (MAINFRAME root,
  `~/claude/session/working`), bin dir on PATH via `~/.zshrc`, `Host pc`
  alias added (see [[pc-ssh-access]]).
- First live transfer verified: `pull.pc.claude --from
  personal/notes/websites-to-remember.txt` landed byte-correct in the
  claude working dir (test copy deleted after).
- PC->Mac ssh is one toggle away: the PC's pubkey (`ians0-pc`) is installed
  in the Mac's `~/.ssh/authorized_keys`, and the PC's `~/.ssh/config`
  `Host mac` placeholder was fixed to `Ians-MacBook-Pro.local` (done
  remotely over ssh). Remaining: Ian turns on Remote Login on the Mac
  (System Settings > General > Sharing, needs admin; sshd confirmed not
  listening). Then test `ssh mac` from the PC.
- Python 3.13.14 installed on the PC via winget 2026-07-19 (Ian's choice),
  user PATH puts it ahead of the Store stubs in any new terminal. csv-utf8
  verified end-to-end on it (cp1252/utf-16/utf-8-sig fixtures converted,
  idempotent second pass). charset-normalizer not installed, stdlib
  fallback in use.
- Confirmed: `pull.pc.claude --from` takes a PC path (spec typo).
