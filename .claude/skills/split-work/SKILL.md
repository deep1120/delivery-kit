---
name: split-work
description: Convert a PRD into small buildable stories.
---

# /split-work

Primary agent: `product-manager`


Use this when requirements need to become engineering-ready stories.

Steps:
1. Read the PRD.
2. Identify epics and sequencing.
3. Create small stories that can be implemented independently.
4. Add acceptance criteria and test expectations.
5. Write each story to `.agent/stories/`.

Story requirements:
- User goal
- Business value
- Acceptance criteria
- Edge cases
- Dependencies
- Out-of-scope notes
- Test expectations


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
