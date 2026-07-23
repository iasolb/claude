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

Boundary (2026-07-19): "ableton is my business." Production is entirely
Ian's domain: don't proactively raise Ableton topics (relinking, library
organization, anything), especially from the PC, where he does no
production. If Ableton help is ever wanted, he'll ask, and it'll be from
the Mac.

Reorganized 2026-07-18 into a by-sound-type taxonomy Ian chose: Drums/
(Kicks, Snares, Claps, Hats, Cymbals, Percussion, 808s & Bass, Kits/ for
intact producer kits), Melodic/ (Loops, One Shots), Vocals/, FX/, MIDI/,
Presets/, Beats/ (full beats for flipping, includes @prodyoshi01 and
@rasmusoskar packs). Cymatics SOLSTICE was split by its own subfolders with
the pack name kept; mixed kits (NBA Youngboy, Metro Boomin, opium, detroit,
etc.) stayed intact under Drums/Kits/. Ableton project folders moved out to
`MAINFRAME/Music/Ableton Projects/`. ~4,950 AppleDouble/metadata junk files
deleted; .asd kept deliberately (they save Ableton re-analysis).

Sorting guidance from Ian (2026-07-19, when he asked Claude to sort
`_to-sort` into the library): the Beats/Melodic-Loops boundary is fuzzy and
he does not care much, don't agonize over it; longer producer-tagged mp3s
(@handle, BPM, key in the name) are often full loops rather than finished
beats. Song rips live in their own top-level `Music Production/Song Rips/`,
not in Beats/. Kit zips get unpacked and split by sound type with the pack
name kept (SOLSTICE precedent), not stored intact.

Gotchas learned: several folder names carried invisible private-use Unicode
characters (U+F028/U+F022, Windows-interop artifacts) that break exact-path
commands, resolve with globs or find. Old projects opened after the move
will prompt a one-time media relink; nothing was deleted, so Ableton's
auto-search over SAMPLE CORE finds everything.
