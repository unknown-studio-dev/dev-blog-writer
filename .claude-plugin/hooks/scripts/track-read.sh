#!/usr/bin/env bash
# skill-gate: track-read.sh
# PostToolUse hook for Read — logs when critical skill files are read.
# Creates/updates a tracking file so check-gate.sh can enforce read-before-write.
#
# Fail-open: if anything goes wrong (no jq, bad JSON, etc.), exit 0 silently.

set -euo pipefail

# --- Fail-open guard ---
# If jq is not available, we can't parse stdin. Approve silently.
if ! command -v jq &>/dev/null; then
  exit 0
fi

# --- Read stdin ---
INPUT="$(cat)"

SESSION_ID="$(echo "$INPUT" | jq -r '.session_id // empty')"
FILE_PATH="$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')"

# If we couldn't parse session_id or file_path, nothing to do.
if [[ -z "$SESSION_ID" || -z "$FILE_PATH" ]]; then
  exit 0
fi

# --- Resolve anchors ---
PLUGIN_ROOT="${CLAUDE_PLUGIN_ROOT:-}"

# If CLAUDE_PLUGIN_ROOT is not set, we can't anchor. Fail-open.
if [[ -z "$PLUGIN_ROOT" ]]; then
  exit 0
fi

# Normalize: remove trailing slash from plugin root for consistent matching
PLUGIN_ROOT="${PLUGIN_ROOT%/}"

# The skill reference files live under this path
SKILL_DIR="${PLUGIN_ROOT}/skills/dev-blog-writer"

# The data directory pattern: */.claude/dev-blog-writer/*
DATA_DIR_PATTERN="/.claude/dev-blog-writer/"

# --- Check if this Read is relevant to our skill ---
IS_SKILL_FILE=false
IS_DATA_FILE=false

if [[ "$FILE_PATH" == "${SKILL_DIR}"/* ]]; then
  IS_SKILL_FILE=true
fi

if [[ "$FILE_PATH" == *"${DATA_DIR_PATTERN}"* ]]; then
  IS_DATA_FILE=true
fi

# If the read file is not from our skill or data directory, ignore it.
if [[ "$IS_SKILL_FILE" == false && "$IS_DATA_FILE" == false ]]; then
  exit 0
fi

# --- Tracking file ---
TRACK_FILE="/tmp/skill-gate-${SESSION_ID}.json"

# Create tracking file with all flags false if it doesn't exist yet.
# This is the "gate activation" moment — reading any skill file turns the gate on.
if [[ ! -f "$TRACK_FILE" ]]; then
  echo '{"config":false,"anti_ai_voice":false,"platform":false}' > "$TRACK_FILE"
fi

# --- Set flags based on what was read ---

# Flag: config.json from the data directory
if [[ "$IS_DATA_FILE" == true && "$FILE_PATH" == *"/config.json" ]]; then
  UPDATED="$(jq '.config = true' "$TRACK_FILE")"
  echo "$UPDATED" > "$TRACK_FILE"
fi

# Flag: anti-ai-voice.md from the skill's references
if [[ "$FILE_PATH" == "${SKILL_DIR}/references/anti-ai-voice.md" ]]; then
  UPDATED="$(jq '.anti_ai_voice = true' "$TRACK_FILE")"
  echo "$UPDATED" > "$TRACK_FILE"
fi

# Flag: any platform file from the skill's references/platforms/
if [[ "$FILE_PATH" == "${SKILL_DIR}/references/platforms/"* ]]; then
  UPDATED="$(jq '.platform = true' "$TRACK_FILE")"
  echo "$UPDATED" > "$TRACK_FILE"
fi

exit 0
