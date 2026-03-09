---
name: blackcow-rn-admob-rewarded
description: >
  "admob rewarded ad", "rewarded interstitial", "server-side verification",
  "impression-level revenue", "onuserearnedrewardlistener", "리워디드 광고",
  "보상형 광고", "애드몹 보상형 광고" 같은 모바일 보상형 광고 전략 작업일 때 사용하세요.
---

# AdMob Rewarded Ads

React Native 앱의 AdMob rewarded ad / rewarded interstitial 전략을 다루는 스킬입니다.
일반 paywall, subscription, IAP pricing, 배너/일반 interstitial 운영은 `blackcow-rn-growth`와 `blackcow-rn-billing`으로 넘기고, 여기서는 AdMob rewarded ad의 정책, 보상 설계, 계측, 실험에 집중해요.

## 핵심 원칙

1. rewarded ads는 정상 사용 흐름을 막지 않아요.
2. 보상은 앱 안에서만 쓰는 비현금성 가치로 제한하고, paid-to-watch 구조는 피해야 해요.
3. 보상 지급은 earned reward callback 또는 SSV 검증 기준으로 처리해요.
4. AdMob revenue만 보지 말고 retention, IAP cannibalization, policy risk를 같이 봐요.

## 다루는 영역

- RewardedAd / RewardedInterstitialAd lifecycle
- FullScreenContentCallback and OnUserEarnedRewardListener handling
- reward type gate and economy caps
- SSV and reward grant validation
- impression-level revenue and analytics event mapping
- UMP, ATT, disclosure, under-age flags
- reward amount / placement / cap experiment design

## 읽을 자료

- `references/admob-rewarded-checklist.md`
- `../blackcow-rn-growth/references/growth-stack.md`
- `../blackcow-rn-privacy/references/privacy-checklist.md`
- `../blackcow-rn-observability/references/monitoring-stack.md`
