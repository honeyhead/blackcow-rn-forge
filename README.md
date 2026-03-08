**한국어** | [English](README.en.md)

# Blackcow RN Forge

`fireauto`의 문서형 운영 패턴을 참고해, Bare React Native 앱 개발과 출시 운영에 맞게 확장한 Claude Code 플러그인입니다.

## 개요

이 플러그인은 React Native 앱을 단순히 "코드 생성"하는 도구가 아니라, 아래 전 과정을 문서와 명령 중심으로 관리하는 작업 체계입니다.

- 앱 기획과 구조 설계
- 인증, 결제, 오프라인, 미디어 플로우 정의
- 접근성, 보안, 프라이버시, QA 감사
- ASO, 평점, 리텐션, 스토어 운영
- 롤아웃, 릴리즈, 인시던트, 지원 운영

핵심 방향:
- 웹 SaaS 대신 iOS/Android 앱 개발 워크플로우에 맞춥니다.
- Expo 기본값을 버리고 Bare React Native 기준으로 설계합니다.
- 개발뿐 아니라 ASO, 리텐션, 분석, 수익화까지 모바일 운영 흐름을 포함합니다.
- 기존 웹 중심 플러그인과 함께 설치해도 충돌이 덜 나도록 슬래시 커맨드는 `rn-` 접두사를 사용합니다.

## 이런 경우에 적합합니다

- Bare React Native 앱을 처음부터 구조적으로 시작하고 싶을 때
- 이미 있는 RN 앱을 출시 가능한 수준으로 정리하고 싶을 때
- QA, release, growth, privacy, support 문서가 흩어져 있을 때
- Claude Code를 단순 코드 생성기가 아니라 역할 기반 운영 파트너처럼 쓰고 싶을 때

## 설치

### GitHub 설치

```bash
/plugin marketplace add honeyhead/blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

프로젝트 범위로 설치하려면:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

### 로컬 개발 설치

저장소를 직접 내려받아 테스트할 때:

```bash
/plugin marketplace add ./blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

프로젝트 범위로 설치하려면:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

## 이 플러그인으로 할 수 있는 일

- `/rn-planner`: 앱 아이디어를 모바일 PRD로 정리
- `/rn-architect`: 네비게이션, 상태, 배포 구조 설계
- `/rn-auth-manager`: auth, session restore, OAuth callback 설계
- `/rn-offline-manager`: offline-first, cache, sync queue 정책 설계
- `/rn-release-manager`: 출시 준비, QA, 스토어 제출 체크
- `/rn-growth-manager`: ASO, analytics, retention, monetization 계획 수립
- `/rn-incident-manager`: rollback, incident, postmortem 운영 정리

즉, "무엇을 만들지"부터 "어떻게 출시하고 운영할지"까지 현재 프로젝트 문맥에 맞춰 문서와 실행 계획을 만들 수 있습니다.

## 커맨드

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-planner` | 모바일 기획자 | 앱 아이디어를 모바일 PRD로 정리 |
| `/rn-bootstrap` | 부트스트래퍼 | Bare React Native 프로젝트 초기 구성 |
| `/rn-architect` | 아키텍트 | 네비게이션, 상태, 오프라인, 배포 구조 설계 |
| `/rn-designer` | 모바일 디자이너 | 디자인 시스템, 화면 패턴, 컴포넌트 구축 |
| `/rn-ui-upgrade` | UX 감사자 | 모바일 UX/접근성/성능 감사를 진행하고 수정 |
| `/rn-accessibility-guard` | 접근성 담당 | screen reader, focus, dynamic type, reduced motion 감리 |
| `/rn-security-guard` | 보안 담당 | 모바일 앱 보안 점검 |
| `/rn-privacy-manager` | 프라이버시 담당 | ATT, consent, data deletion, store disclosure 정리 |
| `/rn-auth-manager` | 인증 담당 | auth, session restore, OAuth callback, deep link 설계 |
| `/rn-billing-manager` | 과금 담당 | subscription, IAP, entitlement, paywall provider 설계 |
| `/rn-platform-manager` | 플랫폼 담당 | push, deep link, 권한, lifecycle 통합 설계 |
| `/rn-offline-manager` | 동기화 담당 | offline-first, cache, sync queue, conflict 정책 설계 |
| `/rn-media-manager` | 미디어 담당 | camera, gallery, upload, cache, background transfer 설계 |
| `/rn-growth-manager` | 성장 담당 | ASO, 앱 분석, 리텐션, 수익화 계획 수립 |
| `/rn-localization-manager` | 현지화 담당 | 앱 i18n, 국가별 스토어, 번역 운영 구조 설계 |
| `/rn-store-manager` | 스토어 담당 | 메타데이터, 스크린샷 메시지, 리뷰 노트 작성 |
| `/rn-test-lab` | 테스트 리드 | 테스트 전략, E2E, 수동 회귀 체크 구성 |
| `/rn-device-lab` | 디바이스 담당 | OS/device matrix, device farm, 접근성 회귀 운영 정리 |
| `/rn-observability` | 관측성 담당 | analytics, crash, performance 운영 체계 설계 |
| `/rn-engagement-manager` | 운영 담당 | 푸시, referral, win-back, paywall 재진입 운영 설계 |
| `/rn-rollout-manager` | 배포 운영 담당 | release channel, staged rollout, hotfix, rollback 전략 설계 |
| `/rn-release-manager` | 릴리즈 매니저 | 출시 준비, QA, 스토어 제출 체크 |
| `/rn-support-ops` | 지원 운영 담당 | support inbox, refund, review response, FAQ 운영 정리 |
| `/rn-rating-manager` | 평점 담당 | review prompt, rating recovery, store reputation 운영 정리 |
| `/rn-incident-manager` | 인시던트 담당 | sev 기준, rollback, comms, postmortem 운영 정리 |
| `/rn-team` | 팀 리더 | 멀티 에이전트 병렬 작업 |
| `/rn-team-status` | 팀 리더 비서 | 팀 상태 확인 |
| `/rn-loop` | 반복 실행기 | 완료 조건까지 반복 작업 |
| `/rn-cancel-loop` | 루프 제어 | 실행 중인 루프 중단 |

## 기본 사용 순서

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-designer
5. /rn-ui-upgrade
6. /rn-accessibility-guard
7. /rn-security-guard
8. /rn-privacy-manager
9. /rn-auth-manager
10. /rn-billing-manager
11. /rn-platform-manager
12. /rn-offline-manager
13. /rn-media-manager
14. /rn-growth-manager
15. /rn-localization-manager
16. /rn-store-manager
17. /rn-test-lab
18. /rn-device-lab
19. /rn-observability
20. /rn-engagement-manager
21. /rn-rollout-manager
22. /rn-release-manager
23. /rn-support-ops
24. /rn-rating-manager
25. /rn-incident-manager
```

## 구조

```text
blackcow-rn-forge/
├── README.md
├── PLAN.md
├── LICENSE
├── .claude-plugin/marketplace.json
└── plugin/
    ├── .claude-plugin/plugin.json
    ├── commands/
    ├── hooks/
    ├── scripts/
    └── skills/
```

## 설계 기준

- RN 앱은 `Expo Router`가 아니라 `React Navigation` 기준으로 설명합니다.
- 상태 관리는 `Zustand` 또는 `Jotai`처럼 가벼운 패턴을 우선합니다.
- 애니메이션은 `Reanimated`와 `Gesture Handler`를 기준으로 둡니다.
- 인증/데이터는 `Supabase`를 우선 후보로 두되, 모바일 보안과 오프라인 복구를 같이 다룹니다.
- 오프라인/불안정 네트워크는 예외가 아니라 기본 조건으로 보고 sync contract를 따로 설계합니다.
- 접근성은 체크박스가 아니라 screen reader, dynamic type, reduced motion까지 포함한 운영 품질 항목으로 봅니다.
- privacy/compliance는 출시 직전 체크가 아니라 SDK, analytics, account deletion 흐름 설계와 같이 다룹니다.
- 현지화는 번역 파일만이 아니라 스토어 메타데이터, 가격, 지원 언어 우선순위까지 포함합니다.
- 테스트는 emulator 기준으로 끝내지 않고 실제 device matrix와 OS 분포까지 포함합니다.
- 성장 운영은 ASO, 앱 분석, 리텐션, 가격 전략을 앱 출시 전부터 포함합니다.

## 참고한 외부 스킬 방향

- React Native 구현/성능: [vercel-react-native-skills](https://skills.sh/vercel-labs/agent-skills/vercel-react-native-skills), [react-native-best-practices](https://skills.sh/callstackincubator/agent-skills/react-native-best-practices)
- 구조/디자인: [react-native-architecture](https://skills.sh/wshobson/agents/react-native-architecture), [react-native-design](https://skills.sh/wshobson/agents/react-native-design)
- 데이터 계층: [supabase-postgres-best-practices](https://skills.sh/supabase/agent-skills/supabase-postgres-best-practices)
- 성장 운영: [aso-skills](https://github.com/Eronred/aso-skills), [startup-os-skills](https://github.com/ncklrs/startup-os-skills/tree/main/skills), [marketing-skills](https://github.com/robertbstillwell/marketing-skills), [wondelai/skills](https://github.com/wondelai/skills)

## 같이 쓰는 로컬 스킬

현재 로컬에 설치해 둔 핵심 스킬:

- `react-native-skills`
- `react-native-best-practices`
- `react-native-architecture`
- `react-native-design`
- `supabase-postgres-best-practices`
- `app-analytics`
- `competitor-analysis`
- `keyword-research`
- `monetization-strategy`
- `retention-optimization`
- `growth-product-manager`
- `product-analyst`
- `pricing-strategy`
- `referral-program`
- `signup-flow-cro`

## 현재 범위

이 폴더는 원본 `fireauto`처럼 문서형 플러그인에 가깝게 유지합니다.

- 핵심은 `commands/`, `skills/`, `agents/` 에 있습니다.
- 실제 실행 코드는 반복 루프용 스크립트만 둡니다.
- 앱 스타터나 성장 템플릿은 플러그인 안에 고정 자산으로 넣지 않고, 명령 실행 시 현재 프로젝트에 맞춰 생성하도록 설계합니다.
