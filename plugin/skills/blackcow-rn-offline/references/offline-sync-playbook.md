# Offline Sync Playbook

## 1. 판단 기준

- 읽기 전용 참조 데이터: 만료 시간 기반 캐시를 우선 검토
- 사용자 draft / 작성 중 데이터: local first 저장을 우선 검토
- 결제, 권한, 계정 상태: 서버 authoritative로 두고 stale 표시를 명확히 표기
- 이미지, 동영상, 첨부파일: 파일 시스템과 업로드 큐를 분리

## 2. 저장소 책임 분리

- secure key/value: token, refresh credential, 민감한 플래그
- local database: 리스트, 상세, draft, sync metadata
- file system: 대용량 media, 임시 업로드 파일
- in-memory cache: 세션 중 재계산 비용이 큰 값

## 3. sync contract

- mutation마다 client-generated idempotency key를 둔다
- queue item에는 createdAt, retryCount, entityType, entityId, payload hash를 둔다
- 서버 응답은 merged resource와 serverUpdatedAt를 반환하도록 맞춘다
- reconnect, foreground resume, manual refresh, pull-to-refresh를 sync trigger로 구분한다

## 4. 충돌 해결 기본형

- server wins: 권한, 결제, 계정 상태
- client wins: 아직 서버에 반영되지 않은 초안
- field merge: 코멘트, 태그, 설정 일부
- manual resolution: 사용자 작업 손실 위험이 큰 문서형 데이터

## 5. UX 규칙

- stale data는 최신 데이터처럼 보이게 두지 않는다
- optimistic update 실패 시 되돌림 메시지와 재시도 경로를 둔다
- offline 작성 성공과 서버 반영 성공을 같은 상태로 취급하지 않는다
- 계정 전환이나 로그아웃 시 이전 사용자 local data 제거 규칙을 문서화한다

## 6. 계측 항목

- queue depth
- retry success rate
- sync completion latency
- duplicate mutation rate
- stale read age
- offline session share

## 7. 필수 문서

- `docs/data/storage-map.md`
- `docs/data/offline-strategy.md`
- `docs/data/sync-conflicts.md`
