# Architecture

Delivery Kit separates process from product code.

## Layers

1. **Shared rules** — `CLAUDE.shared.md` contains compact universal delivery rules.
2. **Agents** — `.claude/agents/` contains focused role definitions.
3. **Skills** — `.claude/skills/` contains task-specific workflows.
4. **Artifacts** — `.agent/` stores durable state and handoffs.
5. **App-specific instructions** — the app repo's `CLAUDE.md` contains commands, architecture notes, and protected areas.

## Why this structure is efficient

Claude starts from a small root instruction file, then loads only the role and workflow needed for the current task. Work is handed off through compact files rather than long chat history.

## Control flow

```text
User request
→ /route-task
→ lane selection
→ required skill
→ artifact written
→ next skill reads artifact
→ PR/QA/release evidence recorded
```

## Source of truth

- This repo is the source of truth for reusable agents, skills, docs, and templates.
- The app repo is the source of truth for product code, commands, architecture, and current work artifacts.
