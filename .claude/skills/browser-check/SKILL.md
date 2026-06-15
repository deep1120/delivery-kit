---
name: browser-check
description: Exercise browser/UI flows and capture evidence.
---

# /browser-check

Primary agent: `browser-qa`


Use this for UI changes or flows that need browser validation.

Steps:
1. Identify the URL, environment, user role, and target flow.
2. Prefer existing E2E tooling.
3. Capture console errors, screenshots, and reproduction steps.
4. Record evidence under `.agent/qa/` and `.agent/browser-artifacts/`.

Never claim browser validation passed unless it actually ran.


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
