---
name: retrospect
description: Review completed work and improve the process.
---

# /retrospect

Primary agent: `delivery-manager`


Use this after a feature, incident, or sprint.

Review:
- What worked
- What caused rework
- Missed requirements
- Test gaps
- Token/context waste
- Agent/process improvements

Write `.agent/retrospectives/<date>-<topic>.md` and update `.agent/lessons.md` if useful.


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
