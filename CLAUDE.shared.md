# Shared Delivery Rules

Use these rules as the lightweight coordination layer for product, design, engineering, QA, security, release, documentation, and learning.

## Delivery path

Intake → route → specify → shape → map → build → verify → release → learn.

## Universal rules

- Do not code from vague requirements. Ask up to 5 scope-changing questions, then proceed with stated assumptions if still blocked.
- Work on one story at a time unless explicitly planning an epic.
- Keep changes scoped to the active story.
- Prefer existing patterns, dependencies, tests, and scripts.
- Before editing, use targeted search to identify relevant files; do not scan the whole repo by default.
- Validate in layers: focused tests first, then broader checks when needed.
- Summarize artifacts and facts; avoid pasting long files or logs unless directly necessary.
- Record durable decisions in `.agent/decisions.md` or the relevant story/plan/QA artifact.
- Treat secrets, auth, billing, tenant boundaries, migrations, permissions, production deploys, and data deletion as high-risk.
- Do not claim tests, builds, browser checks, or deploy checks passed unless they were actually run and evidence is recorded.

## Token budget defaults

- First response: 5 bullets or fewer unless the user asks for depth.
- Clarifying questions: max 5.
- Implementation plans: max 12 bullets unless the change is high-risk.
- Handoffs: under 250 words when possible.
- Read `.agent/` artifacts before source files.
- Use `rg`, `git diff --stat`, `git diff --name-only`, and focused reads before broad exploration.
- Store restart context in `.agent/context/`; do not make future agents reconstruct work from chat history.
- Use deep mode only for architecture, security, migrations, production incidents, ambiguous requirements, or release decisions.

## Artifact locations

```text
.agent/current.md              Active task, route, assumptions, and blockers
.agent/decisions.md            Durable product/architecture decisions
.agent/lessons.md              Reusable project lessons
.agent/stories/                Story artifacts and acceptance criteria
.agent/product/                PRDs and discovery notes
.agent/design/                 UI specs and design QA notes
.agent/plans/                  Implementation plans and file maps
.agent/qa/                     QA reports and browser evidence
.agent/security/               Risk reviews and approvals
.agent/performance/            Performance review notes
.agent/release/                PR/release/deploy checklists
.agent/retrospectives/         Retrospectives and process improvements
.agent/context/                Compact restart summaries
.agent/browser-artifacts/      Screenshots, traces, and browser validation evidence
```

## Definition of Ready

A story is ready for engineering when it has:

- User goal
- Business value
- Acceptance criteria
- Edge cases
- Dependencies
- Out-of-scope notes
- UI notes when relevant
- Test expectations

## Definition of Done

A story is done when:

- Acceptance criteria are met
- Tests are added or updated where appropriate
- Required validations pass or failures are clearly explained
- QA is recorded
- Docs/release notes are updated when needed
- No high-risk blocker remains

## Lanes

- **Fast lane:** small, low-risk change. Use minimal planning and validation.
- **Standard lane:** normal feature or bug work. Use story, implementation map, review, and QA.
- **Protected lane:** auth, data, billing, migrations, production, permissions, or security-sensitive work. Use risk, release, and human approval gates.

## Skill routing

- Vague idea: `/idea-intake`
- Choose workflow: `/route-task`
- Product spec: `/draft-prd`, then `/split-work`
- UI feature: `/shape-ui`, then `/ux-check`
- Engineering: `/map-implementation`, then `/build-story`
- Debugging: `/debug-pass`
- Diff/PR quality: `/diff-review`
- Acceptance validation: `/acceptance-check`
- Browser validation: `/browser-check`
- Auth/data/security: `/risk-review`
- Performance-sensitive work: `/perf-review`
- Observability: `/metric-check`
- PR preparation: `/prep-pr`
- Release decision: `/release-gate`, then `/deploy-check`
- Rollout: `/rollout-check`
- Docs: `/docs-refresh`
- Context restart: `/context-pack` and `/context-load`
- Learning loop: `/retrospect` or `/capture-learning`

## Safety

Do not run destructive commands, delete data, rotate secrets, force-push, rewrite migrations, modify production configuration, or merge/deploy without explicit approval and recorded evidence.
