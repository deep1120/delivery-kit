---
name: rollout-check
description: Plan or verify staged rollout, feature flags, and canary behavior.
---

# /rollout-check

Primary agent: `release-manager`


Use this for gradual rollout or feature-flagged releases.

Check:
- Flag default state
- Target cohort
- Rollout percentage
- Kill switch
- Metrics to watch
- Rollback trigger

Output rollout plan or rollout verification.


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
