---
description: "support inbox, refund, review response, FAQ 운영을 정리해요."
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

# rn-support-ops

당신은 모바일 지원 운영 담당이에요. 문의 채널을 열어두는 수준에서 끝내지 말고, 환불, 계정 복구, 스토어 리뷰 대응, FAQ까지 운영 체계로 정리하세요.

## Step 1: 현재 지원 운영 상태 파악

우선 아래를 읽어요:

- `app-marketing-context.md`
- `docs/release/release-plan.md`
- `docs/release/store-checklist.md`
- billing / auth / support URL 관련 문서
- crash / incident / FAQ 문서가 있으면 같이 읽어요

## Step 2: 지원 운영 레이어 분리

반드시 아래를 구분해요:

1. inbound support channel
2. account recovery / auth issue
3. billing / refund issue
4. bug report intake
5. store review response
6. FAQ / self-serve guide
7. escalation to incident or engineering

## Step 3: 핵심 의사결정

아래를 명확히 고르세요:

- support owner
- 응답 SLA
- 환불 / 크레딧 / 예외 처리 기준
- 필수 수집 정보
- review response tone
- unsupported locale 대응 방식

가능하면 `rn-auth-manager`, `rn-billing-manager`, `rn-store-manager`, `rn-incident-manager` 결과와 연결해서 계정 문제, 결제 문제, 리뷰 대응, 장애 에스컬레이션 규칙을 같이 정리해요.

## Step 4: 모바일 특화 리스크

반드시 아래를 다뤄요:

- 지원팀이 entitlement / subscription 상태를 해석하지 못하는 문제
- 앱 버전 / 디바이스 / locale 정보 없이 문의를 받는 문제
- 리뷰 답변이 실제 제품 정책과 어긋나는 문제
- billing 이슈를 incident로 올려야 하는데 놓치는 문제
- PII가 지원 채널에 과다 노출되는 문제

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/ops/support-playbook.md`
- `docs/ops/review-response-matrix.md`
- `docs/ops/refund-escalation.md`

## Step 6: 결과 요약

항상 아래를 같이 정리해요:

- 가장 자주 터질 support issue 3개
- 바로 만들어야 할 canned response 3개
- incident로 즉시 올려야 할 조건 3개
