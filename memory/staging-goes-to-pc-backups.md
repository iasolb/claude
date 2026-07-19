---
name: staging-goes-to-pc-backups
description: "Standing rule, staged/swept material on the Mac defaults to offload to the PC's D:\\backups, not local staging folders"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 3278a134-e273-43ad-b299-630a044fa2bc
---

Given 2026-07-19, right after the Mac filesystem refactor created local
staging folders: "anything you stage in this env should likely end up in pc
backups."

**Why:** local _to-sort style staging folders just relocate clutter; the
PC's D: drive is the designated dead-weight-worth-keeping archive
(see [[pc-ssh-access]], [[mac-filesystem-refactor]]).

**How to apply:** when a cleanup pass on the Mac produces a
keep-but-not-active pile, default to shipping it to `D:\backups\` via
tar-over-ssh (verify counts + byte sums, then delete locally) instead of
leaving a staging folder behind. Exception granted the same day: active-use
material can stay local, e.g. `Music Production/_to-sort` (audio on the
Ableton machine) was deliberately kept local while the docs and screenshot
staging went to `D:\backups\mac-staging-2026-07\`.
