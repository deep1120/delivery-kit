---
name: route-task
description: Choose the leanest safe lane and next workflow step.
---

# /route-task

Primary agent: `delivery-manager`


Use this before starting work or when the next step is unclear.

Steps:
1. Classify risk and complexity.
2. Choose fast, standard, or protected lane.
3. Identify missing artifacts.
4. Select the next skill.
5. Update `.agent/current.md`.

Lane rules:
- Fast: small and low risk.
- Standard: normal feature/bug work.
- Protected: auth, data, billing, migrations, permissions, security, production deploy, or irreversible changes.

Output:
- Lane
- Reason
- Required artifacts
- Next skill
- Approval needed, if any


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
