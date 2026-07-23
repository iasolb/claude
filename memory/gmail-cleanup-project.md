---
name: gmail-cleanup-project
description: "Gmail bulk-cleanup: executed 2026-07-22 (2,005 trashed, label tree + filters built); next up is the unarchived-inbox pass"
metadata: 
  node_type: memory
  type: project
  originSessionId: 11ffe24d-beb0-450f-9d27-6f5b5dc7afd4
  modified: 2026-07-23T03:23:08.237Z
---

Personal Gmail (ianspraguesolberg@gmail.com, ~6,700 msgs). Ground rules: dry-run first, Ian approves categories, **trash not permanent delete**. Tooling per [[pc-mcp-tooling]] (note: MCP `search_emails` has NO pagination — one page, max 500; estimate via before:/after: date slices; delegate big fan-outs to a subagent).

**Recon findings (2026-07-22, read-only):**
- Mailbox only spans Mar 2024→now; nothing archived (82 msgs outside inbox), ~92% unread. Cleanup is sender-driven, not age-driven.
- Zero filters existed; labels: only user label was `money` (3 msgs, abandoned experiment).
- Buckets: updates ~4,400 (exploded to ~450/mo since Mar 2026 via job alerts), promotions ~1,783, social ~284 (100% LinkedIn), forums 2 (junk).
- Purge tiers (~4,300–4,700 msgs, ~65-70%): T1 job alerts ~1,500 (LinkedIn jobalerts, Glassdoor, Indeed); T2 market noise ~600 (Seeking Alpha ×3 addresses, investingmail, NYT promos); T3 retail+music-gear promos ~1,400 (Total Wine, Wayfair promos, Home Depot, CVS, Bose, eBay, Waves Audio, Vintage King, Antares…); T4 LinkedIn social + USPS daily digests + academia-mail engagement-bait + dormant accounts (Topstep, Dossier, StockX, OANDA, LeetCode…) ~800.
- **Keep-list (protect before any purge):** Wayfair employment thread (offer/contract STARRED; campusrecruiting@, newhireexperience@, fragomen I-9, service-now badge — scattered across updates AND promotions); housing (BREC, dotloop, DepositLink, AppFolio, Conservice); security alerts (Google/GitHub/Okta/Apple); Venmo payments from family (Judith Solberg, Kathryn Forbush, Kennedy Amorim).
- `money` label candidates: Venmo, Fidelity ×3, Webull (incl. tax doc), Credit Karma, Composer, OnePay, TurboTax, PatientGateway (partners.org). Receipts-label candidates: AutoZone orders, Walmart, Apple receipts, Ticketmaster, Conservice, etc.
- Storage warning (Mar 2025) is an attachment issue: only 4 msgs >5M, 3 self-sent media.
- Oddity to eyeball sometime: Feb 2026 self-sent msg with base64-blob subject; lead-gen junk (ClaimsHero, Intelius, RateUpdate) leaking into inbox.

**Approvals (2026-07-22):** Ian approved ALL four purge tiers + full label scheme, with carve-outs: protect Citizens Bank mail, anything tax-looking (1099/W-2/tax docs), and password/account-security mail from purgeable senders (dormant accounts especially). Label spec refined by Ian: `money` nested **by financial entity** (money/Venmo, money/Fidelity, …) each with a `…/transactions` sublabel for individual payment/trade notifications (statements/alerts stay at entity level); `housing` split into `housing/payments` (AppFolio, DepositLink, Conservice) and `housing/communications` (BREC, dotloop). Trash only, never permanent delete.

**Executed 2026-07-22 (all four tiers + labels + filters):**
- **2,005 messages trashed** (30-day recovery): T1 job alerts only 23 (recon's ~1,500 estimate was wrong — LinkedIn job mail lived in category:social, caught in T4; senders like jobalerts-noreply@ returned zero), T2 market noise 3 (Seeking Alpha actually sends via seekingalpha@mail.sailthru.com), T3 retail/gear promos 1,080, T4 social/digests/bait 899. All protections held: 0 Citizens mail exists account-wide; 21 tax-matching messages identified and untouched; ~280 transactional/personal messages (CVS e-receipts, USPS package tracking, order/security mail) deliberately skipped.
- **Label tree** (IDs are short Label_N, verified real): money/Venmo 432 (+/transactions 406), money/Fidelity 47 (+14), money/Webull 124 (+75), money/CreditKarma 91, money/Composer 23, money/TurboTax 40, money/PatientGateway 5, housing/payments 54+OnePay 22 (Ian reassigned OnePay from money to housing mid-run; money/OnePay label deleted), housing/communications 56, employment 81, receipts 30. Nothing archived — everything stayed in INBOX.
- **~13 filters** created routing those senders to labels (label-only, no skip-inbox). **Gotcha: the MCP's `list_filters` is broken — always returns "No filters found" even for filters that verifiably exist via `get_filter`.** Keep filter IDs when creating; enumeration only works via Gmail web UI (Settings → Filters).
- Post-execution tweaks same session: Ian reassigned OnePay from money to housing → all 22 msgs relabeled to housing/payments, money/OnePay label + its filter deleted, new from:one.app→housing/payments filter created. Spot-checked agent-created filters via get_filter: real. Filter IDs are recorded in the execution agent's transcript if ever needed.

**NEXT SESSION (agreed 2026-07-22 night): the unarchived-inbox pass.** Inbox still holds ~4,700 messages; Ian wants to pick up there. Design question to settle with him: what leaves the inbox (e.g. everything labeled money/housing/employment/receipts? everything read? everything older than N months?) — archiving was deliberately out of scope for the purge. Other open follow-ups, unapproved so far: unsubscribe pass; LinkedIn editors/newsletters + Substack + NYT nytdirect purge; the Feb 2026 self-sent base64-subject oddity Ian should eyeball.
