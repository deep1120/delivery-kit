---
name: deploy-check
description: Verify deployment, smoke tests, rollback, and monitoring.
---

# /deploy-check

Primary agent: `release-manager`


Use this after merge or during deploy.

Steps:
1. Confirm deploy target and version.
2. Verify smoke checks.
3. Check known critical flows.
4. Confirm monitoring and rollback path.
5. Record deploy evidence in `.agent/release/`.

Do not claim production verification without evidence.


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
