---
description: "camera, gallery, upload, cache, background transfer 파이프라인을 정리해요."
argument-hint: "[media 유형 / 업로드 흐름 / 용량·권한 제약]"
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

# rn-media-manager

예시 입력:

```text
/rn-media-manager 사진 업로드, 압축, 재시도, 백그라운드 복구 흐름을 설계해줘
```

당신은 모바일 media pipeline 담당이에요. 사진/영상 선택 기능만 만들지 말고, 권한, 압축, 임시 저장, 업로드 복구, 다운로드 캐시까지 같이 설계하세요.

## Step 1: 현재 미디어 흐름 파악

우선 아래를 읽어요:

- `package.json`
- camera / image picker / file system / upload 관련 코드
- storage / signed URL / CDN 관련 코드
- `docs/platform/permission-strategy.md`
- `docs/data/offline-strategy.md`
- `docs/mobile-architecture.md`

이때는 `Glob`으로 media / upload / storage 관련 구조를 보고, `Read`와 `Grep`으로 현재 permission, compression, retry, cache, signed URL 패턴을 먼저 확인해요.

## Step 2: 미디어 파이프라인 분리

반드시 아래를 구분해요:

1. capture / import entry point
2. permission request timing
3. resize / compress / transcode 단계
4. temp file storage
5. upload queue와 progress tracking
6. background resume / retry
7. media download / thumbnail cache
8. delete / replace / orphan cleanup 정책

## Step 3: 핵심 의사결정

아래를 명확히 고르세요:

- 지원할 media type
- 최대 용량 / 해상도 정책
- background upload 허용 여부
- signed URL / public URL 정책
- client-side compression 기준
- upload 취소 / 재시도 UX

가능하면 `rn-offline-manager`, `rn-platform-manager`, `rn-security-guard`, `rn-observability` 결과와 연결해서 권한, 재시도, private asset 노출, upload failure metric을 같이 정의해요.

## Step 4: 모바일 특화 리스크

반드시 아래를 다뤄요:

- 대용량 파일로 메모리 급증
- EXIF / 위치 정보 유출
- temp file 누적으로 저장소 오염
- 업로드 실패 후 서버 레코드와 파일 상태 불일치
- Android content URI 와 iOS asset identifier 처리 차이

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/media/media-pipeline.md`
- `docs/media/upload-recovery.md`
- `docs/media/asset-policy.md`

이미 같은 문서가 있으면 새 파일을 하나 더 만들기보다 기존 media 문서를 읽고, 유지할 정책과 바뀐 파이프라인 규칙만 갱신해요.

## Step 6: 결과 요약

항상 아래를 같이 정리해요:

- 가장 위험한 media bug 3개
- 먼저 정해야 할 용량/품질 기준 3개
- 다음 구현 단계 3개
