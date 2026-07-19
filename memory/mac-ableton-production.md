---
name: mac-ableton-production
description: "The MacBook is Ian's Ableton production machine; SAMPLE CORE stays on it, non-negotiable"
metadata: 
  node_type: memory
  type: user
  originSessionId: 3278a134-e273-43ad-b299-630a044fa2bc
---

Ian produces music in Ableton on the MacBook specifically: Windows machines
gave him bad audio latency. So `SAMPLE CORE (Refurbished)/` (his sample
library, ~14G, at `~/Documents/Music Production/` since the 2026-07-19
refactor, see [[mac-filesystem-refactor]])
stays on this machine no matter how big it is,
he said non-negotiable (2026-07-18). The top-level Music/ beats and tags are
also live production material. Never propose moving or archiving these to
free space. See [[mainframe-layout]].

Reorganized 2026-07-18 into a by-sound-type taxonomy Ian chose: Drums/
(Kicks, Snares, Claps, Hats, Cymbals, Percussion, 808s & Bass, Kits/ for
intact producer kits), Melodic/ (Loops, One Shots), Vocals/, FX/, MIDI/,
Presets/, Beats/ (full beats for flipping, includes @prodyoshi01 and
@rasmusoskar packs). Cymatics SOLSTICE was split by its own subfolders with
the pack name kept; mixed kits (NBA Youngboy, Metro Boomin, opium, detroit,
etc.) stayed intact under Drums/Kits/. Ableton project folders moved out to
`MAINFRAME/Music/Ableton Projects/`. ~4,950 AppleDouble/metadata junk files
deleted; .asd kept deliberately (they save Ableton re-analysis).

Gotchas learned: several folder names carried invisible private-use Unicode
characters (U+F028/U+F022, Windows-interop artifacts) that break exact-path
commands, resolve with globs or find. Old projects opened after the move
will prompt a one-time media relink; nothing was deleted, so Ableton's
auto-search over SAMPLE CORE finds everything.
