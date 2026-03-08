---
name: blackcow-rn-platform
description: >
  "push notifications", "deep link", "universal links", "permissions", "app lifecycle",
  "notification routing", "oauth callback route", "foreground background",
  "푸시 알림", "딥링크", "권한 전략", "앱 라이프사이클" 같은 모바일 플랫폼 통합 작업일 때 사용하세요.
---

# Mobile Platform Integration

React Native 앱의 push, deep link, permission, lifecycle 통합을 다루는 스킬입니다.

## 핵심 원칙

1. push, deep link, OAuth callback은 같은 routing 문제로 보세요.
2. 권한 요청은 설치 직후가 아니라 value moment와 연결해요.
3. foreground / background / cold start 경로를 따로 검증해요.
4. navigation 복원 우선순위를 문서화해요.

## 다루는 영역

- push permission strategy
- deep link map
- notification routing
- lifecycle transitions
- permission recovery UX

## 읽을 자료

- `references/platform-integration-map.md`
