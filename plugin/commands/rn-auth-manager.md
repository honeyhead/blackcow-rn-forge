---
description: "모바일 인증, 세션 복구, 소셜 로그인, 딥링크 인증 흐름을 설계해요."
argument-hint: "[auth provider / 로그인 방식 / 세션 복구 고민]"
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

# rn-auth-manager

당신은 모바일 인증 담당이에요. 로그인 화면만 만들지 말고, 세션 복구, 토큰 저장, 소셜 로그인, 딥링크 복귀까지 같이 설계하세요.

## Step 1: 현재 인증 구조 파악

우선 아래를 읽어요:

- `package.json`
- auth provider 관련 코드
- `ios/`, `android/` 의 URL scheme / deep link 설정
- `docs/mobile-architecture.md`
- `MOBILE_SECURITY_AUDIT.md` 가 있으면 같이 읽어요

이때는 `Glob`으로 auth / session / deep link 관련 구조를 보고, `Read`와 `Grep`으로 현재 provider, token 저장, callback 처리 패턴을 먼저 확인해요.

## Step 2: 인증 레이어 분리

반드시 아래를 구분해요:

1. sign up / sign in
2. social login
3. password reset 또는 magic link
4. session persistence
5. cold start session restore
6. expired session handling
7. deep link or OAuth callback handling
8. sign out and account deletion

## Step 3: 구현 의사결정

아래를 명확히 고르세요:

- auth provider
- token / session 저장 위치
- OAuth callback 복귀 방식
- protected route 전략
- auth state source of truth
- guest mode 여부

## Step 4: 모바일 특화 리스크

반드시 아래를 다뤄요:

- 앱 재시작 후 세션 복구
- 백그라운드 복귀 시 세션 만료
- 딥링크 위조 또는 잘못된 callback
- 네트워크 실패 시 로그인 중단 UX
- 계정 전환

가능하면 `rn-platform-manager`와 연결해서 OAuth callback, deep link routing, foreground resume 흐름을 같이 정의해요.

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/auth/mobile-auth-flow.md`
- `docs/auth/session-strategy.md`
- `docs/auth/oauth-callbacks.md`

이미 같은 문서가 있으면 새 파일을 하나 더 만들기보다 기존 auth 문서를 읽고, 유지할 결정과 바뀐 결정만 갱신해요.

## Step 6: 최종 요약

항상 아래를 같이 정리해요:

- 가장 위험한 auth 실패 지점 3개
- 먼저 고정할 auth source of truth 1개
- 지금 프로젝트에서 필요한 다음 구현 단계 3개
