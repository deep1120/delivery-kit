---
name: safe-change
description: Apply extra caution for destructive or broad changes.
---

# /safe-change

Primary agent: `delivery-manager`


Use this before changes involving deletion, migration, secrets, production config, auth, billing, or large refactors.

Steps:
1. Identify destructive operations.
2. Require explicit approval before proceeding.
3. Confirm backup/rollback path.
4. Record decision in `.agent/decisions.md`.


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
