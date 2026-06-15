---
name: context-load
description: Restore context from a compact artifact.
---

# /context-load

Primary agent: `context-curator`


Use this at the start of a new Claude session.

Steps:
1. Read the requested `.agent/context/` artifact.
2. Read only linked artifacts that are needed.
3. Summarize current state and next action.
4. Avoid re-reading broad history unless necessary.


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
