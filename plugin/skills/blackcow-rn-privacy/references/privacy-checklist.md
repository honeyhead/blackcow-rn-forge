# Privacy Checklist

## 1. inventory

- 수집하는 이벤트와 속성
- 광고/어트리뷰션 SDK
- crash / session replay / support tooling
- 사용자 업로드 미디어와 보관 기간

## 2. consent

- analytics consent와 tracking consent를 구분한다
- ATT는 가치 설명 이후에만 검토한다
- locale별 consent copy와 fallback을 확인한다

## 3. disclosure

- App Store / Play Store disclosure와 실제 SDK 동작을 맞춘다
- 새 SDK 추가 시 disclosure 업데이트 owner를 둔다
- vendor별 data retention과 sharing 범위를 문서화한다

## 4. deletion

- account deletion
- data export
- media cleanup
- support-safe restoration 범위

UI 흐름과 backend 실제 삭제 범위를 혼동하지 않는다.

## 5. 필수 문서

- `docs/privacy/data-inventory.md`
- `docs/privacy/consent-strategy.md`
- `docs/privacy/store-disclosure-map.md`
