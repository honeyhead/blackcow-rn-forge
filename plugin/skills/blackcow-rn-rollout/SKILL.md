---
name: blackcow-rn-rollout
description: >
  "mobile rollout", "staged rollout", "release channel", "hotfix", "rollback", "feature flag",
  "릴리즈 채널", "점진 배포", "핫픽스", "롤백", "배포 게이트" 같은 모바일 배포 운영 작업일 때 사용하세요.
---

# Mobile Rollout Operations

React Native 앱의 release channel, staged rollout, rollback, hotfix 운영을 다루는 스킬입니다.

## 핵심 원칙

1. 릴리즈는 빌드 완료가 아니라 승격 기준이 정해졌을 때 끝나요.
2. binary release와 server-side control을 섞어 쓰더라도 책임 경계를 적어야 해요.
3. hotfix는 빠른 경로가 아니라 더 좁은 안전 장치가 필요한 경로예요.
4. rollout 판단은 crash와 revenue, activation, auth failure를 함께 봐야 해요.

## 다루는 영역

- environment promotion
- staged rollout ladder
- release gates
- rollback triggers
- hotfix policy

## 읽을 자료

- `references/rollout-strategy.md`
