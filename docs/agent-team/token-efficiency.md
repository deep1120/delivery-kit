# Token Efficiency

This kit improves token efficiency without reducing quality by reducing repeated context, not by skipping quality gates.

## Practices

1. **Route before executing** — run `/route-task` to avoid unnecessary workflows.
2. **Use artifacts** — read `.agent/` summaries before source files.
3. **Keep agents narrow** — one role, one job, one output format.
4. **Use focused search** — prefer `rg`, `git diff --stat`, and direct file reads.
5. **Cap outputs** — concise plans, QA tables, and review findings.
6. **Escalate only by risk** — protected gates for protected changes.
7. **Save restart context** — use `/context-pack` before ending a session.

## Context levels

- L0: active task and route
- L1: story, acceptance criteria, implementation map
- L2: relevant files, tests, and diff
- L3: risk/security/performance context
- L4: release/deploy evidence

Use the lowest level that can safely complete the task.
