---
description: "큰 모바일 앱 작업을 여러 AI로 병렬 운영해요. 시작 전에 owner와 충돌 범위를 잠가요."
allowed-tools:
  - Agent
  - TeamCreate
  - TeamDelete
  - TaskCreate
  - TaskUpdate
  - TaskList
  - TaskGet
  - SendMessage
  - Read
  - Write
  - Edit
  - Bash
  - Glob
  - Grep
user-invocable: true
---

# rn-team

Bare React Native 앱 작업을 여러 에이전트로 나눠서 병렬 처리해요.

## 기본 운영 방식

CEO는 메인 에이전트예요. 팀원은 `SendMessage`로 직접 논의하게 하고, 타입/계약/네이티브 파일 충돌은 초기에 잠가요.

## 시작 전에 먼저 정할 것

아래를 정하지 않았으면 바로 팀을 쪼개지 말고 먼저 고정해요:

1. 이번 라운드의 완료 조건 1개
2. 공통 타입 / API / 문서 계약 owner
3. 충돌 금지 파일 (`ios/Podfile`, `android/app/build.gradle`, navigation root, env)
4. 각 팀의 수정 범위와 금지 범위
5. 중간 점검 시점과 `/rn-team-status` 확인 주기

## 이런 작업엔 쓰지 말아요

- 파일 1~2개만 고치면 끝나는 작은 작업
- owner를 나눌수록 오히려 충돌이 늘어나는 네이티브 설정 작업
- 아직 요구사항/완료 조건이 없는 상태
- release blocker를 풀기 전에 원인 파악이 먼저 필요한 상태

## 추천 팀 구성

- `native-core`: 앱 셸, 네비게이션, 설정, platform integration
- `feature-dev`: 핵심 feature flow와 domain logic
- `ui-dev`: 화면, design system, accessibility polish
- `data-sync`: auth, billing, offline sync, media pipeline
- `growth-l10n`: growth, store, localization, engagement
- `ops-release`: 테스트, observability, rollout, release, incident
- `support-care`: support inbox, refund, review response, FAQ, rating recovery

필요하면 아래 specialist를 붙여요:

- `mobile-accessibility-auditor`
- `mobile-privacy-officer`
- `mobile-device-lab-manager`
- `mobile-platform-integrator`
- `mobile-offline-architect`
- `mobile-media-engineer`
- `mobile-localization-manager`
- `mobile-rating-optimizer`
- `mobile-support-operator`
- `mobile-incident-commander`
- `mobile-rollout-manager`
- `mobile-release-manager`

## 태스크 예시

- native-core: 앱 초기화, navigation root, env, push/deep link/lifecycle
- feature-dev: 핵심 feature flow 1개
- ui-dev: theme, shared components, screen polish, localized layout guard, a11y semantics
- data-sync: auth contract, billing entitlement, offline queue, media upload
- growth-l10n: ASO, screenshot brief, locale priority, engagement copy
- ops-release: test matrix, device matrix, release plan, rollout gate, crash dashboard, incident runbook
- support-care: FAQ, review response rules, refund escalation, support triage, rating recovery

## 팀에 바로 전달할 공통 브리프

각 팀에 일을 나눌 때 최소한 아래는 같이 줘요:

- 이번 라운드 목표 1줄
- 수정 가능한 경로
- 건드리면 안 되는 경로
- 합의가 필요한 타입 / 계약 / copy
- 완료 후 제출 형식: 변경 파일, 남은 리스크, 수동 QA 항목

## 분할 원칙

1. `ios/`, `android/`, `src/` 수정 범위를 최대한 겹치지 않게 나눠요.
2. 공통 타입과 인터페이스는 먼저 정해요.
3. 네이티브 설정을 건드리는 작업은 담당자를 명확히 분리해요.
4. API 응답 형식은 팀원끼리 `SendMessage`로 먼저 합의해요.
5. release 문서는 feature가 끝난 뒤가 아니라 병렬로 작성해요.
6. offline / media / rollout처럼 서로 영향을 주는 축은 owner를 하나만 둬요.
7. locale, pricing, paywall copy는 UI 팀과 growth 팀이 동시에 승인해요.
8. support 문구와 incident comms 문구는 마케팅 문구와 분리해서 검수해요.
9. rating prompt와 support review response는 같은 KPI를 보되 owner는 분리해요.
10. analytics / ad SDK 추가는 privacy owner 승인 없이 진행하지 말아요.

## 에스컬레이션 규칙

아래는 CEO 판단으로 올리게 하세요:

- auth flow 변경
- navigation root 변경
- `ios/` 또는 `android/` 루트 설정 변경
- paywall / pricing 변경
- sync contract 변경
- accessibility blocker 발견
- privacy / consent 기준 변경
- rollout gate 변경
- device coverage 기준 변경
- incident severity 판단 충돌
- release blocker 발생

## 최종 보고

반드시 아래를 정리해요:
- 팀원별 산출물
- 충돌 가능 파일
- 수동 테스트가 필요한 디바이스 플로우
- locale / rollout / offline 관련 남은 리스크
- support / incident 관련 남은 리스크
- device coverage / rating recovery 관련 남은 리스크
- privacy / consent 관련 남은 리스크
- release blocker 여부
- 바로 다음 액션 3개
