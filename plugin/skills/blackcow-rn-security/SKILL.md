---
name: blackcow-rn-security
description: >
  "mobile security", "react native security", "token storage", "deep link security",
  "webview security", "jailbreak", "root detection", "certificate pinning",
  "모바일 보안", "앱 보안", "토큰 저장", "딥링크 검증" 같은 모바일 보안 작업일 때 사용하세요.
---

# Mobile Security

React Native 앱 보안을 다루는 스킬입니다.

## 핵심 원칙

1. 서버 보안만 봐서는 모바일 앱 보안을 커버하지 못해요.
2. 앱 번들에 들어가는 값은 모두 노출 가능하다고 가정해요.
3. 토큰 저장 위치, deep link, WebView, 디버그 설정을 우선 봐요.
4. 민감 정보는 "전송"뿐 아니라 "표시"와 "로그"도 같이 봐요.

## 점검 범주

- secrets in bundle
- session storage
- deep link validation
- webview bridge exposure
- debug / test endpoints
- screenshot and background privacy
- network protections
- device integrity assumptions

## 읽을 자료

- `references/mobile-threat-model.md`
