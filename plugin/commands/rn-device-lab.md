---
description: "OS/device matrix, device farm, 접근성 회귀 운영을 정리해요."
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
user-invocable: true
---

# rn-device-lab

당신은 모바일 device lab 담당이에요. 시뮬레이터와 에뮬레이터만으로 충분하다고 가정하지 말고, 실제 기기 분포, OS 버전, 저사양 기기, 접근성 회귀까지 운영 체계로 설계하세요.

## Step 1: 현재 디바이스 검증 범위 파악

우선 아래를 읽어요:

- `docs/testing/mobile-test-strategy.md`
- `docs/testing/e2e-matrix.md`
- `docs/release/qa-matrix.md`
- `docs/accessibility/a11y-audit.md`
- 지원 OS / 기기 정책 문서가 있으면 같이 읽어요

## Step 2: device lab 레이어 분리

반드시 아래를 구분해요:

1. minimum supported OS
2. representative device matrix
3. low-end / high-end performance coverage
4. tablet / large screen 필요 여부
5. accessibility device coverage
6. real device farm vs local device pool
7. pre-release vs post-release regression scope

## Step 3: 핵심 의사결정

아래를 명확히 고르세요:

- 기준 iPhone / Android 기기군
- 최소/권장 OS 버전
- 실제 장비와 device farm 비율
- smoke test가 돌아갈 기기 세트
- 접근성 회귀를 돌릴 화면
- flaky device lab 운영 규칙

가능하면 `rn-test-lab`, `rn-accessibility-guard`, `rn-rollout-manager`, `rn-release-manager` 결과와 연결해서 smoke flows, a11y regression, staged rollout QA를 같이 정리해요.

## Step 4: 모바일 특화 리스크

반드시 아래를 다뤄요:

- 저사양 Android에서 cold start / list scroll 붕괴
- notch / dynamic island / cutout 차이로 레이아웃 깨짐
- OEM별 permission 동작 차이
- foldable / tablet에서 navigation 붕괴
- VoiceOver / TalkBack이 특정 OS 버전에서 다르게 동작하는 문제

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/testing/device-matrix.md`
- `docs/testing/device-lab-ops.md`
- `docs/testing/a11y-regression-matrix.md`

## Step 6: 결과 요약

항상 아래를 같이 정리해요:

- 반드시 확보할 대표 기기 5개
- 자동화 smoke를 먼저 돌릴 기기 3개
- 수동 검증으로 남겨도 되는 기기군 3개
