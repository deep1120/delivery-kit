---
name: release-gate
description: Make go/no-go release decision.
---

# /release-gate

Primary agent: `release-manager`


Use this before merge or release.

Check:
- Acceptance criteria complete
- Tests/CI status
- QA status
- Risk/security/performance gates
- Docs/release notes
- Rollback plan
- Human approvals for protected work

Output:
- Go / no-go
- Blockers
- Required fixes
- Rollback plan
- Post-release checks


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
