#!/usr/bin/env bash
# skill-gate: check-gate.sh
# PreToolUse hook for Write|Edit — blocks if the agent hasn't read critical files.
#
# Decision matrix:
#   - No tracking file exists     → approve (fail-open: not a skill session)
#   - Tracking file is malformed  → approve (fail-open)
#   - All three flags true        → approve
#   - Any flag false              → BLOCK (exit 2) with message listing what's missing
#
# Fail-open: if anything goes wrong, exit 0 silently.

set -euo pipefail

# --- Fail-open guard ---
if ! command -v jq &>/dev/null; then
  exit 0
fi

# --- Read stdin ---
INPUT="$(cat)"

SESSION_ID="$(echo "$INPUT" | jq -r '.session_id // empty')"

if [[ -z "$SESSION_ID" ]]; then
  exit 0
fi

# --- Check tracking file ---
TRACK_FILE="/tmp/skill-gate-${SESSION_ID}.json"

# No tracking file = the agent hasn't read any skill file this session.
# This means it's either not a skill session, or the skill hasn't been invoked yet.
# Fail-open: approve.
if [[ ! -f "$TRACK_FILE" ]]; then
  exit 0
fi

# --- Parse flags ---
CONFIG="$(jq -r '.config // false' "$TRACK_FILE" 2>/dev/null)" || { exit 0; }
ANTI_AI="$(jq -r '.anti_ai_voice // false' "$TRACK_FILE" 2>/dev/null)" || { exit 0; }
PLATFORM="$(jq -r '.platform // false' "$TRACK_FILE" 2>/dev/null)" || { exit 0; }

# --- All clear? ---
if [[ "$CONFIG" == "true" && "$ANTI_AI" == "true" && "$PLATFORM" == "true" ]]; then
  exit 0
fi

# --- Build block message ---
MISSING=""

if [[ "$CONFIG" != "true" ]]; then
  MISSING="${MISSING}\n  - config.json (load from data directory: <workspace>/.claude/dev-blog-writer/config.json)"
fi

if [[ "$ANTI_AI" != "true" ]]; then
  MISSING="${MISSING}\n  - references/anti-ai-voice.md (read from skill directory)"
fi

if [[ "$PLATFORM" != "true" ]]; then
  MISSING="${MISSING}\n  - A platform file from references/platforms/ (e.g. substack.md, facebook.md)"
fi

echo -e "SKILL-GATE BLOCKED: You must read these files before writing any draft:${MISSING}\n\nRead the missing files first, then retry your Write/Edit. This is a skill requirement." >&2
exit 2
