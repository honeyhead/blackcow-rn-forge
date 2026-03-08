---
name: blackcow-rn-localization
description: >
  "mobile localization", "app i18n", "store localization", "locale fallback", "pluralization",
  "translated screenshots", "현지화", "다국어", "스토어 현지화", "앱 번역", "언어 우선순위"
  같은 모바일 현지화 작업일 때 사용하세요.
---

# Mobile Localization

React Native 앱의 runtime i18n, locale formatting, 스토어 현지화를 함께 다루는 스킬입니다.

## 핵심 원칙

1. UI 번역과 store localization은 분리하되 같은 용어집을 써야 해요.
2. locale 추가는 텍스트 번역이 아니라 QA 범위 확대예요.
3. push, paywall, onboarding copy는 늦게 현지화하면 전환이 깨져요.
4. fallback 정책은 명시하지 않으면 반드시 섞인 언어가 생겨요.

## 다루는 영역

- locale priority
- i18n glossary
- plural / formatting rules
- localized store assets
- localized QA scope

## 읽을 자료

- `references/localization-matrix.md`
