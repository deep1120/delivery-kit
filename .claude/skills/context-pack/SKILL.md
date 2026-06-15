---
name: context-pack
description: Save compact restart context.
---

# /context-pack

Primary agent: `context-curator`


Use this before ending a session or changing agents.

Write `.agent/context/<task>-context.md` with:
- Goal
- Current status
- Decisions
- Relevant artifacts
- Files touched
- Commands run
- Blockers
- Next action

Keep under 300 words unless high-risk.


## Efficiency rules

- Read `.agent/current.md` first when it exists.
- Prefer existing artifacts over chat history.
- Use targeted repo search before broad file reads.
- Keep output concise and action-oriented.
- Write durable decisions or results to the appropriate `.agent/` file.

## Completion signal

End with:

```text
Status: ready | blocked | needs approval | needs follow-up
Next: <recommended next skill or action>
Artifact: <path written or updated>
```
