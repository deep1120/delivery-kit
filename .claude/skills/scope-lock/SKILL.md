---
name: scope-lock
description: Freeze approved scope to prevent drift.
---

# /scope-lock

Primary agent: `delivery-manager`


Use this once product/design/technical scope is approved.

Record:
- Approved scope
- Non-goals
- Allowed changes
- What requires re-approval

Update `.agent/current.md`.


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
