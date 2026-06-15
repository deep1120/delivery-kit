#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-}"
if [[ -z "$APP_DIR" ]]; then
  echo "Usage: $0 /path/to/app-repo"
  exit 1
fi

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APP_DIR="$(cd "$APP_DIR" && pwd)"
VERSION="$(cat "$KIT_DIR/VERSION" 2>/dev/null || echo unknown)"

echo "Installing Delivery Kit $VERSION into $APP_DIR"

mkdir -p "$APP_DIR/.claude" "$APP_DIR/.agent" "$APP_DIR/docs/agent-playbook" "$APP_DIR/.github"

# Copy project agent assets.
rm -rf "$APP_DIR/.claude/agents" "$APP_DIR/.claude/skills"
cp -R "$KIT_DIR/.claude/agents" "$APP_DIR/.claude/agents"
cp -R "$KIT_DIR/.claude/skills" "$APP_DIR/.claude/skills"

# Copy docs and templates.
rm -rf "$APP_DIR/docs/agent-playbook"
mkdir -p "$APP_DIR/docs/agent-playbook"
cp "$KIT_DIR/CLAUDE.shared.md" "$APP_DIR/docs/agent-playbook/CLAUDE.shared.md"
cp "$KIT_DIR/AGENTS.md" "$APP_DIR/docs/agent-playbook/AGENTS.md"
cp -R "$KIT_DIR/docs/agent-team" "$APP_DIR/docs/agent-playbook/agent-team"

# Copy GitHub templates without deleting existing custom workflows.
mkdir -p "$APP_DIR/.github/ISSUE_TEMPLATE" "$APP_DIR/.github/workflows"
cp "$KIT_DIR/templates/github/PULL_REQUEST_TEMPLATE.md" "$APP_DIR/.github/PULL_REQUEST_TEMPLATE.md"
cp "$KIT_DIR/templates/github/ISSUE_TEMPLATE/feature.yml" "$APP_DIR/.github/ISSUE_TEMPLATE/feature.yml"
cp "$KIT_DIR/templates/github/ISSUE_TEMPLATE/bug.yml" "$APP_DIR/.github/ISSUE_TEMPLATE/bug.yml"
if [[ ! -f "$APP_DIR/.github/workflows/ci.yml" ]]; then
  cp "$KIT_DIR/templates/github/workflows/ci.yml" "$APP_DIR/.github/workflows/ci.yml"
fi

# Create .agent directories.
mkdir -p "$APP_DIR/.agent/product" "$APP_DIR/.agent/stories" "$APP_DIR/.agent/design" "$APP_DIR/.agent/plans" "$APP_DIR/.agent/qa" "$APP_DIR/.agent/security" "$APP_DIR/.agent/performance" "$APP_DIR/.agent/release" "$APP_DIR/.agent/retrospectives" "$APP_DIR/.agent/context" "$APP_DIR/.agent/browser-artifacts"

[[ -f "$APP_DIR/.agent/current.md" ]] || cp "$KIT_DIR/.agent/templates/current.md" "$APP_DIR/.agent/current.md"
[[ -f "$APP_DIR/.agent/decisions.md" ]] || cp "$KIT_DIR/.agent/templates/decisions.md" "$APP_DIR/.agent/decisions.md"
[[ -f "$APP_DIR/.agent/lessons.md" ]] || cp "$KIT_DIR/.agent/templates/lessons.md" "$APP_DIR/.agent/lessons.md"
echo "$VERSION" > "$APP_DIR/.agent/playbook-version"

# Create CLAUDE.md only if it does not exist. Preserve app-specific customizations.
if [[ ! -f "$APP_DIR/CLAUDE.md" ]]; then
  cat > "$APP_DIR/CLAUDE.md" <<'EOF'
# Project Agent Instructions

@docs/agent-playbook/CLAUDE.shared.md

## Project-specific commands

Fill these in before using the agents heavily.

- Install:
- Run app:
- Test:
- Typecheck:
- Lint:
- Build:
- E2E/browser tests:

## Architecture notes

- Frontend:
- Backend:
- Database:
- Auth:
- Deployment:

## Repo-specific quality gates

- Minimum test requirement:
- Coverage expectation:
- PR approval requirement:

## Protected areas

The agent must ask for explicit approval before changing these areas.

- Auth:
- Billing:
- Database migrations:
- Data deletion:
- Secrets/config:
- Deployment config:
- Tenant/account boundaries:

## Repo-specific rules

-
EOF
  echo "Created CLAUDE.md"
else
  echo "CLAUDE.md already exists; left unchanged. Ensure it imports @docs/agent-playbook/CLAUDE.shared.md"
fi

echo "Install complete. Next: edit $APP_DIR/CLAUDE.md with your app commands."
