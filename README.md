# Blackcow RN Forge

<p>
  <a href="https://github.com/honeyhead/blackcow-rn-forge/stargazers"><img src="https://img.shields.io/github/stars/honeyhead/blackcow-rn-forge?style=social" alt="GitHub Stars" /></a>
  <a href="https://github.com/honeyhead/blackcow-rn-forge/blob/main/LICENSE"><img src="https://img.shields.io/github/license/honeyhead/blackcow-rn-forge" alt="License" /></a>
  <a href="https://github.com/honeyhead/blackcow-rn-forge"><img src="https://img.shields.io/github/last-commit/honeyhead/blackcow-rn-forge" alt="Last Commit" /></a>
</p>

Bare React Native 앱을 Claude Code 안에서 기획하고, 구조를 설계하고, 출시하고, 운영하는 흐름을 command 중심으로 정리하는 플러그인입니다.

이 저장소는 "코드 템플릿 한 번 뿌리기"보다 현재 프로젝트 문맥을 읽고 문서, 체크리스트, 운영 산출물을 쌓아가는 워크플로우에 더 가깝습니다.

[빠른 시작](#빠른-시작) · [추천 흐름](#추천-흐름) · [핵심 커맨드](#핵심-커맨드) · [커맨드 맵](#커맨드-맵) · [`/rn-loop`](#rn-loop) · [FAQ](#faq) · [최근 변경사항](CHANGELOG.md)

---

## 한눈에 보기

- Bare React Native 기준으로 앱 기획부터 출시 운영까지 이어지는 command 세트를 제공합니다.
- 아키텍처, auth, billing, offline, media, QA, release, ASO, support 흐름을 문서형으로 정리합니다.
- 새 프로젝트뿐 아니라 이미 운영 중인 RN 프로젝트에도 바로 붙여서 쓸 수 있습니다.
- 큰 작업은 `/rn-loop`, 병렬 작업은 `/rn-team` 계열로 밀어붙일 수 있습니다.

---

## 빠른 시작

### 설치

```bash
/plugin marketplace add honeyhead/blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

프로젝트 범위로만 설치하려면:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

### 첫 입력 예시

```text
/rn-help 기존 앱인데 어디서부터 정리해야 할지 모르겠어
/rn-planner 습관 기록과 친구 초대 기능이 있는 금연 앱
/rn-bootstrap HabitMate
/rn-architect 인증, 푸시, 오프라인 저장이 필요한 습관 앱 구조 설계
/rn-release-manager TestFlight 제출 전 QA matrix와 release blocker 점검
```

처음부터 끝까지 길게 맡기고 싶다면:

```bash
/rn-loop 로그인부터 출시 준비까지 필요한 문서와 구조를 정리해줘 --completion-promise '출시 준비 완료'
```

최근 변경 내역은 `CHANGELOG.md`에서 빠르게 볼 수 있습니다.

---

## 추천 흐름

| 상황 | 먼저 쓸 커맨드 | 기대 결과 |
| --- | --- | --- |
| 시작점이 막막할 때 | `/rn-help` -> `/rn-planner` 또는 `/rn-architect` | 현재 상황에 맞는 첫 커맨드와 다음 순서 |
| 새 앱을 시작할 때 | `/rn-planner` -> `/rn-bootstrap` -> `/rn-architect` | PRD, 초기 구조, 아키텍처 문서 |
| 기존 앱을 정리할 때 | `/rn-architect` -> `/rn-ui-upgrade` -> `/rn-security-guard` | 구조 재정리, UX 감사, 보안 점검 |
| 출시 직전일 때 | `/rn-test-lab` -> `/rn-device-lab` -> `/rn-release-manager` | QA matrix, 기기 점검, 스토어 제출 체크 |
| 운영 단계일 때 | `/rn-growth-manager` -> `/rn-rating-manager` -> `/rn-support-ops` | 성장 전략, 평점 운영, 지원 운영 룰 |
| 작업이 크고 길 때 | `/rn-team` -> `/rn-team-status` -> `/rn-loop` | 병렬 진행, 상태 추적, 반복 실행 |

---

## 핵심 커맨드

| 커맨드 | 역할 | 언제 먼저 쓰면 좋은가 |
| --- | --- | --- |
| `/rn-help` | 시작점 추천 | 지금 뭘 먼저 써야 할지 감이 안 올 때 |
| `/rn-planner` | 모바일 PRD 정리 | 앱 아이디어가 아직 흐릴 때 |
| `/rn-bootstrap` | Bare RN 초기 구조 정리 | 프로젝트를 막 시작했을 때 |
| `/rn-architect` | 구조 설계 | navigation, state, offline, release 흐름을 먼저 고정하고 싶을 때 |
| `/rn-release-manager` | 출시 준비 점검 | QA, signing, store checklist가 비어 있을 때 |
| `/rn-loop` | 반복 실행 | 완료 조건까지 긴 작업을 계속 밀고 싶을 때 |

막막하면 `/rn-help` 로 시작하고, 가장 무난한 시작 순서는 아래 다섯 개입니다.

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
/rn-loop
```

---

## 커맨드 맵

### Start Here

`/rn-help`

지금 상황에 맞는 첫 커맨드와 다음 순서를 추천합니다.

### Build / Product

`/rn-planner`, `/rn-bootstrap`, `/rn-architect`, `/rn-designer`

앱 아이디어, 초기 구조, 디자인 시스템, 화면 패턴을 정리합니다.

### Quality / Compliance

`/rn-ui-upgrade`, `/rn-accessibility-guard`, `/rn-security-guard`, `/rn-privacy-manager`

UX, 접근성, 보안, 프라이버시 관점에서 모바일 앱 품질을 점검합니다.

### Core Flows / Platform

`/rn-auth-manager`, `/rn-billing-manager`, `/rn-platform-manager`, `/rn-offline-manager`, `/rn-media-manager`

인증, 결제, 푸시, 딥링크, 오프라인 동기화, 미디어 파이프라인을 설계합니다.

### Growth / Store / Operations

`/rn-growth-manager`, `/rn-localization-manager`, `/rn-store-manager`, `/rn-engagement-manager`, `/rn-rating-manager`, `/rn-support-ops`, `/rn-incident-manager`

ASO, 현지화, 스토어 운영, 리텐션, 평점 회복, 지원 운영, 인시던트 대응을 다룹니다.

### Release / Testing

`/rn-test-lab`, `/rn-device-lab`, `/rn-observability`, `/rn-rollout-manager`, `/rn-release-manager`

테스트 전략, 기기 매트릭스, 관측성, staged rollout, hotfix, 출시 체크를 정리합니다.

### Team / Automation

`/rn-team`, `/rn-team-status`, `/rn-loop`, `/rn-cancel-loop`

멀티 에이전트 작업 분리, blocker 확인, 반복 실행, 루프 중단을 맡습니다.

---

## 예시 프롬프트

```text
/rn-help 지금은 기존 앱 구조 정리부터 해야 할까, 출시 점검부터 해야 할까?
/rn-planner 반려견 산책 기록과 근처 산책 친구 매칭 앱
/rn-architect 인증, 푸시, 오프라인 기록이 필요한 산책 앱 구조 설계
/rn-security-guard 토큰 저장, WebView, 딥링크 보안 리스크를 감사해줘
/rn-offline-manager 오프라인 작성 후 재연결 동기화가 필요한 메모 앱 정책을 정리해줘
/rn-growth-manager 미국/한국 타겟의 습관 앱 ASO와 리텐션 전략을 정리해줘
/rn-release-manager App Store 제출 전 체크리스트와 QA matrix를 정리해줘
```

---

## `/rn-loop`

긴 작업을 한 번에 던지고 완료 조건까지 이어서 진행하고 싶을 때 쓰는 명령입니다.

- 상태만 확인: `/rn-loop --status`
- 멈춘 작업 이어가기: `/rn-loop --resume 다음 작업`
- 중단하기: `/rn-cancel-loop`
- active 루프는 새 실행으로 조용히 덮어쓰지 않습니다.

예시:

```bash
/rn-loop 출시 준비 상태를 점검하고 부족한 문서를 채워줘 --completion-promise '출시 준비 완료'
```

---

## 플러그인 내부 인덱스

저장소 내부 구성을 빠르게 훑고 싶다면 아래 인덱스를 보면 됩니다.

- 커맨드 인덱스: `plugin/commands/README.md`
- 에이전트 인덱스: `plugin/agents/README.md`
- 스킬 인덱스: `plugin/skills/README.md`
- 루프 스크립트: `plugin/scripts/setup-rn-loop.sh`, `plugin/hooks/stop-hook.sh`

---

## 결과물은 어디에 쌓이나요?

대부분 아래 경로에 문서가 생기거나 갱신됩니다.

- `docs/mobile-prd/`
- `docs/auth/`, `docs/platform/`, `docs/data/`, `docs/media/`
- `docs/testing/`, `docs/observability/`, `docs/release/`
- `docs/growth/`, `docs/localization/`, `docs/privacy/`, `docs/ops/`
- `MOBILE_SECURITY_AUDIT.md`

---

## 설계 기준

- Expo 중심이 아니라 Bare React Native 기준으로 설명합니다.
- 라우팅은 `React Navigation` 기준으로 다룹니다.
- 상태 관리는 `Zustand` 또는 `Jotai` 같은 가벼운 패턴을 우선합니다.
- 애니메이션은 `Reanimated`와 `Gesture Handler`를 기준으로 둡니다.
- 오프라인과 불안정 네트워크는 예외가 아니라 기본 조건으로 다룹니다.
- 접근성은 screen reader, dynamic type, reduced motion까지 포함합니다.
- privacy, analytics, account deletion, store disclosure를 운영 품질의 일부로 봅니다.
- 테스트는 emulator만이 아니라 실제 device matrix와 OS 분포까지 고려합니다.

---

## FAQ

### 프로젝트가 아직 없어도 쓸 수 있나요?

네. `/rn-planner`부터 시작하면 됩니다. 새 앱이면 그다음 `/rn-bootstrap`, 기존 앱이면 `/rn-architect` 쪽으로 이어가면 됩니다.

### 기존 앱이 있는데 `/rn-bootstrap`이 꼭 필요한가요?

아니요. 이미 프로젝트가 있으면 `/rn-architect`, `/rn-ui-upgrade`, `/rn-release-manager`부터 바로 시작해도 됩니다.

### 모든 커맨드가 코드를 직접 수정하나요?

아닙니다. 문서 생성 중심인 커맨드도 있고, 감사/체크리스트 중심인 커맨드도 있고, 실제 코드와 구조 수정까지 이어지는 커맨드도 있습니다.

### 커맨드가 많아서 뭘 먼저 써야 할지 모르겠어요.

그럴 땐 먼저 `/rn-help`를 쓰고, 바로 시작하고 싶으면 이 다섯 개부터 기억하면 됩니다.

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
/rn-loop
```

### 영어 README는 없나요?

지금은 한국어 README 하나만 유지합니다.
