---
name: blackcow-rn-auth
description: >
  "react native auth", "mobile auth", "session restore", "oauth callback",
  "deep link auth", "social login", "magic link", "모바일 인증", "세션 복구",
  "OAuth callback" 같은 모바일 인증 작업일 때 사용하세요.
---

# Mobile Auth

React Native 앱의 인증, 세션 복구, OAuth callback 흐름을 다루는 스킬입니다.

## 핵심 원칙

1. 로그인 성공보다 세션 복구가 더 중요할 때가 많아요.
2. OAuth와 deep link callback은 같이 설계해요.
3. auth state source of truth를 하나로 두세요.
4. sign out, token expiry, account switch도 초기에 정의해요.

## 다루는 영역

- auth provider selection
- session persistence
- oauth callback flow
- protected navigation
- token refresh and expiry

## 읽을 자료

- `references/mobile-auth-patterns.md`
