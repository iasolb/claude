---
name: mainframe-layout
description: "Where everything lives on Ian's MacBook, all code under Desktop/MAINFRAME"
metadata: 
  node_type: memory
  type: project
  originSessionId: 91d37473-1098-4651-8d05-5a2d210ae14c
---

All code on this machine lives under `~/Desktop/MAINFRAME/`. Reorganized
2026-07-18 (stale backups, redownloadable bloat, and duplicate zips deleted;
superseded code zipped to `backups/superseded-code-2026-07.zip`):

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
- `SAMPLE CORE (Refurbished)/` and `Music/`: Ableton production material,
  stays on this machine, see [[mac-ableton-production]].
- Offload complete 2026-07-18: mp3dump, the 2025-03-05 screen recordings,
  the Dartmouth archive, and the superseded-code zip all live on the PC at
  `D:\backups\` now (byte-verified, see [[pc-ssh-access]]). The Mac's
  `_transfer_to_pc/` and `backups/` dirs were deleted after verification.

Claude config: `~/claude-memory-bank` (git, remote iasolb/claude-memory-bank)
is symlinked into `~/.claude` via `install/mac.sh` as of 2026-07-18. The old
config at `Desktop/MAINFRAME/Personal/Code/claude/` is retired but intact.
See [[memory-bank-ownership]].
