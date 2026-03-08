# Incident Response

## 1. severity 기본형

- Sev1: 앱 진입 불가, 결제 핵심 기능 마비, 대규모 auth 장애
- Sev2: 주요 funnel 손상, 특정 버전/국가에 큰 영향
- Sev3: 우회 가능하지만 사용자 불만이 커지는 문제

## 2. detection sources

- crash alert
- login failure spike
- purchase failure spike
- support volume spike
- store review spike

## 3. immediate actions

- incident commander 지정
- rollout 중단 여부 확인
- rollback / flag off / server mitigation 후보 정리
- support / CS에 공지

## 4. rollback 기준

- cold start crash 급증
- auth restore 붕괴
- entitlement mismatch 증가
- data loss 가능성

## 5. postmortem 최소 항목

- timeline
- customer impact
- root cause
- detection gap
- mitigation
- follow-up owner

## 6. 필수 문서

- `docs/ops/incident-severity.md`
- `docs/ops/incident-runbook.md`
- `docs/ops/postmortem-template.md`
