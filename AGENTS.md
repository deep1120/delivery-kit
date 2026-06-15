# Agent Index

Delivery Kit uses focused agents rather than one large general-purpose prompt. Each agent has a narrow responsibility, clear inputs, and a compact output format.

## Core delivery agents

- `delivery-manager` — routes work, chooses lane, manages handoffs, detects blockers.
- `product-manager` — clarifies ideas, writes PRDs, identifies use cases, splits epics/stories.
- `designer` — defines UX flows, UI states, accessibility requirements, and component behavior.
- `tech-lead` — maps implementation, data/API impact, testing strategy, and technical risk.
- `engineer` — implements one approved story, updates tests, and records validation.
- `code-reviewer` — reviews diffs for correctness, maintainability, tests, and scope creep.
- `qa-tester` — validates acceptance criteria, edge cases, error states, and regressions.
- `browser-qa` — performs browser/UI validation and captures evidence.

## Risk and release agents

- `security-reviewer` — reviews auth, permissions, data exposure, secrets, and abuse cases.
- `performance-engineer` — checks performance risks and regression signals.
- `observability-engineer` — checks logs, metrics, alerts, dashboards, and rollback visibility.
- `release-manager` — validates PR readiness, release gates, deploy checks, and rollback plans.
- `docs-maintainer` — updates stale docs, changelogs, and operational notes.

## Efficiency agents

- `context-curator` — compresses context into reusable `.agent/context/` artifacts.
- `devex-reviewer` — reviews developer experience, commands, setup friction, and maintainability.

## Usage pattern

Use agents through skills. Example:

```text
Use /route-task to choose the lane.
Use /map-implementation with the tech-lead agent.
Use /build-story with the engineer agent.
Use /acceptance-check with the qa-tester agent.
```

Agents should write artifacts rather than relying on conversation history.
