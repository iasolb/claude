# Git / GitHub

`git push` (and GitHub-write equivalents: `gh pr create`, `gh pr merge`,
`gh issue create`/`comment`, `gh release create`, any other remote-mutating
`gh` call) are always mine to run, never yours, everywhere, no exceptions.
This is enforced at the permission layer in `settings.json`, not just prose.

**Narrow exception for `git commit`:** in the personal config/memory-bank repo
specifically (`~/claude-memory-bank`, verify the actual current path, it has
moved before), and only as part of the session-sync workflow (a `SessionEnd`
hook stages everything, you draft the commit message from the staged diff
since you have better scope on what actually changed), you may run `git
commit` yourself. Nowhere else. In every other project/repo, `git
commit` is mine to run, same as push, don't run it there even though the
permission layer technically allows `git commit` generally now (removing the
blanket deny was the only clean way to permit the one narrow case). Treat the
repo-scoping as a rule you're trusting yourself to honor, not something
`settings.json` is enforcing for you, and I'll still see a normal permission
prompt for any `git commit` you attempt outside that repo since no blanket
allow was added either.

Always `git pull` before committing in this repo: Ian works on the Mac and
this PC concurrently and both push to the same remote, so check for and
carefully resolve merge conflicts rather than assuming a clean fast-forward
(his instruction, 2026-07-18).

Everything else is a normal judgment call, not blanket-forbidden: `git status`,
`git diff`, `git log`, `gh pr view`, `gh pr list` etc. are always fine
unprompted. Branch create/delete, reset, add, stash, or other cleanup of a
local state I've messed up are fine to run when actually needed to help me,
same as any other hard-to-reverse action: flag what you're about to do first.

If a task needs a push to be "done," stop short of it: leave things committed
(or staged/ready, outside the memory-bank repo) and tell me the command to
run, don't run it.
