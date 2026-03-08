---
name: blackcow-rn-architecture
description: >
  "react native architecture", "bare react native", "mobile architecture",
  "앱 아키텍처", "네비게이션 구조", "offline first", "sync strategy",
  "feature folder", "native module boundary", "build flavor" 같은 Bare React Native
  구조 설계 작업일 때 사용하세요.
---

# Bare React Native Architecture

Bare React Native 앱 구조를 설계하거나 리뷰할 때 쓰는 스킬입니다.

## 핵심 원칙

1. 모바일 앱은 화면 중심이 아니라 기능 단위로 분리해요.
2. 전역 상태와 서버 상태를 분리해요.
3. 인증 토큰, 캐시, 오프라인 큐는 저장 계층을 명확히 나눠요.
4. `ios/`, `android/`, JS 레이어 경계를 문서로 남겨요.
5. dev / stage / prod 환경 분리는 초기에 잡아요.

## 기본 구조

```text
src/
  app/
  navigation/
  features/
  services/
  store/
  lib/
  theme/
  types/
```

## 의사결정 체크리스트

- 네비게이션은 stack, tabs, modal을 어떻게 조합할지
- 인증 가드가 어느 레이어에 있는지
- 서버 상태는 `@tanstack/react-query` 같은 레이어로 분리됐는지
- 로컬 저장은 `MMKV`와 캐시 저장이 역할 분리가 됐는지
- 오프라인에서 재시도 큐가 필요한지
- 에러 추적과 사용자 메시지가 분리됐는지

## 읽을 자료

- 오프라인/상태/환경 분리가 필요하면 `references/decision-matrix.md`
- Supabase 연동이 핵심이면 `../blackcow-rn-data/references/supabase-mobile.md`
