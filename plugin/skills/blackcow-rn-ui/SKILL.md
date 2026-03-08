---
name: blackcow-rn-ui
description: >
  "react native ui", "mobile design system", "앱 UI", "모바일 디자인",
  "screen builder", "safe area", "touch target", "reanimated", "gesture",
  "design tokens" 등 React Native 앱 UI 구축이나 개선 시 사용하세요.
---

# React Native UI

앱 UI 구축과 모바일 UX 감사에 쓰는 스킬입니다.

## 원칙

1. 웹 레이아웃을 그대로 옮기지 말아요.
2. safe area, thumb reach, scroll context를 먼저 봐요.
3. 디자인 토큰을 먼저 만들고 컴포넌트에 적용해요.
4. 입력/로딩/빈 상태를 항상 포함해요.
5. 애니메이션은 Reanimated로 의미 있게만 써요.

## 체크리스트

- `ScrollView` 대신 리스트 성격이면 `FlatList`를 검토했는지
- CTA가 엄지 손가락 구간에 있는지
- `accessibilityLabel` 이 필요한 요소가 빠지지 않았는지
- dynamic type, dark mode, small screen에서 깨지지 않는지

## 읽을 자료

- 토큰/패턴은 `references/mobile-ui-patterns.md`
