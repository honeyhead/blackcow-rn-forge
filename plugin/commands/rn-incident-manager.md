---
description: "sev 기준, triage, rollback, comms, postmortem 운영을 정리해요."
argument-hint: "[주요 장애 시나리오 / sev 기준 / rollback 고민]"
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

# rn-incident-manager

당신은 모바일 인시던트 담당이에요. 알람을 받는 데서 끝내지 말고, severity 분류, rollback, 사용자 커뮤니케이션, postmortem까지 운영 규칙으로 설계하세요.

## Step 1: 현재 대응 체계 파악

우선 아래를 읽어요:

- `docs/observability/crash-playbook.md`
- `docs/release/rollout-playbook.md`
- `docs/release/hotfix-policy.md`
- `docs/release/qa-matrix.md`
- `docs/ops/support-playbook.md`

이때는 `Glob`으로 incident / ops / release 관련 구조를 보고, `Read`와 `Grep`으로 현재 severity 기준, rollback, escalation, postmortem 패턴을 먼저 확인해요.

## Step 2: 인시던트 레이어 분리

반드시 아래를 구분해요:

1. detection and alerting
2. severity classification
3. incident commander / owner
4. mitigation / rollback path
5. internal communication
6. user-facing communication
7. postmortem and follow-up owner

## Step 3: 핵심 의사결정

아래를 명확히 고르세요:

- Sev 기준
- incident commander 지정 방식
- rollback owner
- public comms 여부와 채널
- hotfix / rollback 선택 기준
- postmortem SLA

가능하면 `rn-observability`, `rn-rollout-manager`, `rn-release-manager`, `rn-support-ops` 결과와 연결해서 detection, mitigation, support escalation을 한 문서 체계로 맞춰요.

## Step 4: 모바일 특화 리스크

반드시 아래를 다뤄요:

- cold start crash로 앱이 열리지 않는 문제
- auth restore 실패로 대규모 로그아웃이 나는 문제
- entitlement mismatch로 결제가 막히는 문제
- deep link / push route 오작동이 특정 버전에만 발생하는 문제
- staged rollout 중 signal 해석이 늦어지는 문제

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/ops/incident-severity.md`
- `docs/ops/incident-runbook.md`
- `docs/ops/postmortem-template.md`

이미 같은 문서가 있으면 새 파일을 하나 더 만들기보다 기존 incident 문서를 읽고, 유지할 대응 규칙과 바뀐 escalation 기준만 갱신해요.

## Step 6: 결과 요약

항상 아래를 같이 정리해요:

- Sev1 조건 3개
- 즉시 rollback 해야 할 조건 3개
- 다음 출시 전에 미리 준비할 대응 항목 3개
