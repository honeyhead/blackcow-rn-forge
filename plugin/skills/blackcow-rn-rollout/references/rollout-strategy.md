# Rollout Strategy

## 1. 채널 모델

- dev: 개발자 검증과 실험용
- stage: QA, internal dogfooding, partner 검증용
- prod: 사용자 배포용

채널마다 API endpoint, analytics environment, feature flag namespace를 분리한다.

## 2. staged rollout 기본형

- 1%: crash, auth, billing, startup latency 확인
- 5%: 주요 funnel drop 여부 확인
- 20%: 국가/디바이스 편향 확인
- 50%: 운영팀 대응 가능 범위 확인
- 100%: 주요 gate 통과 후 승격

프로젝트 특성상 위험도가 높으면 단계 수를 늘리고, 위험도가 낮아도 0%에서 바로 100%로 가지 않는다.

## 3. release gate 예시

- crash-free session threshold
- login success rate threshold
- paywall open to purchase conversion threshold
- deep link open failure threshold
- p95 startup time threshold

## 4. rollback trigger 예시

- auth failure 급증
- billing entitlement mismatch
- cold start crash spike
- push / deep link route breakage
- 데이터 마이그레이션 실패

## 5. feature flag 규칙

- flag는 owner, expiry date, rollback value를 가진다
- binary dependency가 있는 기능은 flag만으로 안전하다고 가정하지 않는다
- QA matrix는 flag 조합 폭증을 제한하도록 우선순위를 둔다

## 6. hotfix 정책

- hotfix는 diff를 최소화한다
- auth, billing, migration, routing 변경은 hotfix라도 별도 회귀를 거친다
- hotfix 배포 후 normal release train으로 반드시 재흡수한다

## 7. 필수 문서

- `docs/release/channel-strategy.md`
- `docs/release/rollout-playbook.md`
- `docs/release/hotfix-policy.md`
