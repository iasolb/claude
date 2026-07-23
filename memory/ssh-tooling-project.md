---
name: ssh-tooling-project
description: "machine-sync fully operational both directions, E2E-tested 2026-07-19; environment gotchas (mDNS, SFTP scp, Mac python3 shim) documented inside"
metadata: 
  node_type: memory
  type: project
  originSessionId: b2ea4edb-2592-4d5f-a9ac-1ae3d30b2939
---

Resolved 2026-07-19: the "proper pipeline for filing things between systems"
became **machine-sync**, built this session inside the myToolBox monorepo at
`~/claude/myToolBox` on the PC (git repo, committed and pushed by Ian
2026-07-19; the mystery
"ssh tooling system" turned out to be his work `workbench-sync` utility.
Reference copies of it are deleted from both personal machines per Ian
2026-07-19, "those are not for here": work code stays at work. PC copy
removed same day; Mac verified clean 2026-07-19 evening, no copy exists
anywhere under Documents or ~/claude, likely swept in the filesystem
refactor. Purge complete on both machines, nothing pending).

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
- PC->Mac ssh live 2026-07-19 (Remote Login enabled) and the FULL E2E
  checklist passed from the PC: dir pull with ignore filtering, single-file
  pull, both claude variants, pushes to new/existing destinations, --csv
  conversion verified byte-exact. Hardening that came out of it (all in
  machine-sync, committed and pushed by Ian as e2cde40, confirmed in the
  Mac clone 2026-07-19 evening):
  - `Host mac` pins the Mac's IP, NOT the .local name: Windows mDNS
    resolution is intermittent (works maybe half the time).
    `StrictHostKeyChecking accept-new` is set. Router reservations landed
    2026-07-19 (Mac 10.0.0.225, PC 10.0.0.186, see [[pc-ssh-access]]) and
    the pin was updated from 10.0.0.9, so drift should be over.
  - PC PowerShell resolves ssh AND tar to Git for Windows' builds (PATH
    shadowing); scripts pin System32 natives explicitly. Git's ssh cannot
    resolve .local; Git's GNU tar cannot take `C:\` in `-C`.
  - PC has OpenSSH 9.5p1: scp is SFTP-mode, remote paths are literal, never
    quote-wrap them.
  - ssh probes use `-n` (else they eat stdin meant for the y/N confirm) and
    treat ssh exit 255 as "peer unreachable, abort" rather than "false".
  - Push confirm fails closed ($null from Read-Host at stdin EOF bypassed
    -notmatch; the work reference tool has this same latent bug).
  - The Mac non-interactive python3 problem: FIXED 2026-07-19 (Mac session)
    via `~/.zshenv` prepending pyenv shims to PATH, so ssh-invoked commands
    now get pyenv 3.12.7 (verified with a clean-env `zsh -c` simulation,
    including the `python3 -` stdin-streaming form --csv uses). Real cause
    was NOT CLT damage (`xcode-select --install` says already installed):
    `xcode-select -p` pointed at full Xcode.app, whose xcodebuild crashes
    on a framework mismatch (CoreDevice expects _XPCTypeBool, missing from
    the OS Mercury framework; Xcode 26.6 matches macOS 26.6 but the Mac is
    on a beta seed, 25G5057c). Every /usr/bin shim (git AND python3) died
    through it, and each hit fired the "install developer tools" popup Ian
    kept seeing. Interactive shells never saw it (Homebrew git 2.55.0 and
    pyenv python win in PATH). RESOLVED 2026-07-19: Ian switched the dev
    dir to CLT (`sudo xcode-select -s /Library/Developer/CommandLineTools`)
    and purged Xcode.app plus all of ~/Library/Developer (~8G freed, he
    does no Xcode/iOS dev). Verified after: shims resolve through CLT
    (Apple Git 2.50.1, python3 3.9.6, exit 0), popup gone. CLT (2.9G)
    stays, do not suggest removing it. Retested from the PC 2026-07-19
    after the fix: push.mac --csv now converts ON the Mac (cp1252 fixture
    landed byte-exact utf-8, detected as the equivalent cp1250 by the
    pyenv env's charset-normalizer). Every machine-sync path is now
    verified live in both directions, nothing pending.
- Python 3.13.14 installed on the PC via winget 2026-07-19 (Ian's choice),
  user PATH puts it ahead of the Store stubs in any new terminal. csv-utf8
  verified end-to-end on it (cp1252/utf-16/utf-8-sig fixtures converted,
  idempotent second pass). charset-normalizer not installed, stdlib
  fallback in use.
- Confirmed: `pull.pc.claude --from` takes a PC path (spec typo).
