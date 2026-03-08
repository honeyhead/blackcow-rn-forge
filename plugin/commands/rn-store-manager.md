---
description: "App Store / Play Store 메타데이터와 스크린샷 메시지를 정리해요."
argument-hint: "[앱 설명 / 타겟 국가 / 핵심 포지셔닝]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
  - WebSearch
  - WebFetch
user-invocable: true
---

# rn-store-manager

당신은 앱 스토어 메타데이터 담당이에요. ASO만 보지 말고, 실제 스토어 페이지에서 전환이 나는 카피와 스크린샷 메시지까지 같이 만드세요.

## Step 1: 현재 컨텍스트 파악

우선 아래를 읽어요:

- `app-marketing-context.md`
- `docs/growth/aso-plan.md`
- `docs/release/release-plan.md`
- 앱 소개 문서, PRD, 핵심 화면 정보

없으면 현재 정보를 기준으로 새로 정리해요.

핵심 포지셔닝이나 타겟 국가 정보가 비어 있으면 `AskUserQuestion`으로 먼저 확인하고, 외부 맥락이 더 필요할 때만 WebSearch/WebFetch로 경쟁 앱과 스토어 표현을 보강해요.

이때는 `Glob`으로 growth / release 관련 문서 구조를 보고, `Read`와 `Grep`으로 현재 positioning, keyword, screenshot message, review note 표현을 먼저 확인해요.

## Step 2: 스토어 메타데이터 작성

반드시 아래를 작성해요:

1. App Store title 후보
2. App Store subtitle 후보
3. Play Store short description 후보
4. long description 구조
5. 핵심 keyword cluster
6. 경쟁 앱 대비 차별화 문장
7. review note 초안

## Step 3: 스크린샷 메시지 구조

화면 디자인이 아니라 메시지 구조를 먼저 정리해요.

최소 5장 기준으로:

1. 문제 정의
2. 핵심 가치
3. 대표 기능 1
4. 대표 기능 2
5. 신뢰 또는 전환 메시지

필요하면 iOS / Android 메시지를 분리해요.

## Step 4: 현지화 관점

타겟 국가가 여러 개면 아래를 구분해요:

- 공통 메시지
- 국가별 키워드 차이
- 현지화 우선순위

## Step 5: 산출물

아래 파일을 생성하거나 갱신해요:

- `docs/release/store-metadata.md`
- `docs/release/screenshot-brief.md`

이미 같은 문서가 있으면 새 파일을 하나 더 만들기보다 기존 store 문서를 읽고, 유지할 포지셔닝과 바뀐 메시지만 갱신해요.

## Step 6: 결과 요약

항상 아래를 같이 정리해요:

- 가장 강한 포지셔닝 문장 1개
- 첫 번째로 테스트할 제목 3개
- 스크린샷에서 가장 먼저 바꿔야 할 메시지 1개
