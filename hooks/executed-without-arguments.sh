#!/usr/bin/env bash
set -euo pipefail
# Aegis — interactive or prompt-driven
# Usage: aegis                              → interactive Claude Code session
#        PROMPT="reflect on this" aegis     → non-interactive, identity + prompt
#        echo "reflect on this" | aegis     → non-interactive, stdin

IDENTITY="$HOME/.aegis/memories/001-identity.md"

PROMPT="${PROMPT:-}"
if [ -z "$PROMPT" ] && [ ! -t 0 ]; then
  PROMPT="$(cat)"
fi

cd "$HOME/.aegis"

if [ -n "$PROMPT" ]; then
  exec claude -p "$(cat "$IDENTITY")

$PROMPT"
else
  exec claude . --model sonnet
fi
