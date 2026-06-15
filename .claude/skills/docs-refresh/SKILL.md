---
name: docs-refresh
description: Update docs affected by the change.
---

# /docs-refresh

Primary agent: `docs-maintainer`


Use this before or after release when behavior, setup, APIs, architecture, or operations changed.

Steps:
1. Inspect changed files and PR summary.
2. Identify stale docs.
3. Update only relevant docs.
4. Record docs updated in `.agent/release/`.


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
