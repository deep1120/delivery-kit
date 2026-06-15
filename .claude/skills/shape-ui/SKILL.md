---
name: shape-ui
description: Define UI flow, states, accessibility, copy, and component behavior.
---

# /shape-ui

Primary agent: `designer`


Use this for frontend or user-facing workflow changes.

Steps:
1. Read the story and PRD.
2. Identify screens, components, and states.
3. Define loading, empty, error, success, disabled, and responsive behavior.
4. Include accessibility notes.
5. Write `.agent/design/<story>-ui.md`.

Output:
- User flow
- Screen/component list
- States
- Form/copy rules
- Accessibility requirements
- Open design questions


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
