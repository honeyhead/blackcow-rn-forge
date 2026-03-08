#!/bin/bash

set -euo pipefail

STATE_FILE=".claude/blackcow-rn-loop.local.md"
PROMPT_PARTS=()
MAX_ITERATIONS=0
COMPLETION_PROMISE="null"

escape_yaml_double_quoted() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      cat <<'EOF'
blackcow-rn-forge loop

사용법:
  /rn-loop 할일 [옵션]

옵션:
  --max-iterations <횟수>
  --completion-promise '<조건>'
  -h, --help
EOF
      exit 0
      ;;
    --max-iterations)
      if [[ -z "${2:-}" ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
        echo "max-iterations에는 숫자를 넣어주세요." >&2
        exit 1
      fi
      MAX_ITERATIONS="$2"
      shift 2
      ;;
    --completion-promise)
      if [[ -z "${2:-}" ]]; then
        echo "completion-promise를 넣어주세요." >&2
        exit 1
      fi
      COMPLETION_PROMISE="$2"
      shift 2
      ;;
    *)
      PROMPT_PARTS+=("$1")
      shift
      ;;
  esac
done

PROMPT="${PROMPT_PARTS[*]}"

if [[ -z "$PROMPT" ]]; then
  echo "할 일을 알려주세요." >&2
  exit 1
fi

mkdir -p .claude

if [[ "$COMPLETION_PROMISE" != "null" ]]; then
  ESCAPED_PROMISE=$(escape_yaml_double_quoted "$COMPLETION_PROMISE")
  COMPLETION_PROMISE_YAML="\"$ESCAPED_PROMISE\""
else
  COMPLETION_PROMISE_YAML="null"
fi

cat > "$STATE_FILE" <<EOF
---
active: true
iteration: 1
session_id: ${CLAUDE_CODE_SESSION_ID:-}
max_iterations: $MAX_ITERATIONS
completion_promise: $COMPLETION_PROMISE_YAML
started_at: "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
---

$PROMPT
EOF

cat <<EOF
blackcow-rn-forge loop 시작

반복: 1회차
최대 반복: $(if [[ "$MAX_ITERATIONS" -gt 0 ]]; then echo "${MAX_ITERATIONS}회"; else echo "무제한"; fi)
완료 조건: $(if [[ "$COMPLETION_PROMISE" != "null" ]]; then echo "$COMPLETION_PROMISE"; else echo "없음"; fi)

중단: /rn-cancel-loop
상태 파일: $STATE_FILE
EOF

if [[ "$COMPLETION_PROMISE" != "null" ]]; then
  echo ""
  echo "<promise>$COMPLETION_PROMISE</promise>"
fi
