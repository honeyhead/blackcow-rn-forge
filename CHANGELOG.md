# Changelog

이 문서는 `blackcow-rn-forge`의 최근 플러그인 변경 사항을 간단히 정리합니다.

## 0.6.8

- 루트에 `CHANGELOG.md`를 추가해 최근 플러그인 변경 흐름을 한눈에 확인할 수 있게 했습니다.
- `0.6.1`부터 `0.6.7`까지의 loop 안정화, command metadata 정리, README/command 예시 보강 내역을 버전별로 정리했습니다.

## 0.6.7

- 모든 `plugin/commands/*.md` 문서에 `예시 입력` 블록을 추가해 command 문서 본문만 봐도 바로 실행 예시를 확인할 수 있게 했습니다.
- product, quality, core flow, growth/ops, release, team/loop 카테고리별 예시 톤을 README와 일치시켰습니다.

## 0.6.6

- `README.md`의 전체 커맨드 표 아래에 카테고리별 대표 입력 예시를 추가했습니다.
- Build/Product, Quality/Compliance, Core Flows/Platform, Growth/Store/Operations, Release/Testing, Team/Automation 각각에 바로 복붙 가능한 예시를 넣었습니다.

## 0.6.5

- `README.md`의 Quick Start와 핵심 시작 커맨드 예시를 실제 입력형 예시로 바꿨습니다.
- `/rn-planner`, `/rn-bootstrap`, `/rn-architect`, `/rn-release-manager`, `/rn-loop`의 시작 문맥을 더 쉽게 이해할 수 있도록 문서를 보강했습니다.

## 0.6.4

- 운영/협업 계열 커맨드에 `argument-hint`를 추가해 slash command 입력 UX를 통일했습니다.
- `rn-accessibility-guard`, `rn-designer`, `rn-device-lab`, `rn-incident-manager`, `rn-localization-manager`, `rn-rating-manager`, `rn-rollout-manager`, `rn-support-ops`, `rn-team`, `rn-team-status`에 입력 힌트를 보강했습니다.

## 0.6.3

- 설계와 품질 중심 커맨드에 `argument-hint`를 추가했습니다.
- `rn-architect`, `rn-auth-manager`, `rn-billing-manager`, `rn-platform-manager`, `rn-offline-manager`, `rn-media-manager`, `rn-release-manager`, `rn-observability`, `rn-test-lab`, `rn-ui-upgrade`, `rn-privacy-manager`, `rn-security-guard`의 입력 가이드를 정리했습니다.

## 0.6.2

- `rn-bootstrap`, `rn-engagement-manager`, `rn-growth-manager`, `rn-planner`, `rn-store-manager`에 `argument-hint`를 추가했습니다.
- 입력 기반으로 동작하는 planning 계열 커맨드가 실행 전에 더 분명한 slash hint를 보여주도록 개선했습니다.

## 0.6.1

- `/rn-loop --resume`가 `CLAUDE_CODE_SESSION_ID`가 비어 있을 때 기존 `session_id`를 유지하도록 수정했습니다.
- loop 상태 파일이 `session_id`를 중복 기록하던 문제를 해결했습니다.

## Included Earlier In This Cycle

- `/rn-loop`에 `--status`, `--resume`, `--cancel`, inactive recovery, overwrite protection, timestamp formatting 개선을 반영했습니다.
- command frontmatter와 allowed-tools 구성을 점검하고 누락된 `Edit`, `Grep`, `Bash`, `AskUserQuestion` 사용 지침을 보강했습니다.
- `README.md`와 `plugin/.claude-plugin/plugin.json`을 현재 기능과 운영 흐름에 맞게 계속 동기화했습니다.
