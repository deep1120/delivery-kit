---
name: capture-learning
description: Save reusable lessons and project rules.
---

# /capture-learning

Primary agent: `context-curator`


Use this when a lesson should affect future work.

Record in `.agent/lessons.md`:
- Lesson
- Why it matters
- Example
- When to apply it
- Whether it should be promoted to `CLAUDE.md`


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
