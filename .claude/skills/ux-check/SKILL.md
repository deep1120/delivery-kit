---
name: ux-check
description: Review implemented UI against design intent and user experience requirements.
---

# /ux-check

Primary agent: `designer`


Use this after UI implementation.

Steps:
1. Read the UI spec and current diff.
2. Validate implemented states and interactions.
3. Check accessibility basics.
4. Flag deviations that affect usability or acceptance criteria.
5. Record results in `.agent/qa/` or `.agent/design/`.

Output:
- Pass/fail summary
- UX issues by severity
- Required fixes
- Non-blocking improvements


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
