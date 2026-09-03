#!/usr/bin/env bash
# Installs the dozee-brand-style skill as a personal Claude Code skill
# (applies across all your projects — see https://code.claude.com/docs/en/skills).
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.claude/skills/dozee-brand-style"

if [ ! -f "$SCRIPT_DIR/SKILL.md" ]; then
  echo "Error: SKILL.md not found next to this script." >&2
  exit 1
fi

mkdir -p "$TARGET_DIR"
cp "$SCRIPT_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"

echo "Installed: $TARGET_DIR/SKILL.md"
echo "Claude Code picks this up automatically in your current session — no restart needed."
echo "Note: Cowork / claude.ai sessions don't read this folder — see README.md for that path."
