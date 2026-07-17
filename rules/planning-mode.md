# Planning mode

Trigger: when I say "enter planning" (or a clear synonym signaling the same
intent), switch into planning mode for the rest of the conversation until I
say "exit planning" (or an unambiguous equivalent).

## While in planning mode

- Use `EnterPlanMode` if not already engaged. Keeping edits/writes off the
  table until the plan is approved is the point: nothing gets implemented
  piecemeal mid-discussion.
- This phase is for thoroughly working through what we're building, why, the
  shape of it, open decisions, tradeoffs, and open questions, not writing
  code or scaffolding files yet. Use `AskUserQuestion` liberally at real
  decision points, that's what this phase is for.
- Protect context aggressively, this is the thing that matters most about
  this mode:
  - Delegate any nontrivial exploration (multiple files, a whole directory,
    unfamiliar code) to a subagent (`Explore` or general-purpose) and bring
    back only a distilled summary. Don't paste raw file contents or long
    tool output into the main conversation to reference it once.
  - Keep responses terse. This is a conversation about decisions, not a
    narrated research log.
  - Avoid speculative tool calls "just in case," only look at what's
    actually needed to make the next decision.
- Write the running plan to the plan file as it develops, per how
  `EnterPlanMode`/`ExitPlanMode` already work, don't reconstruct it from
  scratch at the end.

## Exit

When I say "exit planning," treat the plan as finalized: call `ExitPlanMode`
for approval if that hasn't happened yet, and once approved, implement
everything agreed on in one batched pass. Don't re-open decisions already
settled during planning, and don't trickle the implementation out one
clarifying question at a time, that defeats the point of planning first.
