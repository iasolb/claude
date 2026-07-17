---
description: Review class/module design against Ian's abstraction and inheritance conventions (shallow inheritance + @final/@override, dispatch tables, bounded generics, shared helpers, context managers)
argument-hint: [path to the code being reviewed]
---

Use the Agent tool with `subagent_type: abstraction-pattern-reviewer` to
review the code at `$ARGUMENTS` (if no path was given, ask which
project/file to review rather than guessing). Pass along any context from
this conversation the agent would need (what's new/changed, what it's meant
to do). Relay its findings back directly, don't re-summarize them into
something vaguer.
