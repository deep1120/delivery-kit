---
name: acceptance-check
description: Validate implementation against acceptance criteria.
---

# /acceptance-check

Primary agent: `qa-tester`


Use this after implementation and review.

Steps:
1. Read the story acceptance criteria.
2. Read implementation summary and test evidence.
3. Validate each criterion.
4. Test happy path, edge cases, and error states when possible.
5. Write `.agent/qa/<story>-qa.md`.

Output one row per acceptance criterion:
- Criterion
- Status
- Evidence
- Bug/follow-up


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
