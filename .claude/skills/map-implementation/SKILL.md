---
name: map-implementation
description: Create the technical plan, file map, risk map, and test plan.
---

# /map-implementation

Primary agent: `tech-lead`


Use this before implementation for standard or protected work.

Steps:
1. Read story, acceptance criteria, design spec, and relevant decisions.
2. Use targeted search to inspect relevant code.
3. Identify files/modules likely to change.
4. Define implementation sequence.
5. Define tests and validations.
6. Flag protected-risk areas.
7. Write `.agent/plans/<story>-plan.md`.

Keep the plan concise unless high-risk.


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
