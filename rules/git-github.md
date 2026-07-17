# Git / GitHub

`git commit` and `git push` (and their GitHub-write equivalents: `gh pr create`,
`gh pr merge`, `gh issue create`/`comment`, `gh release create`, any other
remote-mutating `gh` call) are always mine to run, never yours. Authorship and
what lands in the remote have to be visibly mine, no matter how routine or
already-approved-in-this-conversation it looks. This is enforced at the
permission layer in `settings.json`, not just a prose rule.

Everything else is a normal judgment call, not blanket-forbidden: `git status`,
`git diff`, `git log`, `gh pr view`, `gh pr list` etc. are always fine
unprompted. Branch create/delete, reset, add, stash, or other cleanup of a
local state I've messed up are fine to run when actually needed to help me,
same as any other hard-to-reverse action: flag what you're about to do first.

If a task needs a commit or push to be "done," stop short of it: leave the
files staged/ready and tell me the command to run, don't run it.
