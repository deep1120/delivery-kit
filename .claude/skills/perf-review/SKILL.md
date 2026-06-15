---
name: perf-review
description: Review performance-sensitive changes for regressions.
---

# /perf-review

Primary agent: `performance-engineer`


Use this when a change affects data loading, rendering, queries, background jobs, or high-traffic paths.

Steps:
1. Identify performance-sensitive paths.
2. Check query/load patterns and client payloads.
3. Look for avoidable recomputation or waterfall risk.
4. Record measurable evidence when possible.

Output concise blockers and recommended fixes.


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
