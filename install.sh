#!/usr/bin/env bash
# mj-agent skill installer for Claude Code
# Usage: curl -fsSL https://raw.githubusercontent.com/georgespelllens/mj-agent/main/install.sh | bash

set -euo pipefail

SKILL_NAME="mj-agent"
SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"
SKILL_URL="https://raw.githubusercontent.com/georgespelllens/mj-agent/main/SKILL.md"

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "${BLUE}🎨 Installing mj-agent skill for Claude Code${NC}"
echo ""

# Check curl
if ! command -v curl >/dev/null 2>&1; then
  echo "${RED}✗ curl not found. Install curl first.${NC}"
  exit 1
fi

# Check ~/.claude exists (means Claude Code is installed)
if [ ! -d "$HOME/.claude" ]; then
  echo "${YELLOW}⚠  ~/.claude directory not found.${NC}"
  echo "   Looks like Claude Code is not installed yet."
  echo "   Install it first: npm install -g @anthropic-ai/claude-code"
  echo ""
  read -p "   Continue anyway? [y/N] " -n 1 -r
  echo ""
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    exit 1
  fi
fi

# Create skill dir
mkdir -p "$SKILL_DIR"

# Download SKILL.md
if [ -f "$SKILL_DIR/SKILL.md" ]; then
  echo "${YELLOW}⚠  Existing skill found at $SKILL_DIR/SKILL.md${NC}"
  echo "   Backing up to SKILL.md.bak"
  cp "$SKILL_DIR/SKILL.md" "$SKILL_DIR/SKILL.md.bak"
fi

curl -fsSL "$SKILL_URL" -o "$SKILL_DIR/SKILL.md"

# Verify
if [ ! -s "$SKILL_DIR/SKILL.md" ]; then
  echo "${RED}✗ Download failed or file is empty${NC}"
  exit 1
fi

echo "${GREEN}✓ Skill installed to $SKILL_DIR${NC}"
echo "${GREEN}✓ Restart Claude Code (or open a new session) to activate${NC}"
echo ""
echo "Try it:"
echo "  ${BLUE}claude${NC}"
echo "  ${BLUE}> [paste your MJ prompt]${NC}"
echo "  ${BLUE}> сделай вариации${NC}"
echo ""
echo "Repo: https://github.com/georgespelllens/mj-agent"
echo "Docs: https://github.com/georgespelllens/mj-agent#-quick-start"
echo ""
