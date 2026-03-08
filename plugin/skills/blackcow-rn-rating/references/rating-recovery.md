# Rating Recovery

## 1. review prompt 원칙

- activation 전에는 띄우지 않는다
- 최근 오류, 결제 실패, 지원 문의 직후에는 띄우지 않는다
- 성공 경험 직후에만 후보로 본다
- frequency cap을 문서화한다

## 2. negative feedback 분기

- 앱 내 불만 접수 폼
- 지원 채널 연결
- 버그 신고 템플릿

불만 사용자를 store review로 유도하는 구조는 피한다.

## 3. 모니터링 기준

- version별 평점 변화
- locale별 불만 패턴
- 기능별 불만 카테고리
- review response latency

## 4. 회복 액션

- 특정 버전 이슈면 rollout / rollback과 연계
- 반복 불만은 FAQ / empty state / onboarding copy 수정으로 연결
- billing 불만은 refund / entitlement 가이드를 같이 본다

## 5. 필수 문서

- `docs/growth/rating-strategy.md`
- `docs/ops/review-monitoring.md`
- `docs/ops/rating-recovery.md`
