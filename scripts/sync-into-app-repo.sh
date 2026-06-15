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

echo "Syncing Delivery Kit $VERSION into $APP_DIR"

mkdir -p "$APP_DIR/.claude" "$APP_DIR/docs/agent-playbook"
rm -rf "$APP_DIR/.claude/agents" "$APP_DIR/.claude/skills"
cp -R "$KIT_DIR/.claude/agents" "$APP_DIR/.claude/agents"
cp -R "$KIT_DIR/.claude/skills" "$APP_DIR/.claude/skills"

rm -rf "$APP_DIR/docs/agent-playbook"
mkdir -p "$APP_DIR/docs/agent-playbook"
cp "$KIT_DIR/CLAUDE.shared.md" "$APP_DIR/docs/agent-playbook/CLAUDE.shared.md"
cp "$KIT_DIR/AGENTS.md" "$APP_DIR/docs/agent-playbook/AGENTS.md"
cp -R "$KIT_DIR/docs/agent-team" "$APP_DIR/docs/agent-playbook/agent-team"

echo "$VERSION" > "$APP_DIR/.agent/playbook-version"

echo "Sync complete. App-specific CLAUDE.md was not overwritten."
