#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-.}"
APP_DIR="$(cd "$APP_DIR" && pwd)"

echo "Delivery Kit status for $APP_DIR"
echo

check() {
  local path="$1"
  if [[ -e "$APP_DIR/$path" ]]; then
    echo "✓ $path"
  else
    echo "✗ $path"
  fi
}

check "CLAUDE.md"
check ".claude/agents"
check ".claude/skills"
check ".agent/current.md"
check ".agent/decisions.md"
check ".agent/lessons.md"
check "docs/agent-playbook/CLAUDE.shared.md"
check ".github/PULL_REQUEST_TEMPLATE.md"

if [[ -f "$APP_DIR/.agent/playbook-version" ]]; then
  echo
  echo "Installed version: $(cat "$APP_DIR/.agent/playbook-version")"
fi

echo
if [[ -f "$APP_DIR/CLAUDE.md" ]] && grep -q "@docs/agent-playbook/CLAUDE.shared.md" "$APP_DIR/CLAUDE.md"; then
  echo "✓ CLAUDE.md imports shared rules"
else
  echo "⚠ CLAUDE.md may not import @docs/agent-playbook/CLAUDE.shared.md"
fi
