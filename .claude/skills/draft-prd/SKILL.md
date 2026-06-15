---
name: draft-prd
description: Write a concise product requirements artifact.
---

# /draft-prd

Primary agent: `product-manager`


Use this after intake or when a feature needs product definition.

Steps:
1. Read discovery notes and `.agent/current.md`.
2. Define problem, users, goals, non-goals, use cases, edge cases, success metric, and risks.
3. Keep MVP scope explicit.
4. Write to `.agent/product/<feature>-prd.md`.

Output sections:
- Summary
- Users
- Problem
- Goals
- Non-goals
- User flows
- Edge cases
- Success metrics
- Risks and assumptions
- Open questions


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
