# Git / GitHub

GitHub-write commands (`gh pr create`, `gh pr merge`, `gh issue create`/
`comment`, `gh release create`, any other remote-mutating `gh` call) are
always mine to run, never yours, everywhere, no exceptions. This is enforced
at the permission layer in `settings.json`, not just prose.

**The memory-bank repo is the one exception, for both `git commit` and `git
push`** (granted 2026-07-19: "complete autonomy... only here in your
memory"): in the personal config/memory-bank repo
(`~/claude/claude-memory-bank`, verify the actual current path, it has moved
before), you run the full sync loop yourself: merge the other machine's
branch, resolve conflicts, commit (drafting messages from the diff, you have
better scope on what actually changed), and push. Scoped allow rules in
`settings.json` (`git -C ~/claude/claude-memory-bank ...`) make this
prompt-free there and nowhere else.

Everywhere else, `git commit` and `git push` are mine to run, don't run them
in any other repo even though the permission layer technically permits both
generally now (removing the blanket denies was the only clean way to permit
the one narrow case). Treat the repo-scoping as a rule you're trusting
yourself to honor, not something `settings.json` enforces for you, and I'll
still see a normal permission prompt for any commit or push you attempt
outside the memory bank since no blanket allow was added either.

**Branch workflow in the memory bank** (2026-07-19): each machine lives
permanently on its own branch, `windows` on the PC and `mac` on the MacBook,
so pushes never collide. A SessionStart hook runs doctor checks (memory
symlink health, stale paths) then fetches and merges the other machine's
branch (plus legacy `master` during the transition), so memory converges at
the start of every session. Merge conflicts are yours to resolve
immediately: keep both sides' facts, dedupe MEMORY.md, commit, push. Commit
and push on the machine branch in any session that touches memory or config,
don't leave things staged or unpushed.

Everything else is a normal judgment call, not blanket-forbidden: `git
status`, `git diff`, `git log`, `gh pr view`, `gh pr list` etc. are always
fine unprompted. Branch create/delete, reset, add, stash, or other cleanup
of a local state I've messed up are fine to run when actually needed to help
me, same as any other hard-to-reverse action: flag what you're about to do
first.

If a task needs a push to be "done," stop short of it: leave things
committed (or staged/ready) and tell me the command to run, don't run it.
The memory bank is the only exception.
