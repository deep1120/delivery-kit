---
name: risk-review
description: Review security, privacy, auth, permissions, and protected-change risks.
---

# /risk-review

Primary agent: `security-reviewer`


Use this for protected lane work.

Triggers:
- Auth, roles, permissions
- PII or sensitive data
- Billing/payments
- Migrations or data deletion
- Tenant boundaries
- Secrets or production config

Output:
- Risk summary
- Exploit/failure scenario
- Severity
- Required mitigation
- Approval/block decision


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
