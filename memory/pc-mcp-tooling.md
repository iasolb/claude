---
name: pc-mcp-tooling
description: "MCP/tooling buildout on the PC started 2026-07-22: what's installed, what's pending auth, and the Google-tooling direction Ian wants next"
metadata: 
  node_type: memory
  type: project
  originSessionId: 0f7a32b0-42ba-477a-9657-c2d8ccb83c81
  modified: 2026-07-23T00:18:57.306Z
---

Ian wants heavy tooling in Claude Code ("a lot of tooling where possible").
Buildout on the PC, 2026-07-22 (all user-scope in `~/.claude.json`):

- **context7** (HTTP, mcp.context7.com) — connected and working.
- **github** (HTTP, api.githubcopilot.com/mcp/) — added, **awaiting OAuth**
  via `/mcp` in an interactive session. `gh` CLI 2.96 installed via winget to
  `C:\Program Files\GitHub CLI\gh.exe` (machine PATH; older shells may need
  the full path), **awaiting `gh auth login`**.
- **edgewater-mysql** (stdio, `@benborla29/mcp-server-mysql` via npx) —
  configured for 127.0.0.1:3306 / EdgewaterMaster, read-only defaults.
  **Verified working end-to-end 2026-07-22**: stack stood up with
  `docker compose -f <repo>\docker-compose.yaml up --build -d` (must pass
  `-f`; sessions run from `C:\`), DB auto-initialized (7,255 items / 1,562
  orders / 5,215 inventory rows; tables are `T_`-prefixed, and
  `T_StockMovement` + `v_stock_on_hand` already exist — relevant to the
  stock-ledger redesign), app answered on :8000, MCP health-checked ✓. Then
  stood back down; the `edgewater_db_data` volume persists, so next
  `compose up` is instant and pre-loaded. Real `.env` now exists in the repo
  (fresh SESSION_SECRET; creds match `.env-example`). Docker Desktop is
  normally OFF on this PC — start it before expecting the MCP to connect.
- **gmail** (stdio, `@gongrzhe/server-gmail-autoauth-mcp` via npx) — set up
  and verified 2026-07-22 against ianspraguesolberg@gmail.com (6,716 messages
  at setup time). OAuth via Ian's own GCP project (display name
  google-tooling-mcp, project_id velvety-pagoda-503300-m2, consent-screen app
  name "personal-abc-mcp", **published to Production** so tokens don't expire
  weekly). Credentials + token live in `~/.gmail-mcp/` (gcp-oauth.keys.json +
  credentials.json) — treat as secrets, never commit. Scopes: gmail.modify +
  gmail.settings.basic (labels/trash/filters yes, no permanent delete).
  Northeastern mail is Microsoft-tenant; M365 connector needs tenant admin
  consent (untested), Chrome-driving Outlook web is the fallback.
- **Gmail cleanup project (open):** Ian wants a bulk spam purge + labeling +
  filters in the personal Gmail. Agreed ground rules: dry-run counts/samples
  first, Ian approves categories, trash not permanent delete. A consolidated
  Google Workspace MCP (Calendar/Drive/Docs/Sheets) is the agreed next add,
  riding the same GCP project; Ian enabled the extra APIs already.
- The claude.ai stock life-sciences connectors (PubMed etc.) are noise from
  the account level, not deliberate.
- The mcp-registry search API returned empty for everything on 2026-07-22 —
  don't rely on it from this machine.

**Next directions Ian asked for (2026-07-22):** Gmail + Google Calendar
tooling (plan: first-party claude.ai connectors, claude.ai/settings/connectors),
and — his words — "a ton of stuff I'd like help syncing around and putting in
the right place," which rhymes with the cross-machine filing/git pipeline goal
already recorded on the memory-bank master branch. A custom myToolBox FastMCP
server (machine-sync, FRED_Loader as tools) was floated and deferred, not
rejected. See [[ssh-tooling-project]], [[edgewater-state]].
