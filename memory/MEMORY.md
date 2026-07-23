# Memory index

- [MAINFRAME layout](mainframe-layout.md): Documents/MAINFRAME (code) + Documents/Music Production (audio) on the MacBook; memory-bank symlink setup
- [PC layout](pc-layout.md): projects under Documents/mf, Claude workspace at ~/claude, project-key and ssh-shadowing gotchas documented inside
- [Memory-bank ownership](memory-bank-ownership.md): claude-memory-bank is Claude's repo (commit AND push since 2026-07-19), all others are Ian's
- [Memory-bank branch workflow](memory-bank-branch-workflow.md): per-machine branches windows/mac, hook-merged each session; both machines migrated 2026-07-19
- [Edgewater state](edgewater-state.md): EdgewaterDB is live; next phase is the stock-ledger inventory redesign; Passwords.csv is fake dev data, deliberate
- [Research tools state](research-tools-state.md): FRED_Loader/ResearchFramework dirty and mid-refactor as of July 2026
- [SolbergMainframe state](solbergmainframe-state.md): Django codebase still untracked; Rebrickable loader is the open item
- [Mac is the Ableton machine](mac-ableton-production.md): SAMPLE CORE and Music stay on the MacBook, never propose moving them
- [Mac filesystem refactor](mac-filesystem-refactor.md): executed 2026-07-19 incl. the _to-sort sorting pass; only _needs-listen (~280 files) awaits Ian's ears
- [Staging goes to PC backups](staging-goes-to-pc-backups.md): staged/swept keep-but-dormant piles on the Mac default to D:\backups offload, not local staging folders
- [PC SSH access](pc-ssh-access.md): key-authed `ssh pc` (ians0@10.0.0.186), Mac reserved at 10.0.0.225, tar-over-ssh transfer patterns, D:\backups holds the Mac offload
- [SSH tooling project](ssh-tooling-project.md): machine-sync fully operational, every path live-tested both directions 2026-07-19; gotcha list documented inside
- [FinancialEdge + BRAIN state](financialedge-brain-state.md): both deployed (Oracle VM June 2026, HF Spaces May 2026)
- [Gmail cleanup project](gmail-cleanup-project.md): recon done 2026-07-22 — 4 purge tiers (~4,500 msgs) + keep-list mapped, awaiting Ian's tier approval
- [PC MCP tooling](pc-mcp-tooling.md): context7 + edgewater-mysql + gmail MCP all verified working (gmail via Ian's own GCP OAuth, tokens in ~/.gmail-mcp); github MCP + gh CLI await auth; open items: Gmail bulk-cleanup project, Workspace MCP for Calendar/Drive
