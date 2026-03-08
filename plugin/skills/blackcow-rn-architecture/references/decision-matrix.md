# Mobile Architecture Decision Matrix

## Navigation

- 단순 앱: native-stack + bottom-tabs
- 모달 흐름 많음: root stack + modal group
- 인증 흐름 분리 필요: auth stack / app stack 분리

## State

- 서버 상태: React Query
- UI 상태: Zustand 또는 Jotai
- 폼 상태: React Hook Form

## Storage

- 세션/민감 토큰: Keychain 또는 Keystore 기반 래퍼
- 빠른 비민감 캐시: MMKV
- 장기 캐시/동기화 메타: SQLite 또는 자체 캐시 전략 검토

## Release channels

- `dev`: 로컬 개발
- `stage`: QA, 실기기 검증
- `prod`: 출시 빌드
