---
description: "앱 분석, 크래시, 성능 관측 체계를 정리해요."
argument-hint: "[analytics/crash 도구 / 핵심 KPI / 알람 기준 고민]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebSearch
  - WebFetch
user-invocable: true
---

# rn-observability

예시 입력:

```text
/rn-observability analytics, crash, release health 운영 체계를 정리해줘
```

당신은 모바일 observability 담당이에요. analytics, crash reporting, performance를 따로 보지 말고, 출시 후 의사결정이 가능한 운영 체계로 묶으세요.

## Step 1: 현재 계측 상태 파악

우선 아래를 읽어요:

- `package.json`
- analytics / crash / performance 관련 의존성
- `app-marketing-context.md`
- `docs/growth/analytics-plan.md`
- `docs/release/release-plan.md`

이때는 `Glob`으로 analytics / crash / performance 관련 구조를 보고, `Read`와 `Grep`으로 현재 이벤트 이름, release health, alert 기준, dashboard 목적을 먼저 확인해요.

## Step 2: 계측 레이어 분리

반드시 아래를 구분해요:

1. product analytics
2. attribution or acquisition analytics
3. crash reporting
4. performance monitoring
5. release health metrics

## Step 3: 필수 이벤트와 상태

최소한 아래는 빠지면 안 돼요:

- app install / first open
- onboarding start / complete
- activation event
- paywall viewed / purchase result
- session restored
- push received / opened
- deep link opened
- fatal / non-fatal error
- API latency hotspot
- screen load hotspot

가능하면 `rn-engagement-manager`와 연결해서 push open, comeback, referral, review prompt 이벤트도 같이 정의해요.
과금/인증 기능이 있으면 `rn-auth-manager`, `rn-billing-manager`와 연결해서 auth restore, purchase restore, entitlement mismatch 이벤트를 같이 정의해요.
platform 기능이 있으면 `rn-platform-manager`와 연결해서 permission prompt, notification open, deep link entry 이벤트를 같이 맞춰요.

## Step 4: 운영 문서화

다음 질문에 답하도록 문서를 작성해요:

- 출시 첫 주에 매일 봐야 할 숫자는 무엇인지
- 즉시 알람이 필요한 크래시 기준은 무엇인지
- 성능 저하를 어떤 지표로 볼지
- 어떤 이벤트가 revenue / retention 해석에 연결되는지

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/observability/analytics-map.md`
- `docs/observability/crash-playbook.md`
- `docs/observability/performance-budget.md`
- `docs/observability/post-release-dashboard.md`

이미 같은 문서가 있으면 새 파일을 하나 더 만들기보다 기존 observability 문서를 읽고, 유지할 지표와 바뀐 운영 기준만 갱신해요.

## Step 6: 결과 요약

항상 아래를 같이 정리해요:

- 현재 안 보이는 위험 3개
- 출시 전에 꼭 심어야 할 이벤트 3개
- 출시 후 매일 확인할 지표 3개
