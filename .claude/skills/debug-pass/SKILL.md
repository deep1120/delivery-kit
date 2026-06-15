---
name: debug-pass
description: Diagnose a bug, failing test, or runtime issue with minimal context.
---

# /debug-pass

Primary agent: `engineer`


Use this when something fails and the cause is unknown.

Steps:
1. Capture the failing command or reproduction.
2. Read the smallest relevant logs.
3. Identify likely root cause.
4. Apply a focused fix or recommend next diagnostic step.
5. Re-run the failing check when possible.

Output:
- Symptom
- Root cause hypothesis
- Evidence
- Fix or next step
- Validation result


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
