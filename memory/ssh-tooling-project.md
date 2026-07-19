---
name: ssh-tooling-project
description: "The cross-machine pipeline is now real, machine-sync in ~/claude/myToolBox; PC->Mac ssh still needs Mac-side setup"
metadata: 
  node_type: memory
  type: project
  originSessionId: b2ea4edb-2592-4d5f-a9ac-1ae3d30b2939
---

Resolved 2026-07-19: the "proper pipeline for filing things between systems"
became **machine-sync**, built this session inside the myToolBox monorepo at
`~/claude/myToolBox` on the PC (git repo, initial commit drafted; the mystery
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

State as of 2026-07-19:
- PC side installed and guard/path logic verified; live transfers untested.
- PC->Mac ssh NOT yet working: Remote Login status on the Mac unknown, PC
  keypair generated (`~/.ssh/id_ed25519`, comment `ians0-pc`), PC
  `~/.ssh/config` has `Host mac` with placeholder `MACBOOK.local`, needs the
  real LocalHostName. Full steps in `machine-sync/docs/setup.md`.
- Mac side (install-mac.sh, config, `~/claude` mirror) waits for Ian's next
  Mac session; `Host pc` alias also still to add there (see
  [[pc-ssh-access]]).
- Python 3.13.14 installed on the PC via winget 2026-07-19 (Ian's choice),
  user PATH puts it ahead of the Store stubs in any new terminal. csv-utf8
  verified end-to-end on it (cp1252/utf-16/utf-8-sig fixtures converted,
  idempotent second pass). charset-normalizer not installed, stdlib
  fallback in use.
- Confirmed: `pull.pc.claude --from` takes a PC path (spec typo).
