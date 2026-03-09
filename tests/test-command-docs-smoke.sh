#!/bin/bash

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
COMMAND_DIR="$REPO_ROOT/plugin/commands"
README_FILE="$REPO_ROOT/README.md"

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

assert_file_exists() {
  local file_path="$1"
  local message="$2"

  [[ -f "$file_path" ]] || fail "$message"
}

assert_file_contains() {
  local file_path="$1"
  local needle="$2"
  local message="$3"

  if ! grep -Fq "$needle" "$file_path"; then
    fail "$message"
  fi
}

command_files=(
  "$COMMAND_DIR/rn-help.md"
  "$COMMAND_DIR/rn-workflow.md"
  "$COMMAND_DIR/rn-yolo-plan.md"
  "$COMMAND_DIR/rn-yolo-build.md"
  "$COMMAND_DIR/rn-loop.md"
  "$COMMAND_DIR/rn-planner.md"
  "$COMMAND_DIR/rn-architect.md"
  "$COMMAND_DIR/rn-release-manager.md"
)

for file_path in "${command_files[@]}"; do
  assert_file_exists "$file_path" "expected command doc to exist: $(basename "$file_path")"
  assert_file_contains "$file_path" 'description:' "command doc should include description: $(basename "$file_path")"
  assert_file_contains "$file_path" 'argument-hint:' "command doc should include argument-hint: $(basename "$file_path")"
  assert_file_contains "$file_path" 'user-invocable: true' "command doc should be user-invocable: $(basename "$file_path")"
  assert_file_contains "$file_path" '예시 입력:' "command doc should include an example input: $(basename "$file_path")"
done

assert_file_contains "$COMMAND_DIR/rn-yolo-plan.md" 'docs/yolo-build-brief.md' 'rn-yolo-plan should produce the YOLO build brief'
assert_file_contains "$COMMAND_DIR/rn-yolo-plan.md" 'docs/mobile-prd/{name}.md' 'rn-yolo-plan should write a PRD artifact'
assert_file_contains "$COMMAND_DIR/rn-yolo-plan.md" '이 앱은 광고/결제 같은 수익화가 핵심인가요, 아니면 계산기 같은 유틸리티 앱인가요?' 'rn-yolo-plan should ask monetized vs utility once when needed'
assert_file_contains "$COMMAND_DIR/rn-yolo-plan.md" '이번 MVP에서는 수익화 없음' 'rn-yolo-plan should support utility apps without monetization'
assert_file_contains "$COMMAND_DIR/rn-yolo-build.md" '기본값은 현재 프로젝트예요.' 'rn-yolo-build should default to current project'
assert_file_contains "$COMMAND_DIR/rn-yolo-build.md" 'slug를 다시 요구하지 말고' 'rn-yolo-build should avoid requiring a slug by default'
assert_file_contains "$COMMAND_DIR/rn-loop.md" '.claude/blackcow-rn-loop.local.md' 'rn-loop should document its workspace state file'
assert_file_contains "$COMMAND_DIR/rn-release-manager.md" 'docs/release/release-plan.md' 'rn-release-manager should document release outputs'
assert_file_contains "$COMMAND_DIR/rn-help.md" '이 앱은 광고/결제 같은 수익화가 핵심인가요, 아니면 계산기 같은 유틸리티 앱인가요?' 'rn-help should ask monetized vs utility once when needed'

command_doc_count=$(find "$COMMAND_DIR" -maxdepth 1 -name '*.md' ! -name 'README.md' | wc -l | tr -d ' ')
assert_file_contains "$REPO_ROOT/plugin/commands/README.md" "slash command ${command_doc_count}개" 'command index should report the correct slash command count'

assert_file_contains "$README_FILE" '## 커맨드 능력 매트릭스' 'README should include a capability matrix section'
assert_file_contains "$README_FILE" '/rn-yolo-plan' 'README should mention rn-yolo-plan in capability guidance'
assert_file_contains "$README_FILE" '/rn-yolo-build' 'README should mention rn-yolo-build in capability guidance'
assert_file_contains "$README_FILE" '/rn-loop' 'README should mention rn-loop in capability guidance'
assert_file_contains "$README_FILE" '광고 없이 바로 쓰는 계산기 유틸리티 앱' 'README should include a utility app yolo example'

printf 'PASS: command docs smoke contract\n'
