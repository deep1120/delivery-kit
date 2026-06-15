---
name: scope-unlock
description: Reopen scope with recorded reason and approval.
---

# /scope-unlock

Primary agent: `delivery-manager`


Use this when scope must change after approval.

Record:
- Requested change
- Reason
- Impact on timeline/risk/tests
- Approval owner
- Updated next step


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
