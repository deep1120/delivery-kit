---
name: prep-pr
description: Prepare PR summary, test evidence, screenshots, and release notes.
---

# /prep-pr

Primary agent: `release-manager`


Use this before opening or finalizing a PR.

Steps:
1. Read story, implementation summary, review findings, and QA results.
2. Draft PR body using the repo template.
3. Include tests run, screenshots for UI, risks, and rollout notes.
4. Write `.agent/release/<story>-pr.md`.

Do not hide failing checks.


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
