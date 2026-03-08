#!/bin/bash

set -euo pipefail

STATE_FILE=".claude/blackcow-rn-loop.local.md"

escape_yaml_double_quoted() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}

if [[ ! -f "$STATE_FILE" ]]; then
  exit 0
fi

read_frontmatter_value() {
  local key="$1"
  awk -F': ' -v target="$key" '
    BEGIN { in_block = 0 }
    /^---$/ {
      if (in_block == 0) {
        in_block = 1
        next
      }
      exit
    }
    in_block == 1 && $1 == target {
      sub(/^[^:]+: /, "", $0)
      print $0
      exit
    }
  ' "$STATE_FILE"
}

state_prompt_text() {
  awk '/^---$/{count++; next} count >= 2 {print}' "$STATE_FILE"
}

mark_loop_inactive() {
  local reason="$1"
  local iteration max_iterations completion_promise_raw state_session started_at prompt_text stopped_at temp_file escaped_reason

  iteration="$(read_frontmatter_value iteration || true)"
  max_iterations="$(read_frontmatter_value max_iterations || true)"
  completion_promise_raw="$(read_frontmatter_value completion_promise || true)"
  state_session="$(read_frontmatter_value session_id || true)"
  started_at="$(read_frontmatter_value started_at || true)"
  prompt_text="$(state_prompt_text)"
  stopped_at="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  escaped_reason="$(escape_yaml_double_quoted "$reason")"

  if [[ -z "$iteration" ]]; then
    iteration="0"
  fi
  if [[ -z "$max_iterations" ]]; then
    max_iterations="0"
  fi
  if [[ -z "$completion_promise_raw" ]]; then
    completion_promise_raw="null"
  fi
  if [[ -z "$started_at" ]]; then
    started_at="\"$stopped_at\""
  fi

  temp_file="${STATE_FILE}.tmp.$$"
  cat > "$temp_file" <<EOF
---
active: false
iteration: $iteration
session_id: $state_session
max_iterations: $max_iterations
completion_promise: $completion_promise_raw
started_at: $started_at
last_error: "$escaped_reason"
last_stopped_at: "$stopped_at"
---

$prompt_text
EOF
  mv "$temp_file" "$STATE_FILE"
}

ACTIVE_STATE="$(read_frontmatter_value active || true)"
if [[ "$ACTIVE_STATE" != "true" ]]; then
  exit 0
fi

if ! command -v jq >/dev/null 2>&1; then
  echo "blackcow-rn-forge loop: jq가 없어서 루프를 중단해요." >&2
  mark_loop_inactive "jq가 없어서 루프를 중단했어요. jq 설치 후 /rn-loop --resume 또는 /rn-loop --status 로 상태를 확인해요."
  exit 0
fi

HOOK_INPUT=$(cat)

ITERATION="$(read_frontmatter_value iteration || true)"
MAX_ITERATIONS="$(read_frontmatter_value max_iterations || true)"
COMPLETION_PROMISE_RAW="$(read_frontmatter_value completion_promise || true)"
STATE_SESSION="$(read_frontmatter_value session_id || true)"

COMPLETION_PROMISE="${COMPLETION_PROMISE_RAW#\"}"
COMPLETION_PROMISE="${COMPLETION_PROMISE%\"}"

if [[ -z "$ITERATION" ]] || [[ -z "$MAX_ITERATIONS" ]]; then
  echo "blackcow-rn-forge loop: 상태 파일이 손상돼서 루프를 중단해요." >&2
  mark_loop_inactive "상태 파일이 손상돼서 루프를 중단했어요. /rn-loop --status 로 상태를 확인하고 필요하면 /rn-cancel-loop 로 정리해요."
  exit 0
fi

if [[ ! "$ITERATION" =~ ^[0-9]+$ ]] || [[ ! "$MAX_ITERATIONS" =~ ^[0-9]+$ ]]; then
  echo "blackcow-rn-forge loop: 반복 횟수 값을 읽을 수 없어요." >&2
  mark_loop_inactive "반복 횟수 값을 읽을 수 없어 루프를 중단했어요. /rn-loop --status 로 상태를 확인하고 필요하면 /rn-cancel-loop 로 정리해요."
  exit 0
fi

HOOK_SESSION="$(printf '%s' "$HOOK_INPUT" | jq -r '.session_id // ""')"
if [[ -n "$STATE_SESSION" ]] && [[ "$STATE_SESSION" != "$HOOK_SESSION" ]]; then
  exit 0
fi

if [[ "$MAX_ITERATIONS" -gt 0 ]] && [[ "$ITERATION" -ge "$MAX_ITERATIONS" ]]; then
  echo "blackcow-rn-forge loop: 최대 반복 횟수($MAX_ITERATIONS)에 도달했어요."
  rm -f "$STATE_FILE"
  exit 0
fi

TRANSCRIPT_PATH="$(printf '%s' "$HOOK_INPUT" | jq -r '.transcript_path // ""')"
if [[ -z "$TRANSCRIPT_PATH" ]] || [[ ! -f "$TRANSCRIPT_PATH" ]]; then
  echo "blackcow-rn-forge loop: transcript를 찾지 못해 루프를 중단해요." >&2
  mark_loop_inactive "transcript를 찾지 못해 루프를 중단했어요. /rn-loop --status 로 상태를 확인하고 다시 이어가요."
  exit 0
fi

set +e
LAST_OUTPUT="$(
  jq -rs '
    map(select(.role == "assistant"))
    | map(.message.content[]? | select(.type == "text") | .text)
    | last // ""
  ' "$TRANSCRIPT_PATH" 2>/dev/null
)"
JQ_EXIT=$?
set -e

if [[ "$JQ_EXIT" -ne 0 ]]; then
  echo "blackcow-rn-forge loop: transcript 파싱에 실패했어요." >&2
  mark_loop_inactive "transcript 파싱에 실패해 루프를 중단했어요. /rn-loop --status 로 상태를 확인하고 다시 이어가요."
  exit 0
fi

if [[ "$COMPLETION_PROMISE" != "null" ]] && [[ -n "$COMPLETION_PROMISE" ]]; then
  NORMALIZED_OUTPUT="$(printf '%s' "$LAST_OUTPUT" | tr '\n' ' ' | sed 's/[[:space:]]\+/ /g')"
  PROMISE_TEXT="$(printf '%s' "$NORMALIZED_OUTPUT" | sed -n 's@.*<promise>\(.*\)</promise>.*@\1@p' | sed 's/^ //; s/ $//')"
  if [[ -n "$PROMISE_TEXT" ]] && [[ "$PROMISE_TEXT" == "$COMPLETION_PROMISE" ]]; then
    echo "blackcow-rn-forge loop: 완료 조건 달성!"
    rm -f "$STATE_FILE"
    exit 0
  fi
fi

NEXT_ITERATION=$((ITERATION + 1))
PROMPT_TEXT="$(awk '/^---$/{count++; next} count >= 2 {print}' "$STATE_FILE")"

if [[ -z "$PROMPT_TEXT" ]]; then
  echo "blackcow-rn-forge loop: 프롬프트가 비어 있어 루프를 중단해요." >&2
  mark_loop_inactive "프롬프트가 비어 있어 루프를 중단했어요. /rn-loop --status 로 상태를 확인하고 필요하면 새로 시작해요."
  exit 0
fi

TEMP_FILE="${STATE_FILE}.tmp.$$"
sed "s/^iteration: .*/iteration: $NEXT_ITERATION/" "$STATE_FILE" > "$TEMP_FILE"
mv "$TEMP_FILE" "$STATE_FILE"

if [[ "$COMPLETION_PROMISE" != "null" ]] && [[ -n "$COMPLETION_PROMISE" ]]; then
  SYSTEM_MSG="blackcow-rn-forge loop ${NEXT_ITERATION}번째 반복 | 완료하려면: <promise>$COMPLETION_PROMISE</promise>"
else
  SYSTEM_MSG="blackcow-rn-forge loop ${NEXT_ITERATION}번째 반복 | 완료 조건 없음"
fi

jq -n \
  --arg prompt "$PROMPT_TEXT" \
  --arg msg "$SYSTEM_MSG" \
  '{
    "decision": "block",
    "reason": $prompt,
    "systemMessage": $msg
  }'
