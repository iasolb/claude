---
name: pc-ssh-access
description: The Mac has key-authed SSH access to the Windows PC for transfers and remote tasks
metadata:
  type: reference
---

Set up 2026-07-18: Windows OpenSSH Server runs on the PC (see [[pc-layout]]),
and the Mac's `~/.ssh/id_ed25519` key is installed in the PC's
`C:\ProgramData\ssh\administrators_authorized_keys`. Connect with
`ssh ians0@10.0.0.186` (LAN IP, could change with DHCP; the PC is wired,
the Mac is on Wi-Fi). Default remote shell is cmd, wrap PowerShell as
`powershell -NoProfile -Command "..."`.

Useful patterns proven to work: tar-over-ssh for bulk pushes
(`COPYFILE_DISABLE=1 tar -cf - . | ssh ians0@10.0.0.186 "tar -C D:/target -xf -"`),
bsdtar on Windows auto-renames NTFS-illegal characters (`::` becomes `__`)
and refuses macOS `Icon\r` files (delete those first, they're Finder junk).
Verify transfers by comparing per-folder file counts and logical byte sums;
symlinks arrive as zero-byte files.

`D:\backups\` on the PC now holds the Mac's offloaded archive: mp3dump,
Dartmouth internship work, Ableton screen recordings 2025-03-05, and
superseded-code-2026-07.zip (all deleted from the Mac 2026-07-18 after
byte-exact verification; the Mac's `_transfer_to_pc/` and `backups/` dirs
are gone).
