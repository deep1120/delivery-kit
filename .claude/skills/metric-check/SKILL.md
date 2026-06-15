---
name: metric-check
description: Confirm logs, metrics, alerts, and debugging visibility.
---

# /metric-check

Primary agent: `observability-engineer`


Use this before release for production-impacting changes.

Check:
- Failure logs
- Success/error metrics
- Alert coverage
- Dashboard or trace visibility
- Rollback signal

Output:
- Observable events
- Missing instrumentation
- Release blockers


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
