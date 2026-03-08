---
name: blackcow-rn-privacy
description: >
  "mobile privacy", "ATT", "tracking consent", "data deletion", "store privacy disclosure",
  "account deletion", "프라이버시", "앱 추적 투명성", "동의 관리", "데이터 삭제" 같은 모바일 프라이버시 작업일 때 사용하세요.
---

# Mobile Privacy Operations

React Native 앱의 ATT, consent, privacy disclosure, account deletion 운영을 다루는 스킬입니다.

## 핵심 원칙

1. privacy는 policy 문서가 아니라 데이터 흐름 설계 문제예요.
2. analytics, attribution, ads SDK 추가는 disclosure 변경과 같이 가야 해요.
3. account deletion은 UI 버튼이 아니라 실제 데이터 lifecycle까지 포함해요.
4. consent와 permission rationale은 서로 다른 목적이므로 분리해요.

## 다루는 영역

- data inventory
- ATT timing
- consent strategy
- disclosure mapping
- deletion workflow

## 읽을 자료

- `references/privacy-checklist.md`
