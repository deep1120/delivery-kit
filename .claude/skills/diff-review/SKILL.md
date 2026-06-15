---
name: diff-review
description: Review the current diff for correctness, scope, tests, and maintainability.
---

# /diff-review

Primary agent: `code-reviewer`


Use this before opening or merging a PR.

Steps:
1. Run or inspect `git diff --stat` and focused diffs.
2. Compare changes to story and acceptance criteria.
3. Check tests and error handling.
4. Flag scope creep and risky changes.
5. Output only actionable P0/P1/P2 findings.

Do not nitpick style unless it creates real risk.


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
