---
description: "현재 워크스페이스와 최신 yolo brief/PRD를 읽고 pre-ops readiness까지 빠르게 밀어요."
argument-hint: "[선택적 한 줄 목표 / 특정 plan 힌트]"
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
  - WebSearch
  - WebFetch
user-invocable: true
---

# rn-yolo-build

예시 입력:

```text
/rn-yolo-build
```

당신은 YOLO 모드 빌더예요. 현재 워크스페이스와 최신 yolo brief/PRD를 읽고, 빠르게 출시 가능한 Bare React Native MVP를 pre-ops readiness 직전까지 밀어붙이세요.

모든 출력은 한국어로 작성해요. 앱 이름 slug를 다시 요구하지 말고, 기본값은 현재 프로젝트예요.

## Step 1: 대상 컨텍스트 결정

아래 순서로 대상을 정해요:

1. 사용자가 명시적으로 한 줄 힌트를 주면 우선 사용
2. 현재 워크스페이스의 `package.json`, `ios/`, `android/`, `src/`, `app/` 확인
3. `docs/yolo-build-brief.md` 읽기
4. `docs/mobile-prd/*.md` 중 가장 최근이거나 현재 프로젝트와 맞는 PRD 읽기

하나의 대상이 분명하면 바로 진행해요. 후보가 여러 개고 어떤 PRD를 써야 할지 명확하지 않을 때만 `AskUserQuestion`으로 짧게 한 번 물어요.

## Step 2: 작업 범위

기본 범위는 아래까지만이에요:

1. 필요한 경우 Bare RN 앱 셸 생성 또는 현재 프로젝트 보강
2. MVP 화면 / 상태 / 핵심 로직 구현
3. 최소 테스트 및 수동 QA 경로 정리
4. observability 최소 세팅
5. release 문서와 QA matrix 작성

기본적으로 제외할 범위:

- growth 세부 운영
- support / refund / incident 운영
- 과한 실험 체계
- tablet / enterprise / multi-tenant 확장

## Step 3: 실행 순서

반드시 아래 순서로 움직여요:

1. plan/brief와 현재 구조 읽기
2. 앱 셸과 구조 보강
3. P0 화면과 핵심 플로우 구현
4. 광고 / 부스터 / 과금 / analytics 중 필수 축만 연결
5. `docs/mobile-architecture.md` 갱신
6. `docs/observability/`와 `docs/release/` 문서 최소 세트 작성
7. 가능한 테스트, 빌드, 수동 QA 수행

## Step 4: 문서와 산출물

가능하면 아래를 생성하거나 갱신해요:

- `docs/mobile-architecture.md`
- `docs/observability/analytics-map.md`
- `docs/observability/post-release-dashboard.md`
- `docs/release/release-plan.md`
- `docs/release/store-checklist.md`
- `docs/release/qa-matrix.md`

이미 같은 문서가 있으면 새 파일을 하나 더 만들기보다 현재 결정에 맞게 이어서 갱신해요.

## Step 5: YOLO 모드 규칙

아래 원칙을 지켜요:

- 가장 빠른 출시 가능한 범위를 우선해요.
- 품질이 조금 떨어져도 출시 가능한 MVP를 먼저 완성해요.
- 하지만 빌드/런타임/핵심 과금/광고/로그인/크래시 리스크는 무시하지 말아요.
- 지금 당장 안 필요한 고급 추상화는 만들지 말아요.
- 현재 워크스페이스를 기본값으로 삼고, slug 없이 진행해요.
- 현재 프로젝트가 비어 있고 plan도 없으면 `/rn-yolo-plan`을 먼저 쓰라고 안내해요.

## Step 6: 종료 조건

아래를 만족하면 이번 라운드를 끝내요:

- P0 화면과 핵심 루프가 구현됨
- 최소한의 observability / release 문서가 작성됨
- 실행하거나 확인한 테스트 / 빌드 / 수동 QA 결과가 있음
- 바로 출시를 막는 blocker가 명확히 정리됨

## Step 7: 최종 보고

항상 아래를 같이 정리해요:

- 이번에 실제로 만든 것
- 아직 비워둔 것
- 지금 출시를 막는 blocker 3개
- 직접 확인한 빌드 / 테스트 / 수동 QA 결과
- 다음 액션 3개
