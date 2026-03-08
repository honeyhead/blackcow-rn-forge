---
name: blackcow-rn-billing
description: >
  "mobile billing", "revenuecat", "iap", "in-app purchase", "subscription flow",
  "entitlement", "restore purchase", "storekit", "play billing", "모바일 과금",
  "구독 플로우" 같은 모바일 과금 작업일 때 사용하세요.
---

# Mobile Billing

React Native 앱의 subscription, IAP, entitlement 모델을 다루는 스킬입니다.

## 핵심 원칙

1. pricing 문서와 billing 구현 문서를 분리하되 연결해요.
2. paywall 자체보다 entitlement 동기화가 더 중요해요.
3. restore purchase와 cancellation 이후 상태를 반드시 다뤄요.
4. provider 선택은 구현뿐 아니라 운영 비용으로 판단해요.

## 다루는 영역

- provider selection
- product mapping
- entitlement model
- paywall flow
- restore purchase
- server validation

## 읽을 자료

- `references/billing-provider-matrix.md`
