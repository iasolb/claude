---
name: mainframe-layout
description: "Where everything lives on Ian's MacBook, all code under Documents/MAINFRAME, audio under Documents/Music Production"
metadata: 
  node_type: memory
  type: project
  originSessionId: 91d37473-1098-4651-8d05-5a2d210ae14c
---

All code on this machine lives under `~/Documents/MAINFRAME/` (moved off the
Desktop 2026-07-19 in the filesystem refactor, see [[mac-filesystem-refactor]];
the Desktop is now deliberately empty). Audio production material was split
out to a sibling `~/Documents/Music Production/` the same day: SAMPLE CORE
(Refurbished), Music, Project Files College Computer (Ableton projects,
16G), Beat MP3s, samplesmp3, VS3 - Ableton Live 11, and a `_to-sort/`
staging folder holding the old Downloads audio sweep (~1100 files).
Ableton may need sample paths relinked after the moves.

Documents' other top-level folders (My Tableau Repository, Max 8, Zoom,
Native Instruments, Stata, GitHub, Playgrounds, AutoTunePro, Blackmagic
Design) are app-managed and were left in place. `~/Spitfire` (4.2G LABS
instrument data) stays at home-dir top level, moving it breaks plugin paths.

MAINFRAME contents (code side reorganized 2026-07-18: stale backups,
redownloadable bloat, and duplicate zips deleted; superseded code zipped to
`backups/superseded-code-2026-07.zip`, now on the PC):

- `Personal/Code/`: FRED_Loader, ResearchFramework, FRED_DebtAnalysis,
  CensusTestingEnv (vendored copy of Census_Loader), SolbergMainframe,
  LeetCode, canvas_scrape.
- `Work/Edgewater/`: EdgewaterDB (active repo, see [[edgewater-state]]) plus
  reference/ and schema/. Old attempts live only in the superseded-code zip.
- `Work/TallPoppies/`: FinancialEdgeConnector (deployed).
- `Work/Wayfair/`: empty, that work lives on the GCP Vertex AI VM only.
- `School/labs+research/Chiari Malformation/`: BRAIN is the live deployed
  dashboard repo (GitHub + HF Spaces remotes); its predecessor Chiari
  Dataview is in the superseded-code zip. See [[financialedge-brain-state]].
- `SAMPLE CORE (Refurbished)/` and `Music/`: moved to
  `~/Documents/Music Production/` 2026-07-19; still on this machine only,
  see [[mac-ableton-production]].
- `School/_downloads-sorted/`: staging for ~340 docs/data/code files swept
  out of Downloads 2026-07-19, unsorted by design.
- `Personal/`: absorbed the old `~/Documents/Personal` (Important to Keep,
  Streamlabs alias); its 11G pre-refurbish SAMPLE CORE zip was deleted.
- `Videos/`: absorbed stray MOVs/webm from Downloads.
- Offload complete 2026-07-18: mp3dump, the 2025-03-05 screen recordings,
  the Dartmouth archive, and the superseded-code zip all live on the PC at
  `D:\backups\` now (byte-verified, see [[pc-ssh-access]]). The Mac's
  `_transfer_to_pc/` and `backups/` dirs were deleted after verification.

The `~/claude` layout mirrors the PC's as of 2026-07-19:
`~/claude/claude-memory-bank` (git, remote iasolb/claude-memory-bank,
symlinked into `~/.claude` via `install/mac.sh`, `mac` branch),
`~/claude/myToolBox` (machine-sync + csv-utf8), and
`~/claude/session/{context,working,outputs}`. The old config at
`Desktop/MAINFRAME/Personal/Code/claude/` is retired but intact.
See [[memory-bank-ownership]].
