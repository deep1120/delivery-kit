# Workflow

## Standard feature workflow

```text
/idea-intake
/draft-prd
/split-work
/shape-ui        # if UI work
/map-implementation
/build-story
/diff-review
/acceptance-check
/browser-check   # if UI or critical flow
/prep-pr
/release-gate    # if needed
/docs-refresh    # if behavior/docs changed
/retrospect
```

## Bug fix workflow

```text
/route-task
/debug-pass
/build-story
/diff-review
/acceptance-check
/prep-pr
```

## Protected workflow

```text
/route-task
/risk-review
/map-implementation
/edit-boundary
/build-story
/diff-review
/acceptance-check
/release-gate
/deploy-check
```

## Handoff standard

Every handoff should include:

- Current goal
- Relevant artifact path
- What changed
- Evidence
- Risks/blockers
- Recommended next skill
