---
name: edit-boundary
description: Define allowed files and blocked areas before risky edits.
---

# /edit-boundary

Primary agent: `delivery-manager`


Use this before broad or sensitive implementation.

Output:
- Allowed files/directories
- Blocked files/directories
- Requires approval before touching
- Reason for boundary

Record in `.agent/current.md`.


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
