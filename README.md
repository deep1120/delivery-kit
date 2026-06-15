# Delivery Kit

Delivery Kit is a reusable Claude Code operating framework for moving work from **idea → product scope → design → implementation → review → QA → release → learning**.

It is designed to live in its **own repo** and be installed into one or more product repositories. The goal is to give every product repo the same disciplined AI-assisted delivery process without forcing every coding session to load a giant prompt.

---

## What this repo gives you

This kit contains:

```text
15 focused agents
28 task-specific skills
A durable .agent/ state system
Install, sync, and status scripts
GitHub issue and PR templates
CI starter workflow
Browser-check helper
Product, design, engineering, QA, release, and security templates
Token-efficiency rules and context budgets
Safety rails for risky edits
```

The system is intentionally **artifact-first**. Agents do not pass long chat transcripts back and forth. Each workflow writes a compact artifact under `.agent/`, and the next workflow reads that artifact.

---

## Why keep this as its own repo?

You already have an app repo. This kit should stay separate because it is your reusable **delivery operating system**, not your product code.

Recommended model:

```text
delivery-kit/     # source of truth for agents, skills, templates, process
my-app-repo/             # your actual application code
another-app-repo/        # another codebase that can reuse the same system
```

You maintain the delivery rules once, then install or sync them into each app repo.

---

## How it works at a high level

The kit creates a lightweight AI delivery squad:

| Area | Agent(s) | Output |
|---|---|---|
| Intake and routing | `delivery-manager`, `context-curator` | Task route, lane, assumptions, needed artifacts |
| Product | `product-manager` | PRD, use cases, epics, stories, acceptance criteria |
| Design | `designer` | User flow, UI states, accessibility, component notes |
| Technical planning | `tech-lead` | Implementation map, file map, test plan, risk map |
| Build | `engineer` | Code, tests, validation evidence |
| Review | `code-reviewer`, `devex-reviewer` | Actionable PR findings, maintainability risks |
| QA | `qa-tester`, `browser-qa` | Acceptance report, browser evidence, bugs |
| Risk | `security-reviewer`, `performance-engineer`, `observability-engineer` | Security, performance, logging, monitoring checks |
| Release | `release-manager`, `docs-maintainer` | Release gate, deploy verification, docs refresh |
| Learning | `context-curator`, `delivery-manager` | Lessons, retrospectives, reusable project memory |

The default delivery path is:

```text
Intake → Route → Specify → Shape → Map → Build → Verify → Release → Learn
```

---

## Lanes: fast, standard, protected

Not every change deserves the same amount of ceremony. The `/route-task` skill chooses one of three lanes:

### Fast lane

Use for small, low-risk changes:

```text
copy change
small UI polish
minor bug fix
simple test update
documentation tweak
```

Typical path:

```text
/route-task → /build-story → /diff-review → /prep-pr
```

### Standard lane

Use for normal product work:

```text
new feature
meaningful UI change
API addition
workflow change
multi-file implementation
```

Typical path:

```text
/idea-intake → /draft-prd → /split-work → /map-implementation → /build-story → /diff-review → /acceptance-check → /prep-pr
```

### Protected lane

Use for high-risk work:

```text
auth
permissions
billing
PII or user data
database migrations
production deploys
data deletion
security-sensitive flows
performance-sensitive infrastructure
```

Typical path:

```text
/idea-intake → /draft-prd → /split-work → /map-implementation → /risk-review → /build-story → /diff-review → /acceptance-check → /browser-check → /release-gate → /deploy-check
```

This is one of the main efficiency improvements: deep review is used when it matters, not by default for every small change.

---

## Repo layout

```text
.
├── README.md
├── VERSION
├── CLAUDE.shared.md
├── AGENTS.md
├── .claude/
│   ├── agents/
│   │   ├── product-manager.md
│   │   ├── designer.md
│   │   ├── tech-lead.md
│   │   ├── engineer.md
│   │   ├── code-reviewer.md
│   │   ├── qa-tester.md
│   │   ├── browser-qa.md
│   │   ├── security-reviewer.md
│   │   ├── release-manager.md
│   │   └── ...
│   └── skills/
│       ├── idea-intake/SKILL.md
│       ├── route-task/SKILL.md
│       ├── draft-prd/SKILL.md
│       ├── split-work/SKILL.md
│       ├── shape-ui/SKILL.md
│       ├── map-implementation/SKILL.md
│       ├── build-story/SKILL.md
│       ├── diff-review/SKILL.md
│       ├── acceptance-check/SKILL.md
│       ├── browser-check/SKILL.md
│       ├── risk-review/SKILL.md
│       ├── release-gate/SKILL.md
│       └── ...
├── .agent/
│   └── templates/
│       ├── current.md
│       ├── decisions.md
│       └── lessons.md
├── docs/
│   ├── agent-team/
│   │   ├── architecture.md
│   │   ├── workflow.md
│   │   ├── token-efficiency.md
│   │   ├── efficiency-notes.md
│   │   ├── safety.md
│   │   └── differentiators.md
│   ├── product/
│   ├── design/
│   ├── engineering/
│   └── qa/
├── templates/
│   └── github/
│       ├── ISSUE_TEMPLATE/
│       ├── PULL_REQUEST_TEMPLATE.md
│       └── workflows/ci.yml
├── scripts/
│   ├── install-into-app-repo.sh
│   ├── sync-into-app-repo.sh
│   ├── agent-team-status.sh
│   └── browser-check.mjs
└── bin/
    ├── agent-team-install
    ├── agent-team-sync
    └── agent-team-status
```

---

## Installation into your app repo

### Option A: Git submodule, recommended

From your app repo:

```bash
git submodule add git@github.com:YOUR_ORG/delivery-kit.git tools/delivery-kit
./tools/delivery-kit/scripts/install-into-app-repo.sh .
```

This keeps the kit separate while making it easy to sync updates.

### Option B: Clone under `tools/`

```bash
mkdir -p tools
git clone git@github.com:YOUR_ORG/delivery-kit.git tools/delivery-kit
./tools/delivery-kit/scripts/install-into-app-repo.sh .
```

### Option C: Copy once

Download or copy the kit, then run:

```bash
/path/to/delivery-kit/scripts/install-into-app-repo.sh /path/to/my-app-repo
```

---

## What the installer adds to your app repo

The installer creates or updates:

```text
CLAUDE.md
.claude/agents/
.claude/skills/
.agent/
docs/agent-playbook/
.github/PULL_REQUEST_TEMPLATE.md
.github/ISSUE_TEMPLATE/feature.yml
.github/ISSUE_TEMPLATE/bug.yml
.github/workflows/ci.yml
```

The generated `CLAUDE.md` imports the shared rules:

```md
@docs/agent-playbook/CLAUDE.shared.md
```

Then it gives you a place to add app-specific instructions:

```md
## Project-specific commands
- Install:
- Run app:
- Test:
- Typecheck:
- Lint:
- Build:

## Architecture notes
- Frontend:
- Backend:
- Database:
- Auth:
- Deployment:
```

Fill this in immediately after install. This is how the agent learns the commands and constraints for your actual repo.

---

## Daily usage examples

### Turn a vague idea into a scoped plan

```text
Use /idea-intake for this idea: [paste idea]. Ask only the questions needed to remove product risk, then write the discovery artifact.
```

Then:

```text
Use /draft-prd based on .agent/current.md and the discovery notes. Keep it MVP-focused.
```

Then:

```text
Use /split-work to create small buildable stories with acceptance criteria.
```

### Implement one story

```text
Use /map-implementation for .agent/stories/STORY-001.md. Identify relevant files, tests, risks, and the smallest safe implementation plan.
```

Then:

```text
Use /build-story for STORY-001. Stay within the implementation map, update tests, and record commands run.
```

Then:

```text
Use /diff-review to review the current git diff against STORY-001.
```

Then:

```text
Use /acceptance-check to validate STORY-001 against its acceptance criteria.
```

### UI feature flow

```text
/shape-ui → /map-implementation → /build-story → /ux-check → /browser-check → /acceptance-check
```

### Risky feature flow

```text
/route-task → /risk-review → /map-implementation → /build-story → /diff-review → /acceptance-check → /release-gate
```

### Release flow

```text
/prep-pr → /release-gate → /deploy-check → /docs-refresh → /retrospect
```

---

## Skill catalog

| Skill | Purpose |
|---|---|
| `/idea-intake` | Clarify a rough idea and define the first useful scope |
| `/route-task` | Choose fast, standard, or protected lane |
| `/draft-prd` | Create a concise PRD artifact |
| `/split-work` | Convert a PRD into small stories |
| `/shape-ui` | Define user flow, UI states, accessibility, and component needs |
| `/ux-check` | Review UI implementation against design intent |
| `/map-implementation` | Create technical plan, file map, risk map, and test plan |
| `/build-story` | Implement one approved story |
| `/debug-pass` | Diagnose a failing test, bug, or runtime issue |
| `/diff-review` | Review current changes for correctness and maintainability |
| `/acceptance-check` | Validate acceptance criteria and record QA results |
| `/browser-check` | Exercise browser/UI flows and capture evidence |
| `/risk-review` | Review security, privacy, auth, data, and abuse risks |
| `/perf-review` | Check performance-sensitive changes |
| `/metric-check` | Confirm logging, metrics, alerts, and observability |
| `/prep-pr` | Prepare PR summary, evidence, and release notes |
| `/release-gate` | Decide whether the work is safe to merge or ship |
| `/deploy-check` | Verify deployment, smoke tests, rollback, and monitoring |
| `/rollout-check` | Plan staged rollout or feature flag validation |
| `/docs-refresh` | Update docs affected by the change |
| `/edit-boundary` | Define allowed files and blocked areas before risky edits |
| `/safe-change` | Apply extra caution for destructive or broad changes |
| `/scope-lock` | Freeze scope after approval |
| `/scope-unlock` | Reopen scope with recorded reason |
| `/context-pack` | Save compact restart context |
| `/context-load` | Restore context from `.agent/context/` |
| `/capture-learning` | Save a reusable lesson or project rule |
| `/retrospect` | Review completed work and improve the workflow |

---

## Artifact system

The installed `.agent/` directory is the memory layer for active work.

```text
.agent/current.md              Active task, lane, owner, assumptions, blockers
.agent/decisions.md            Durable product and architecture decisions
.agent/lessons.md              Reusable lessons from completed work
.agent/product/                PRDs and discovery notes
.agent/stories/                Story artifacts and acceptance criteria
.agent/design/                 UI specs, wireframes, UX decisions
.agent/plans/                  Implementation maps and file maps
.agent/qa/                     QA reports, browser evidence, bugs
.agent/security/               Risk reviews and approvals
.agent/performance/            Performance review notes
.agent/release/                PR prep, release gates, deploy checks
.agent/retrospectives/         Retrospective summaries
.agent/context/                Compact restart summaries
.agent/browser-artifacts/      Screenshots, traces, browser evidence
```

A typical story produces:

```text
.agent/stories/STORY-001.md
.agent/design/STORY-001-ui.md           # if UI work
.agent/plans/STORY-001-plan.md
.agent/qa/STORY-001-qa.md
.agent/release/STORY-001-pr.md
.agent/context/STORY-001-context.md
```

This reduces token usage because the agent can read the compact story/plan/QA files instead of reconstructing the work from a long conversation.

---

## Token-efficiency model

This kit is optimized for high quality without excessive context use.

### 1. Small root instructions

`CLAUDE.shared.md` is intentionally short. It defines universal rules and routing, but does not include every checklist.

### 2. Skills load only when needed

Each workflow lives in its own `SKILL.md`. Product work does not load release instructions. Release work does not load design instructions.

### 3. Agents are narrow

Each agent has a specific job and output format. Narrow agents reduce repeated explanations and prevent cross-role drift.

### 4. Artifacts beat transcripts

The agent writes handoff files under `.agent/`. The next step reads the artifact, not the entire conversation.

### 5. Route before depth

`/route-task` chooses fast, standard, or protected lane. This prevents running heavyweight security, browser, release, and performance checks on low-risk changes.

### 6. Focused repository reads

Agents are instructed to use targeted search, `git diff --stat`, and focused file reads before opening large files.

### 7. Output caps

Defaults:

```text
Clarifying questions: max 5
Implementation plan: max 12 bullets
Handoff summary: under 250 words
Review findings: only actionable P0/P1/P2 issues
QA report: one row per acceptance criterion
```

### 8. Quality gates stay intact

Efficiency comes from skipping repeated context, not skipping validation. The system still enforces:

```text
Definition of Ready
Definition of Done
acceptance-criteria QA
browser checks for UI
risk review for protected changes
release gate before shipping
human approval for high-risk decisions
```

See `docs/agent-team/token-efficiency.md` and `docs/agent-team/efficiency-notes.md` for more detail.

---

## Safety model

Agents must not:

```text
ship without passing checks or an explicit human waiver
expand scope without approval
refactor unrelated code
add dependencies without approval
touch secrets, auth, billing, migrations, deploy config, or data deletion without deeper review
hide failing tests or claim unrun tests passed
force-push, delete branches, or run destructive commands without explicit approval
```

Protected areas should be declared in your app repo’s `CLAUDE.md`:

```md
## Protected areas
- Auth:
- Billing:
- Database migrations:
- Deployment config:
- Secrets/config:
- Tenant/account boundaries:
```

Use `/edit-boundary` and `/safe-change` before broad or sensitive edits.

---

## Browser validation

`/browser-check` should use your app’s existing tooling first:

```text
Playwright
Cypress
Storybook
existing E2E scripts
manual browser instructions
```

The kit includes an optional helper:

```bash
node scripts/browser-check.mjs http://localhost:3000
```

If Playwright is installed, it opens the page, captures title, URL, console errors, and a screenshot. If Playwright is not installed, it prints setup guidance instead of pretending the check passed.

---

## GitHub workflow

The included templates encourage a clean issue → branch → PR flow.

Recommended labels:

```text
lane:fast
lane:standard
lane:protected
needs:product
needs:design
needs:tech-plan
needs:qa
needs:risk-review
ready:build
ready:review
ready:release
blocked
```

Recommended branch naming:

```text
feature/STORY-001-short-name
fix/STORY-002-short-name
chore/STORY-003-short-name
```

Recommended PR flow:

```text
1. Link story artifact
2. Summarize implementation
3. Include test evidence
4. Include screenshots for UI
5. Record known risks
6. Run /diff-review
7. Run /acceptance-check
8. Run /release-gate if needed
```

---

## Updating an app repo after kit changes

If you installed as a submodule:

```bash
cd my-app-repo/tools/delivery-kit
git pull
cd ../..
./tools/delivery-kit/scripts/sync-into-app-repo.sh .
```

Check status:

```bash
./tools/delivery-kit/scripts/agent-team-status.sh .
```

The sync script updates shared agents, skills, templates, and docs. It does **not** overwrite your app-specific `CLAUDE.md` by default.

---

## Customization checklist

After installing into an app repo, update:

```text
CLAUDE.md
.github/workflows/ci.yml
.agent/current.md
docs/agent-playbook/CLAUDE.shared.md only through sync, not manually
```

At minimum, fill in:

```md
## Project-specific commands
- Install:
- Run app:
- Test:
- Typecheck:
- Lint:
- Build:

## Repo-specific quality gates
- Minimum test requirement:
- Coverage expectation:
- PR approval requirement:

## Protected areas
- Auth:
- Data deletion:
- Billing:
- Migrations:
- Deployment:
```

---

## How this is more efficient than a generic multi-agent setup

Most multi-agent setups become slow because every agent gets too much context and every task follows the same heavy process. This kit avoids that by:

```text
routing before execution
using lanes instead of one universal process
keeping root instructions small
splitting workflows into task-specific skills
using durable artifacts instead of chat history
making agents narrow and output-constrained
running deep gates only for risk-triggered work
requiring explicit evidence for tests and QA
```

The result is lower token usage, fewer repeated explanations, less rework, and better quality control.

---

## Troubleshooting

### The agent is reading too much

Use `/context-pack` and ask the agent to continue from `.agent/context/...` instead of the full conversation.

### The agent starts coding too early

Run `/route-task`, `/draft-prd`, or `/map-implementation` first. Also tighten the generated `CLAUDE.md` Definition of Ready.

### The agent changes unrelated files

Run `/edit-boundary` before implementation and add protected directories to `CLAUDE.md`.

### QA is too generic

Make sure the story has specific acceptance criteria. `/acceptance-check` is only as good as the acceptance criteria it validates.

### Browser checks do not run

Install or configure your actual browser test tooling. The included helper is intentionally minimal and does not replace real E2E tests.

### The process feels too heavy

Use `/route-task` and pick fast lane. You do not need PRD/design/release workflows for tiny changes.

---

## Recommended first week rollout

Day 1:

```text
Install kit
Fill in app CLAUDE.md
Run /route-task on one small issue
```

Day 2:

```text
Use /map-implementation and /build-story for one story
Run /diff-review before PR
```

Day 3:

```text
Use /acceptance-check and /prep-pr
Adjust templates based on friction
```

Day 4:

```text
Try /shape-ui and /browser-check on a UI change
```

Day 5:

```text
Run /retrospect
Promote useful lessons into .agent/lessons.md or CLAUDE.md
```

---

## Design philosophy

This kit is not trying to make agents autonomous at all costs. It is trying to make them **useful, bounded, and efficient**.

Principles:

```text
Small stories beat large vague tasks.
Artifacts beat long conversations.
Routing beats one-size-fits-all process.
Focused agents beat general-purpose agents.
Evidence beats confidence.
Quality gates beat trust-me summaries.
Human approval belongs at product, risk, and release boundaries.
```
