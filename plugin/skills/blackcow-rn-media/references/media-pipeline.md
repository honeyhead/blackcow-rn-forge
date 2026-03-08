# Media Pipeline

## 1. entry point 분리

- camera capture
- gallery import
- document picker
- server-side generated asset fetch

entry point마다 permission, mime type, size 제약이 다르므로 한 흐름으로 뭉개지 않는다.

## 2. 파일 수명주기

- raw asset
- normalized asset
- temp local file
- queued upload
- uploaded remote asset
- cached thumbnail / preview

단계마다 file path, mime type, checksum, upload status를 추적한다.

## 3. 업로드 정책

- 큰 파일은 chunking 또는 resumable upload 여부를 검토한다
- idempotency key로 중복 업로드를 막는다
- progress event와 실패 이유를 분리한다
- background 전송이 불안정하면 foreground resume 정책을 명시한다

## 4. 보안과 프라이버시

- EXIF 제거 여부를 정책으로 정한다
- signed URL 만료 정책을 문서화한다
- 민감한 미디어는 public CDN 캐시를 기본값으로 두지 않는다
- 계정 삭제 시 remote asset cleanup 정책을 둔다

## 5. 캐시 규칙

- 썸네일과 원본 캐시를 분리한다
- low storage 상황에서 삭제 우선순위를 둔다
- private asset은 로그아웃 시 캐시 정리를 검토한다

## 6. QA 체크

- 업로드 중 앱 background 전환
- flaky network에서 retry
- 권한 denied 후 복구
- 업로드 취소 후 orphan file 정리
- 여러 디바이스 해상도에서 압축 결과 확인

## 7. 필수 문서

- `docs/media/media-pipeline.md`
- `docs/media/upload-recovery.md`
- `docs/media/asset-policy.md`
