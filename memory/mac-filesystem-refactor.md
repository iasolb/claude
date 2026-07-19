---
name: mac-filesystem-refactor
description: "Mac filesystem refactor executed 2026-07-19; Desktop empty, Documents restructured, ~48G destroyed; staging folders await a later sorting pass"
metadata: 
  node_type: memory
  type: project
  originSessionId: 3278a134-e273-43ad-b299-630a044fa2bc
---

Executed 2026-07-19 (planned and run in one session). Final state:

- `~/Desktop`: completely empty, deliberately. Don't put things back there.
- `~/Documents`: MAINFRAME (code/school/work/personal) + Music Production
  (all audio) + app-managed folders only. See [[mainframe-layout]].
- `~/Downloads`, `~/Movies`: emptied. `~/Pictures/Screenshots/` created,
  holds ~50 swept images.
- Destroyed permanently (~48G, Ian chose rm over D: offload or Trash,
  "they're all cooked and old"): all installers (58), School-001.zip,
  Year 3.zip, TravelTimes_2026 (folder + zips), the 11G pre-refurbish
  SAMPLE CORE zip, ~/Movies screen recordings (18), tmp/lock/metadata junk,
  Postman leftovers (zip + app, per the no-Postman rule).

Staging follow-up (same day): `_downloads-sorted` (459 files, incl.
rockyou.txt.gz, an mdbviewer license file, survey.db, census/GIS data) and
`Pictures/Screenshots` (66 images) were shipped to
`D:\backups\mac-staging-2026-07\` on the PC (byte-verified, local copies
deleted), per the new standing rule [[staging-goes-to-pc-backups]].

`_to-sort` sorting pass: DONE 2026-07-19 evening, Ian asked Claude to run
it (see [[mac-ableton-production]] for the taxonomy guidance that came out
of it). ~580 loose files classified by filename into the SAMPLE CORE
taxonomy (Beats/ got per-@handle folders), 10 kit zips unpacked
SOLSTICE-style, song rips got a new top-level `Music Production/Song Rips/`.
The zips were then offloaded to `D:\backups\mac-staging-2026-07\
unpacked-kit-zips\` (byte-verified, local copies deleted). What remains in
`_to-sort/` is only `_needs-listen/` (~280 files: producer tags, ReelAudio
files, kit-root strays, Ian's own bounces), which needs ears, not
filenames. Move log at `~/claude/session/outputs/to-sort-moves-log.tsv`.

Still deferred: possible renaming of "Project Files College Computer"
(kept as-is to avoid confusing Ableton).

Caveat flagged to Ian: Ableton will likely need sample paths relinked /
browser folders re-added since SAMPLE CORE, Music, and the project folders
all moved.
