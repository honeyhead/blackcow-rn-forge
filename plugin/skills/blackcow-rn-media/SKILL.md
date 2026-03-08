---
name: blackcow-rn-media
description: >
  "react native media upload", "image picker", "camera flow", "video upload", "signed url",
  "background transfer", "thumbnail cache", "미디어 업로드", "카메라 플로우", "파일 업로드",
  "이미지 캐시" 같은 모바일 미디어 처리 작업일 때 사용하세요.
---

# Mobile Media Pipeline

React Native 앱의 media capture, upload, download cache, background recovery를 다루는 스킬입니다.

## 핵심 원칙

1. media feature는 UI보다 파일 수명주기와 실패 복구가 더 중요해요.
2. 원본 파일, 가공본, 업로드 상태를 같은 개념으로 취급하지 말아요.
3. large file은 memory, battery, network 비용을 같이 봐야 해요.
4. private media는 URL 노출 정책과 cache 정책을 같이 설계해요.

## 다루는 영역

- picker / camera flow
- compression policy
- upload queue
- download cache
- asset privacy rules

## 읽을 자료

- `references/media-pipeline.md`
