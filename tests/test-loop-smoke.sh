#!/bin/bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SETUP_SCRIPT="$REPO_ROOT/plugin/scripts/setup-rn-loop.sh"
STOP_HOOK="$REPO_ROOT/plugin/hooks/stop-hook.sh"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

assert_contains() {
  local haystack="$1"
  local needle="$2"
  local message="$3"

  if [[ "$haystack" != *"$needle"* ]]; then
    fail "$message"
  fi
}

assert_not_contains() {
  local haystack="$1"
  local needle="$2"
  local message="$3"

  if [[ "$haystack" == *"$needle"* ]]; then
    fail "$message"
  fi
}

assert_file_contains() {
  local file_path="$1"
  local needle="$2"
  local message="$3"

  if ! grep -Fq "$needle" "$file_path"; then
    fail "$message"
  fi
}

run_setup() {
  local workspace="$1"
  shift
  (
    cd "$workspace"
    bash "$SETUP_SCRIPT" "$@"
  )
}

run_setup_with_session() {
  local workspace="$1"
  local session_id="$2"
  shift 2
  (
    cd "$workspace"
    CLAUDE_CODE_SESSION_ID="$session_id" bash "$SETUP_SCRIPT" "$@"
  )
}

run_stop_hook() {
  local workspace="$1"
  local session_id="$2"
  local transcript_path="$3"
  (
    cd "$workspace"
    printf '{"session_id":"%s","transcript_path":"%s"}' "$session_id" "$transcript_path" | bash "$STOP_HOOK"
  )
}

if ! command -v jq >/dev/null 2>&1; then
  fail "jq is required for loop smoke tests"
fi

tmp_root="$(mktemp -d)"
trap 'rm -rf "$tmp_root"' EXIT

status_workspace="$tmp_root/status"
mkdir -p "$status_workspace"
status_output="$(run_setup "$status_workspace" --status 2>&1)"
assert_contains "$status_output" "상태: 없음 (실행 중인 루프 없음)" "--status should explain that no loop is active"

start_workspace="$tmp_root/start"
mkdir -p "$start_workspace"
start_output="$(run_setup_with_session "$start_workspace" "session-start" "출시 준비" --completion-promise DONE 2>&1)"
assert_contains "$start_output" "blackcow-rn-forge loop 시작" "fresh start should announce loop start"
assert_not_contains "$start_output" "<promise>DONE</promise>" "fresh start must not emit the completion promise"

state_file="$start_workspace/.claude/blackcow-rn-loop.local.md"
[[ -f "$state_file" ]] || fail "fresh start should create the loop state file"
assert_file_contains "$state_file" "active: true" "state file should be active after start"
assert_file_contains "$state_file" "session_id: session-start" "state file should store the current session id"
assert_file_contains "$state_file" "completion_promise: \"DONE\"" "state file should store the completion promise"

set +e
overwrite_output="$(run_setup "$start_workspace" "다른 작업" 2>&1)"
overwrite_status=$?
set -e
[[ "$overwrite_status" -ne 0 ]] || fail "starting a new loop without --resume should fail when active state exists"
assert_contains "$overwrite_output" "이미 실행 중인 RN 루프가 있어요." "active loop overwrite should be rejected"

cancel_output="$(run_setup "$start_workspace" --cancel 2>&1)"
assert_contains "$cancel_output" "active 루프 중단 완료" "--cancel should report active loop cancellation"
[[ ! -f "$state_file" ]] || fail "--cancel should remove the active state file"

resume_workspace="$tmp_root/resume"
mkdir -p "$resume_workspace"
resume_start_output="$(run_setup_with_session "$resume_workspace" "session-keep" "재개 전 작업" --completion-promise DONE 2>&1)"
assert_not_contains "$resume_start_output" "<promise>DONE</promise>" "initial setup for resume scenario must not emit the completion promise"

missing_transcript="$resume_workspace/missing-transcript.json"
missing_output="$(run_stop_hook "$resume_workspace" "session-keep" "$missing_transcript" 2>&1)"
assert_contains "$missing_output" "transcript를 찾지 못해 루프를 중단해요." "missing transcript should mark the loop inactive"
resume_state_file="$resume_workspace/.claude/blackcow-rn-loop.local.md"
assert_file_contains "$resume_state_file" "active: false" "stop hook should mark the loop inactive when transcript is missing"
assert_file_contains "$resume_state_file" "session_id: session-keep" "inactive state should preserve the original session id"

resume_output="$(run_setup "$resume_workspace" --resume "다시 진행" 2>&1)"
assert_contains "$resume_output" "blackcow-rn-forge loop 재개" "--resume should announce loop resumption"
assert_not_contains "$resume_output" "<promise>DONE</promise>" "resume must not emit the completion promise"
assert_file_contains "$resume_state_file" "active: true" "resume should reactivate the loop state"
assert_file_contains "$resume_state_file" "iteration: 2" "resume should increment the loop iteration"
assert_file_contains "$resume_state_file" "session_id: session-keep" "resume should preserve the prior session id when env is empty"

completion_workspace="$tmp_root/complete"
mkdir -p "$completion_workspace"
completion_start_output="$(run_setup_with_session "$completion_workspace" "session-done" "완료 확인" --completion-promise DONE 2>&1)"
assert_not_contains "$completion_start_output" "<promise>DONE</promise>" "completion scenario start must not emit the completion promise"

completion_transcript="$completion_workspace/transcript.jsonl"
cat > "$completion_transcript" <<'EOF'
{"role":"assistant","message":{"content":[{"type":"text","text":"마무리했고 <promise>DONE</promise> 입니다."}]}}
EOF

completion_output="$(run_stop_hook "$completion_workspace" "session-done" "$completion_transcript" 2>&1)"
assert_contains "$completion_output" "완료 조건 달성!" "stop hook should accept the matching completion promise"
[[ ! -f "$completion_workspace/.claude/blackcow-rn-loop.local.md" ]] || fail "completion should remove the loop state file"

max_workspace="$tmp_root/max-iterations"
mkdir -p "$max_workspace"
max_start_output="$(run_setup_with_session "$max_workspace" "session-max" "반복 상한 확인" --max-iterations 1 2>&1)"
assert_contains "$max_start_output" "최대 반복: 1회" "start output should show the max iteration cap"
max_transcript="$max_workspace/max-transcript.jsonl"
cat > "$max_transcript" <<'EOF'
{"role":"assistant","message":{"content":[{"type":"text","text":"아직 완료 태그는 없어요."}]}}
EOF
max_output="$(run_stop_hook "$max_workspace" "session-max" "$max_transcript" 2>&1)"
assert_contains "$max_output" "최대 반복 횟수(1)에 도달했어요." "stop hook should hard-stop at the max iteration cap"
[[ ! -f "$max_workspace/.claude/blackcow-rn-loop.local.md" ]] || fail "max iteration stop should remove the state file"

printf 'PASS: rn-loop smoke contract\n'
