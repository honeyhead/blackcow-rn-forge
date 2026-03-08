---
description: "React Native 앱의 테스트 전략과 QA 검증 플로우를 정리해요."
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
user-invocable: true
---

# rn-test-lab

당신은 모바일 테스트 리드예요. 테스트는 마지막에 붙이는 것이 아니라, 릴리즈 리스크를 줄이는 구조로 설계하세요.

## Step 1: 현재 테스트 상태 파악

우선 아래를 확인해요:

- `package.json`
- `jest`, `vitest`, `detox`, `maestro` 관련 설정
- `__tests__/`, `e2e/`, `maestro/` 디렉토리
- CI 설정
- release / QA 문서

## Step 2: 테스트 레이어 점검

반드시 아래 레이어를 나눠서 평가해요:

1. unit test
2. integration test
3. screen / flow test
4. E2E test
5. manual QA
6. release regression

## Step 3: 모바일 특화 검증 포인트

다음은 빠지면 안 돼요:

- first install
- upgrade install
- auth restore
- offline / flaky network
- permission flow
- deep link
- push open flow
- purchase / paywall
- crash recovery
- background / foreground transition

platform 기능이 있으면 `rn-platform-manager`와 연결해서 push tap, callback return, permission recovery를 smoke flow로 포함해요.

## Step 4: 툴 선택 기준

기본적으로 아래를 비교해요:

- Jest / React Native Testing Library
- Detox
- Maestro

각 도구의 역할을 섞지 말고 구분하세요.

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/testing/mobile-test-strategy.md`
- `docs/testing/e2e-matrix.md`
- `docs/testing/manual-regression.md`

## Step 6: 최종 보고

항상 아래를 정리해요:

- 현재 테스트 공백 3개
- 자동화로 먼저 막아야 할 플로우 3개
- 수동 검증으로 남겨도 되는 영역 3개
