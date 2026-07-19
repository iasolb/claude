# PC -> Mac checklist (pushed 2026-07-19)

Sent from the PC session. Ian: fill the blanks or just tell Claude on the
Mac to "work through the inbox checklist", items 4-6 are Claude-runnable.
When everything is done, Claude deletes this file and the MEMORY.md pointer
line, records the answers in the right memories, commits, pushes.

## 1. Private Wi-Fi Address setting

System Settings > Wi-Fi > Details (home network) > Private Wi-Fi Address.

- Was set to: [ ] Rotating  [ ] Fixed  [ ] Off
- Now set to Fixed (or Off): [ ] done

## 2. Current network identity (run after any change to item 1)

```bash
ipconfig getifaddr en0
ifconfig en0 | grep ether
```

- IP: ____________
- Hardware (MAC) address: ____________

## 3. Router DHCP reservations (Xfinity app or http://10.0.0.1)

- MacBook reserved at its IP from item 2: [ ] done
- PC (DESKTOP-8G5H7LF, wired) reserved at 10.0.0.186: [ ] done

If the Mac's reserved IP is anything other than 10.0.0.9, the PC-side
`~/.ssh/config` needs its `Host mac` HostName updated; note it here so the
PC session fixes it: new IP ____________

## 4. workbench-sync purge (Claude-runnable)

Work code, not for personal machines (Ian, 2026-07-19). The PC copy is
already deleted. Find and delete every Mac copy:

```bash
find ~ -maxdepth 6 -iname "*workbench*" -not -path "*/Library/*" 2>/dev/null
```

- Copies found at: none (find over ~ maxdepth 6 + mdfind, 2026-07-19
  evening; only MySQL Workbench artifacts, unrelated)
- Deleted: [x] done (nothing to delete, already recorded in
  ssh-tooling-project)

## 5. Toolbox pull (Claude-runnable)

```bash
git -C ~/claude/myToolBox pull
```

Brings the PC's E2E hardening commit (ssh -n probes, unreachable-peer
handling, confirm fail-closed) into the Mac clone.

- [x] done (already up to date, e2cde40 "fixed gotchas." present, so Ian
  committed and pushed the hardening from the PC)

## 6. Wrap-up (Claude-runnable)

- Update memories: reservation state + final IPs into pc-ssh-access,
  workbench-sync deletion confirmed into ssh-tooling-project.
- Delete this file and its MEMORY.md pointer line, commit, push.
