---
name: build-story
description: Implement one approved story and record validation evidence.
---

# /build-story

Primary agent: `engineer`


Use this to implement one story only.

Steps:
1. Read story and implementation plan.
2. Confirm edit boundary.
3. Implement the smallest working change.
4. Add/update tests.
5. Run relevant checks.
6. Update `.agent/current.md` and record validation evidence.

Output:
- Files changed
- Tests added/updated
- Commands run and results
- Acceptance criteria status
- Risks/follow-ups


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
