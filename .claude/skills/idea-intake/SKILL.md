---
name: idea-intake
description: Clarify a vague idea and define the first useful scope.
---

# /idea-intake

Primary agent: `product-manager`


Use this when the request is an idea, feature concept, rough PRD, or ambiguous product ask.

Steps:
1. Read `.agent/current.md` if present.
2. Ask up to 5 clarifying questions only if they materially affect scope.
3. Identify user, problem, value, core flow, edge cases, non-goals, and success metric.
4. Write a concise discovery artifact to `.agent/product/`.
5. Update `.agent/current.md` with assumptions and next step.

Output:
- Scope summary
- Clarifying questions or assumptions
- Recommended lane: fast, standard, or protected
- Next skill to run


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
