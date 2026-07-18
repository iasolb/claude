---
name: edgewater-state
description: EdgewaterDB is the live Edgewater codebase; next phase is the stock-ledger inventory redesign
metadata: 
  node_type: memory
  type: project
  originSessionId: 91d37473-1098-4651-8d05-5a2d210ae14c
---

As of 2026-07-18: `Work/Edgewater/EdgewaterDB` (github.com/iasolb/EdgewaterDB,
main) is the active codebase, last commit 2026-07-01 "frontend final pass"
(plus a same-day "sync to other machine" commit once it was also cloned onto
the PC, see [[pc-layout]]). FastAPI + SQLAlchemy + HTMX/Tailwind v4 PWA,
Dockerized, 14 routers (`main.py`: pwa/auth/home/map/plant/harvest/pitch/
sales/inventory/plantings/orders/labels/admin/users), templates split by
audience (employee/ vs management/ vs admin/) per the two-UX principle.

Superseded, do not build on: `edgewater_attempt1` (old Streamlit stack),
`edgewater_api_cleanup` (its api/ layout was absorbed into EdgewaterDB),
top-level `EdgewaterMasterCleaner` (a copy lives inside EdgewaterDB, the
top-level one is likely stale).

Roadmap lives in-repo: `docs/inventory-redesign.md` (redesign inventory and
sales around a stock-ledger core table, with migration plan and open
questions) is the active forward plan; `docs/frontend-design.md` is the
design system (Component system v2, 2026-07-01). Obsidian vault notes are
mostly historical.

`database/datasource/Passwords.csv` is tracked on purpose: the credentials
in it are fake dev-seed data, the repo is private, and Ian wants it tracked
for convenience during development (confirmed 2026-07-18). Don't re-flag it.
See [[mainframe-layout]].
