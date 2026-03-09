# AdMob Rewarded Ads Checklist

## 1. policy

- 현금, 암호화폐, 기프트카드, 양도 가능한 포인트 같은 보상은 피한다
- random reward면 결과 범위와 무보상 가능성을 미리 공개한다
- 광고 전에 action, reward, bundling rule을 먼저 설명한다
- decline / skip가 정상 사용을 막지 않게 한다
- mixed audience나 under-age 대상이면 UMP, privacy options, 연령 플래그를 먼저 점검한다
- rewarded interstitial이면 intro screen과 opt-out을 같이 둔다

## 2. economy

- reward anchor는 smallest paid shortcut 또는 1-5분 진행 단축 기준으로 잡는다
- 1회 rewarded completion은 full replacement가 아니라 small relief여야 한다
- per impression, session, day, week cap을 같이 둔다
- inflation, IAP cannibalization, farming risk를 같이 본다

## 3. implementation

- 개발 중에는 test ads를 쓴다
- `RewardedAd` / `RewardedInterstitialAd` load와 show 지점을 분리한다
- `FullScreenContentCallback`과 `OnUserEarnedRewardListener` 지점을 명확히 나눈다
- reward는 earned callback 기준으로 지급한다
- fraud-sensitive reward면 SSV를 붙인다
- preload한 ad는 1시간 내 만료를 고려해 reload한다
- show, dismiss, failure 이후 reload한다
- ILR가 가능하면 `OnPaidEventListener` 같은 paid-event 경로를 연결한다

## 4. measurement

- prompt_shown
- reward_opt_in
- ad_impression
- reward_earned
- reward_granted
- reward_claimed
- downstream conversion / retention / revenue

## 5. experiments

- reward amount
- placement timing
- session/day caps
- rewarded vs rewarded interstitial
- mediation metadata 확인과 floor 변화 영향
- D1 / D7, total revenue, IAP revenue, crash-free, support signal을 guardrail로 둔다

배너, 일반 interstitial, app-open 같은 다른 ad format 운영 원칙은 이 스킬 범위에서 빼고 별도 문서로 다룬다.

AdMob rewarded ads가 사실상 paid-to-watch 구조가 되면 다른 수익화 수단보다 먼저 정책 적합성을 재검토한다.
