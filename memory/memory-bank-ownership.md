---
name: memory-bank-ownership
description: "claude-memory-bank is Claude's repo to commit in; every other repo is Ian's"
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 91d37473-1098-4651-8d05-5a2d210ae14c
---

Ian's framing (2026-07-18): "think of it being your repository, and all other
repos are mine - you can touch that one but not mine." The memory-bank repo
(at `~/claude/claude-memory-bank` on the PC since 2026-07-19; verify current
path, it has moved before) is the one repo where Claude runs git itself.
Expanded 2026-07-19 to complete autonomy there: merge, commit, AND push, "out
of the dev stage in that area." Push remains Ian's in every other repo, no
exceptions. Per-machine branches carry the workflow, see
[[memory-bank-branch-workflow]].

**Why:** the memory bank is meant to be a living document Claude maintains
across sessions and machines; requiring Ian to commit config/memory updates
would defeat that.

**How to apply:** keep CLAUDE.md, rules/, agents/, commands/, hooks/ in the
memory-bank repo current as things change, commit and push there freely with
clear messages, never commit or push in any other repo. Stay on the machine
branch (`windows` on the PC, `mac` on the MacBook); the SessionStart hook
merges the other branch each session and any conflicts are Claude's to
resolve carefully, keeping both sides' facts (Ian's instruction lineage:
pull-before-commit 2026-07-18, branch workflow 2026-07-19). Full rule text
lives in `rules/git-github.md` in that repo. See [[mainframe-layout]] and
[[memory-bank-branch-workflow]].
