#!/bin/bash

set -euo pipefail

STATE_FILE=".claude/blackcow-rn-loop.local.md"
PROMPT_PARTS=()
RESUME=false
STATUS_ONLY=false
CANCEL_ONLY=false
RESUME_FROM_INACTIVE=false
RESUME_LAST_ERROR="없음"
RESUME_LAST_STOPPED_AT=""
MAX_ITERATIONS=0
MAX_ITERATIONS_SET=false
COMPLETION_PROMISE="null"
COMPLETION_PROMISE_SET=false

escape_yaml_double_quoted() {
  printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'
}

unescape_yaml_double_quoted() {
  printf '%s' "$1" | sed 's/^"//; s/"$//; s/\\"/"/g; s/\\\\/\\/g'
}

state_value() {
  local key="$1"
  if [[ ! -f "$STATE_FILE" ]]; then
    return
  fi
  sed -n "s/^${key}:[[:space:]]*//p" "$STATE_FILE" | sed -n '1p'
}

is_active_loop() {
  [[ -f "$STATE_FILE" ]] && grep -q '^active:[[:space:]]*true$' "$STATE_FILE"
}

print_loop_status() {
  local active_value iteration max_iterations completion_promise_raw completion_promise started_at last_error_raw last_error last_stopped_at

  echo "blackcow-rn-forge loop 상태"
  echo ""

  if [[ ! -f "$STATE_FILE" ]]; then
    cat <<EOF
상태: 없음 (실행 중인 루프 없음)
상태 파일: $STATE_FILE (없음)

다음 단계:
  새 루프 시작: /rn-loop 할일
EOF
    return 0
  fi

  active_value=$(state_value "active")
  iteration=$(state_value "iteration")
  max_iterations=$(state_value "max_iterations")
  completion_promise_raw=$(state_value "completion_promise")
  started_at=$(state_value "started_at")
  last_error_raw=$(state_value "last_error")
  last_stopped_at=$(state_value "last_stopped_at")

  if [[ -n "$completion_promise_raw" && "$completion_promise_raw" != "null" ]]; then
    completion_promise=$(unescape_yaml_double_quoted "$completion_promise_raw")
  else
    completion_promise="없음"
  fi

  if [[ -n "$last_error_raw" && "$last_error_raw" != "null" ]]; then
    last_error=$(unescape_yaml_double_quoted "$last_error_raw")
  else
    last_error="없음"
  fi

  if [[ "$active_value" == "true" ]]; then
    cat <<EOF
상태: active (루프 실행 중)
반복: $(if [[ "$iteration" =~ ^[0-9]+$ ]]; then echo "${iteration}회차"; else echo "알 수 없음"; fi)
최대 반복: $(if [[ "$max_iterations" =~ ^[0-9]+$ && "$max_iterations" -gt 0 ]]; then echo "${max_iterations}회"; else echo "무제한"; fi)
완료 조건: $completion_promise
시작 시각: ${started_at:-알 수 없음}
상태 파일: $STATE_FILE

다음 단계:
  이어서 진행: /rn-loop --resume 다음 할일
  루프 중단: /rn-cancel-loop
EOF
  else
    cat <<EOF
상태: inactive (상태 파일만 남아 있음)
반복: $(if [[ "$iteration" =~ ^[0-9]+$ ]]; then echo "${iteration}회차"; else echo "알 수 없음"; fi)
최대 반복: $(if [[ "$max_iterations" =~ ^[0-9]+$ && "$max_iterations" -gt 0 ]]; then echo "${max_iterations}회"; else echo "무제한"; fi)
완료 조건: $completion_promise
시작 시각: ${started_at:-알 수 없음}
마지막 중단 시각: ${last_stopped_at:-알 수 없음}
마지막 중단 이유: $last_error
상태 파일: $STATE_FILE

다음 단계:
  문제 해결 후 이어서 진행: /rn-loop --resume 다음 할일
  정리 후 새로 시작: /rn-cancel-loop
EOF
  fi
}

cancel_loop() {
  local active_value iteration

  echo "blackcow-rn-forge loop 중단"
  echo ""

  if [[ ! -f "$STATE_FILE" ]]; then
    cat <<EOF
상태: 없음 (중단할 실행 중 루프 없음)
상태 파일: $STATE_FILE (없음)

다음 단계:
  새 루프 시작: /rn-loop 할일
  상태만 확인: /rn-loop --status
EOF
    return 0
  fi

  active_value=$(state_value "active")
  iteration=$(state_value "iteration")

  if [[ "$active_value" == "true" ]]; then
    rm -f "$STATE_FILE"
    cat <<EOF
상태: active 루프 중단 완료
중단된 반복: $(if [[ "$iteration" =~ ^[0-9]+$ ]]; then echo "${iteration}회차"; else echo "알 수 없음"; fi)
정리된 상태 파일: $STATE_FILE

다음 단계:
  새 루프 시작: /rn-loop 할일
  상태만 확인: /rn-loop --status
EOF
  else
    rm -f "$STATE_FILE"
    cat <<EOF
상태: inactive (실행 중 루프는 없음)
처리: 남아 있던 상태 파일만 정리했어요
정리된 상태 파일: $STATE_FILE

다음 단계:
  새 루프 시작: /rn-loop 할일
  상태만 확인: /rn-loop --status
EOF
  fi
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)
      cat <<'EOF'
blackcow-rn-forge loop

사용법:
  /rn-loop [--resume] 할일 [옵션]
  /rn-loop --status
  /rn-loop --cancel

옵션:
  --status
  --cancel
  --resume
  --max-iterations <횟수>
  --completion-promise '<조건>'
  -h, --help

예시:
  /rn-loop --status
  /rn-loop --cancel
  /rn-loop 할일
  /rn-loop --resume 다음 할일
EOF
      exit 0
      ;;
    --status)
      STATUS_ONLY=true
      shift
      ;;
    --cancel)
      CANCEL_ONLY=true
      shift
      ;;
    --max-iterations)
      if [[ -z "${2:-}" ]] || ! [[ "$2" =~ ^[0-9]+$ ]]; then
        echo "max-iterations에는 숫자를 넣어주세요." >&2
        exit 1
      fi
      MAX_ITERATIONS="$2"
      MAX_ITERATIONS_SET=true
      shift 2
      ;;
    --completion-promise)
      if [[ -z "${2:-}" ]]; then
        echo "completion-promise를 넣어주세요." >&2
        exit 1
      fi
      COMPLETION_PROMISE="$2"
      COMPLETION_PROMISE_SET=true
      shift 2
      ;;
    --resume)
      RESUME=true
      shift
      ;;
    *)
      PROMPT_PARTS+=("$1")
      shift
      ;;
  esac
done

CONTROL_MODE_COUNT=0
if [[ "$STATUS_ONLY" == "true" ]]; then
  CONTROL_MODE_COUNT=$((CONTROL_MODE_COUNT + 1))
fi
if [[ "$CANCEL_ONLY" == "true" ]]; then
  CONTROL_MODE_COUNT=$((CONTROL_MODE_COUNT + 1))
fi
if [[ "$RESUME" == "true" ]]; then
  CONTROL_MODE_COUNT=$((CONTROL_MODE_COUNT + 1))
fi

if [[ "$CONTROL_MODE_COUNT" -gt 1 ]]; then
  echo "--status, --cancel, --resume 은 함께 쓸 수 없어요. 하나만 선택해요." >&2
  exit 1
fi

if [[ "$STATUS_ONLY" == "true" ]]; then
  if [[ "${#PROMPT_PARTS[@]}" -gt 0 ]] || [[ "$MAX_ITERATIONS_SET" == "true" ]] || [[ "$COMPLETION_PROMISE_SET" == "true" ]]; then
    echo "--status 는 다른 인자 없이 단독으로 실행해요." >&2
    echo "예시: /rn-loop --status" >&2
    exit 1
  fi
  print_loop_status
  exit 0
fi

if [[ "$CANCEL_ONLY" == "true" ]]; then
  if [[ "${#PROMPT_PARTS[@]}" -gt 0 ]] || [[ "$MAX_ITERATIONS_SET" == "true" ]] || [[ "$COMPLETION_PROMISE_SET" == "true" ]]; then
    echo "--cancel 은 다른 할 일 인자 없이 단독으로 실행해요." >&2
    echo "예시: /rn-loop --cancel" >&2
    exit 1
  fi
  cancel_loop
  exit 0
fi

PROMPT="${PROMPT_PARTS[*]}"

if [[ -z "$PROMPT" ]]; then
  echo "할 일을 알려주세요." >&2
  exit 1
fi

mkdir -p .claude

CURRENT_ITERATION=0
NEXT_ITERATION=1
CURRENT_ITERATION_RAW=""

if is_active_loop; then
  CURRENT_ITERATION_RAW=$(state_value "iteration")
  if [[ "$CURRENT_ITERATION_RAW" =~ ^[0-9]+$ ]]; then
    CURRENT_ITERATION="$CURRENT_ITERATION_RAW"
  fi
  NEXT_ITERATION=$((CURRENT_ITERATION + 1))
fi

if [[ "$RESUME" == "true" ]]; then
  EXISTING_ACTIVE_VALUE=""

  if [[ ! -f "$STATE_FILE" ]]; then
    echo "이어갈 루프 상태 파일이 없어요: $STATE_FILE" >&2
    echo "새 루프를 시작하려면 --resume 없이 /rn-loop를 실행해요." >&2
    exit 1
  fi

  CURRENT_ITERATION_RAW=$(state_value "iteration")
  if [[ "$CURRENT_ITERATION_RAW" =~ ^[0-9]+$ ]]; then
    CURRENT_ITERATION="$CURRENT_ITERATION_RAW"
  fi
  NEXT_ITERATION=$((CURRENT_ITERATION + 1))

  EXISTING_ACTIVE_VALUE=$(state_value "active")
  if [[ "$EXISTING_ACTIVE_VALUE" != "true" ]]; then
    RESUME_FROM_INACTIVE=true
    EXISTING_LAST_ERROR_RAW=$(state_value "last_error")
    EXISTING_LAST_STOPPED_AT=$(state_value "last_stopped_at")
    if [[ -n "$EXISTING_LAST_ERROR_RAW" && "$EXISTING_LAST_ERROR_RAW" != "null" ]]; then
      RESUME_LAST_ERROR=$(unescape_yaml_double_quoted "$EXISTING_LAST_ERROR_RAW")
    fi
    RESUME_LAST_STOPPED_AT="$EXISTING_LAST_STOPPED_AT"
  fi

  if [[ "$MAX_ITERATIONS_SET" != "true" ]]; then
    EXISTING_MAX_ITERATIONS=$(state_value "max_iterations")
    if [[ "$EXISTING_MAX_ITERATIONS" =~ ^[0-9]+$ ]]; then
      MAX_ITERATIONS="$EXISTING_MAX_ITERATIONS"
    fi
  fi

  if [[ "$COMPLETION_PROMISE_SET" != "true" ]]; then
    EXISTING_PROMISE_RAW=$(state_value "completion_promise")
    if [[ -n "$EXISTING_PROMISE_RAW" && "$EXISTING_PROMISE_RAW" != "null" ]]; then
      COMPLETION_PROMISE=$(unescape_yaml_double_quoted "$EXISTING_PROMISE_RAW")
    fi
  fi

  STARTED_AT=$(state_value "started_at")
  if [[ -z "$STARTED_AT" ]]; then
    STARTED_AT="\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\""
  fi
else
  if is_active_loop; then
    cat <<EOF >&2
이미 실행 중인 RN 루프가 있어요. 기존 루프를 덮어쓰지 않았어요.

현재 반복: ${CURRENT_ITERATION}회차
상태 파일: $STATE_FILE

이어가려면:
  /rn-loop --resume $PROMPT

중단 후 새로 시작하려면:
  /rn-cancel-loop
  /rn-loop $PROMPT
EOF
    exit 1
  fi

  STARTED_AT="\"$(date -u +%Y-%m-%dT%H:%M:%SZ)\""
fi

if [[ "$COMPLETION_PROMISE" != "null" ]]; then
  ESCAPED_PROMISE=$(escape_yaml_double_quoted "$COMPLETION_PROMISE")
  COMPLETION_PROMISE_YAML="\"$ESCAPED_PROMISE\""
else
  COMPLETION_PROMISE_YAML="null"
fi

cat > "$STATE_FILE" <<EOF
---
active: true
iteration: $NEXT_ITERATION
session_id: ${CLAUDE_CODE_SESSION_ID:-}
max_iterations: $MAX_ITERATIONS
completion_promise: $COMPLETION_PROMISE_YAML
started_at: $STARTED_AT
---

$PROMPT
EOF

if [[ "$RESUME" == "true" ]]; then
  cat <<EOF
blackcow-rn-forge loop 재개

반복: ${NEXT_ITERATION}회차 (이전 ${CURRENT_ITERATION}회차에서 이어감)
최대 반복: $(if [[ "$MAX_ITERATIONS" -gt 0 ]]; then echo "${MAX_ITERATIONS}회"; else echo "무제한"; fi)
완료 조건: $(if [[ "$COMPLETION_PROMISE" != "null" ]]; then echo "$COMPLETION_PROMISE"; else echo "없음"; fi)
$(if [[ "$RESUME_FROM_INACTIVE" == "true" ]]; then printf '이전 상태: inactive (마지막 중단 시각: %s)\n이전 중단 이유: %s\n' "${RESUME_LAST_STOPPED_AT:-알 수 없음}" "$RESUME_LAST_ERROR"; fi)

중단: /rn-cancel-loop
상태 파일: $STATE_FILE
EOF
else
  cat <<EOF
blackcow-rn-forge loop 시작

반복: ${NEXT_ITERATION}회차
최대 반복: $(if [[ "$MAX_ITERATIONS" -gt 0 ]]; then echo "${MAX_ITERATIONS}회"; else echo "무제한"; fi)
완료 조건: $(if [[ "$COMPLETION_PROMISE" != "null" ]]; then echo "$COMPLETION_PROMISE"; else echo "없음"; fi)

중단: /rn-cancel-loop
상태 파일: $STATE_FILE
EOF
fi

if [[ "$COMPLETION_PROMISE" != "null" ]]; then
  echo ""
  echo "<promise>$COMPLETION_PROMISE</promise>"
fi
