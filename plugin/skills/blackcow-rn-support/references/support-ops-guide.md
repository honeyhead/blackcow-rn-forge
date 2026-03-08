# Support Ops Guide

## 1. 문의 분류

- auth / account recovery
- billing / refund / entitlement
- crash / performance / bug
- feature request
- review complaint

## 2. 필수 수집 정보

- app version
- OS version
- device model
- locale
- user id 또는 support-safe identifier
- 재현 단계

민감한 토큰, 결제 원문, 전체 로그를 무조건 수집하지 않는다.

## 3. escalation 기준

- 다수 사용자에 동시에 발생하는 결제 문제
- auth restore 실패 급증
- 특정 버전 crash spike
- store review에서 반복적으로 같은 blocker 제기

## 4. refund / compensation

- 자동 환불 가능한 범위와 수동 승인 범위를 분리한다
- 크레딧, trial extension, manual restore를 어떤 경우에 허용하는지 적는다
- billing provider와 app store 정책이 충돌할 때 우선순위를 정한다

## 5. review response

- 사실 확인이 안 된 상태에서 원인 단정 금지
- 지원 채널로 유도할 때 필요한 정보를 명확히 적는다
- 공개 답변에는 PII를 절대 포함하지 않는다

## 6. 필수 문서

- `docs/ops/support-playbook.md`
- `docs/ops/review-response-matrix.md`
- `docs/ops/refund-escalation.md`
