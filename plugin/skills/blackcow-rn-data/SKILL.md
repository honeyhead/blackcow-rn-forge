---
name: blackcow-rn-data
description: >
  "supabase mobile", "react native backend", "auth session", "offline sync",
  "postgres best practices", "rls", "storage", "realtime", "모바일 백엔드",
  "앱 데이터 구조" 같은 React Native 데이터 계층 작업일 때 사용하세요.
---

# Mobile Data Layer

React Native 앱에서 백엔드와 동기화 계층을 설계할 때 쓰는 스킬입니다.

## 원칙

1. 모바일은 네트워크 실패를 기본 상태로 가정해요.
2. 인증 토큰 저장 위치와 갱신 전략을 먼저 정해요.
3. RLS, signed URL, file path 정책을 같이 설계해요.
4. optimistic update와 복구 전략을 문서화해요.

## 설계 항목

- auth provider
- session persistence
- query and cache model
- offline mutation retry
- file upload flow
- notification token sync
- analytics identity stitching

## 읽을 자료

- `references/supabase-mobile.md`
