# Blackcow RN Forge

<p>
  <a href="https://github.com/honeyhead/blackcow-rn-forge/stargazers"><img src="https://img.shields.io/github/stars/honeyhead/blackcow-rn-forge?style=social" alt="GitHub Stars" /></a>
  <a href="https://github.com/honeyhead/blackcow-rn-forge/blob/main/LICENSE"><img src="https://img.shields.io/github/license/honeyhead/blackcow-rn-forge" alt="License" /></a>
  <a href="https://github.com/honeyhead/blackcow-rn-forge"><img src="https://img.shields.io/github/last-commit/honeyhead/blackcow-rn-forge" alt="Last Commit" /></a>
</p>

Bare React Native 앱을 기획하고, 구조를 잡고, 출시하고, 운영하는 과정을 Claude Code 안에서 command 중심으로 정리하는 플러그인입니다.

`fireauto`의 문서형 운영 패턴을 참고했지만, 웹 SaaS 대신 모바일 앱 개발과 출시 운영에 맞게 다시 설계했습니다.

[시작하기](#시작하기) · [기능 가이드](#기능-가이드) · [상세 설명](#상세-설명) · [FAQ](#faq) · [최근 변경사항](CHANGELOG.md)

---

## Quick Start

```bash
/plugin marketplace add honeyhead/blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
/rn-planner 습관 기록과 친구 초대 기능이 있는 금연 앱
```

설치 후 무엇부터 해야 할지 모르겠으면 `/rn-planner` 또는 `/rn-loop`부터 시작하면 됩니다.

최근 문서/명령 개선 내역은 `CHANGELOG.md`에서 빠르게 볼 수 있습니다.

처음 입력은 이렇게 주면 바로 쓰기 쉽습니다:

```text
/rn-planner 습관 기록과 친구 초대 기능이 있는 금연 앱
/rn-bootstrap HabitMate
/rn-architect 인증, 푸시, 오프라인 저장이 필요한 습관 앱 구조 설계
/rn-release-manager TestFlight 제출 전 QA matrix와 release blocker 점검
/rn-loop 로그인부터 출시 준비까지 필요한 문서와 구조를 정리해줘 --completion-promise '출시 준비 완료'
```

---

## 시작하기

### 1. 설치

#### GitHub 설치

```bash
/plugin marketplace add honeyhead/blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

프로젝트 범위로 설치하려면:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

#### 로컬 개발 설치

저장소를 직접 내려받아 테스트할 때:

```bash
/plugin marketplace add ./blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

프로젝트 범위로 설치하려면:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

### 2. 이 플러그인이 하는 일

이 플러그인은 단순 코드 생성기가 아닙니다. 아래 과정을 Claude Code 안에서 문서와 command로 정리하는 운영 레이어에 가깝습니다.

- 앱 아이디어를 PRD로 정리
- Bare React Native 구조 설계
- auth, billing, offline, media 흐름 정리
- 접근성, 보안, 프라이버시, QA 감사
- ASO, 평점, 리텐션, 스토어 운영
- rollout, release, incident, support 운영

즉, "무엇을 만들지"부터 "어떻게 출시하고 운영할지"까지 현재 프로젝트 문맥에 맞춘 문서와 실행 계획을 만드는 데 초점이 있습니다.

### 3. 초심자는 이것부터 쓰세요

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-release-manager
5. /rn-loop
```

이 다섯 개만 알아도:
- 앱 아이디어 정리
- Bare RN 초기 구조 설정
- 핵심 아키텍처 설계
- 출시 준비 점검
- 반복 작업 자동 진행

까지는 바로 시작할 수 있습니다.

추천 첫 입력 예시:

```text
/rn-planner 습관 기록과 친구 초대 기능이 있는 금연 앱
/rn-bootstrap HabitMate
/rn-architect 인증, 결제, 오프라인 동기화가 필요한 앱 구조 설계
/rn-release-manager App Store 제출 전 체크리스트와 QA matrix 정리
/rn-loop 출시 준비 상태를 점검하고 부족한 문서를 채워줘
```

### 4. 신규 프로젝트 / 기존 프로젝트

#### 새 앱을 이제 시작한다면

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-designer
```

`/rn-bootstrap`은 필요하면 새 Bare React Native 앱 생성까지 포함해서, 환경, 기본 의존성, 폴더 구조, 네이티브 설정을 정리합니다.

#### 이미 RN 프로젝트가 있다면

```text
1. /rn-architect
2. /rn-ui-upgrade
3. /rn-security-guard
4. /rn-release-manager
```

이미 앱이 있으면 `/rn-bootstrap`은 건너뛰어도 됩니다.

---

## 기능 가이드

### 새 앱을 처음 시작한다면

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-designer
```

주로 생기는 산출물:
- `docs/mobile-prd/...`
- `docs/mobile-bootstrap.md`
- `docs/mobile-architecture.md`

### 이미 앱이 있고 구조를 정리하고 싶다면

```text
1. /rn-architect
2. /rn-ui-upgrade
3. /rn-security-guard
4. /rn-privacy-manager
```

주로 생기는 산출물:
- `docs/mobile-architecture.md`
- `MOBILE_SECURITY_AUDIT.md`
- `docs/privacy/...`

### 출시 직전이라면

```text
1. /rn-test-lab
2. /rn-device-lab
3. /rn-observability
4. /rn-release-manager
```

주로 생기는 산출물:
- `docs/testing/...`
- `docs/observability/...`
- `docs/release/...`

### 출시 후 운영 단계라면

```text
1. /rn-growth-manager
2. /rn-engagement-manager
3. /rn-rating-manager
4. /rn-support-ops
5. /rn-incident-manager
```

주로 생기는 산출물:
- `docs/growth/...`
- `docs/ops/...`

### 작업이 크고 길다면

```text
1. /rn-team
2. /rn-team-status
3. /rn-loop
```

이럴 때 좋습니다:
- 혼자 순서를 잡기 어려울 때
- 큰 작업을 여러 단계로 끝까지 밀고 싶을 때
- `/rn-team-status`로 충돌 위험과 blocker를 중간중간 확인하고 싶을 때

### Starter Kit이 꼭 필요한가요?

지금은 필수 아닙니다.

이 플러그인은 고정 starter 코드를 끼워 넣는 방식보다, 현재 프로젝트를 읽고 문서와 구조를 직접 만드는 쪽에 가깝습니다.

정리하면:
- 이미 프로젝트가 있으면 바로 써도 됩니다
- 새 프로젝트면 `/rn-planner` 다음 `/rn-bootstrap`부터 시작하면 됩니다

---

## 상세 설명

### 핵심 시작 command

#### `/rn-planner`

앱 아이디어를 모바일 PRD로 정리합니다.

언제 쓰나:
- "무슨 앱을 만들지" 아직 흐린 상태일 때
- 기능 우선순위를 못 정했을 때

얻는 것:
- 핵심 화면
- P0 / P1 / P2 기능
- 기술 스택 방향
- 출시/성장 전략 초안

예시:

```text
/rn-planner 습관 기록과 친구 초대 기능이 있는 금연 앱
```

#### `/rn-bootstrap`

Bare React Native 프로젝트의 기본 구조를 잡습니다.

언제 쓰나:
- 새 프로젝트를 막 만들었을 때
- RN CLI 초기화 후 뭐부터 정리해야 할지 모를 때

얻는 것:
- 기본 의존성 방향
- 폴더 구조
- 네이티브 기본 설정 체크
- 다음에 실행할 커맨드

예시:

```text
/rn-bootstrap HabitMate
```

#### `/rn-architect`

앱의 큰 구조를 설계합니다.

언제 쓰나:
- navigation, state, data, offline, release 구조를 먼저 고정하고 싶을 때

얻는 것:
- 모바일 아키텍처 문서
- 데이터 흐름 정리
- 리스크 포인트

예시:

```text
/rn-architect 인증, 결제, 오프라인 동기화가 필요한 러닝 앱 구조 설계
```

#### `/rn-release-manager`

지금 앱을 진짜 출시할 수 있는 상태인지 점검합니다.

언제 쓰나:
- 앱은 어느 정도 되었는데 출시 감이 안 올 때
- QA, signing, store checklist가 비어 있을 때

얻는 것:
- `docs/release/release-plan.md`
- `docs/release/store-checklist.md`
- `docs/release/qa-matrix.md`

예시:

```text
/rn-release-manager TestFlight 제출 전 release blocker와 QA matrix 정리
```

#### `/rn-loop`

프롬프트 하나를 던지고 완료 조건까지 반복 작업을 시킵니다.

- 진행 중 상태만 보려면 `--status`
- active 또는 중단된 inactive 루프를 이어가려면 `--resume`
- 루프를 멈추려면 `/rn-cancel-loop`
- active 루프는 새 실행으로 조용히 덮어쓰지 않습니다

예시:

```bash
/rn-loop 로그인부터 출시 준비까지 필요한 문서와 구조를 정리해줘 --completion-promise '출시 준비 완료'
```

상태만 확인하려면:

```text
/rn-loop --status
```

기존 active 루프나 훅 오류로 멈춘 inactive 루프를 이어가려면:

```text
/rn-loop --resume 다음 작업
```

짧게 시작하려면:

```text
/rn-loop 출시 준비 상태를 점검하고 부족한 문서를 채워줘
```

### 전체 커맨드

#### Build / Product

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-planner` | 모바일 기획자 | 앱 아이디어를 모바일 PRD로 정리 |
| `/rn-bootstrap` | 부트스트래퍼 | 새 Bare React Native 프로젝트 생성 또는 기존 구조 보강 |
| `/rn-architect` | 아키텍트 | 네비게이션, 상태, 오프라인, 배포 구조 설계 |
| `/rn-designer` | 모바일 디자이너 | 디자인 시스템, 화면 패턴, 컴포넌트 구축 |

대표 입력 예시:

```text
/rn-planner 반려견 산책 기록과 근처 산책 친구 매칭 앱
/rn-architect 인증, 푸시, 오프라인 기록이 필요한 산책 앱 구조 설계
```

#### Quality / Compliance

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-ui-upgrade` | UX 감사자 | 모바일 UX/접근성/성능 감사를 진행하고 수정 |
| `/rn-accessibility-guard` | 접근성 담당 | screen reader, focus, dynamic type, reduced motion 감리 |
| `/rn-security-guard` | 보안 담당 | 모바일 앱 보안 점검 |
| `/rn-privacy-manager` | 프라이버시 담당 | ATT, consent, data deletion, store disclosure 정리 |

대표 입력 예시:

```text
/rn-ui-upgrade 온보딩과 결제 화면의 UX 문제를 점검하고 우선순위를 정리해줘
/rn-security-guard 토큰 저장, WebView, 딥링크 보안 리스크를 감사해줘
```

#### Core Flows / Platform

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-auth-manager` | 인증 담당 | auth, session restore, OAuth callback, deep link 설계 |
| `/rn-billing-manager` | 과금 담당 | subscription, IAP, entitlement, paywall provider 설계 |
| `/rn-platform-manager` | 플랫폼 담당 | push, deep link, 권한, lifecycle 통합 설계 |
| `/rn-offline-manager` | 동기화 담당 | offline-first, cache, sync queue, conflict 정책 설계 |
| `/rn-media-manager` | 미디어 담당 | camera, gallery, upload, cache, background transfer 설계 |

대표 입력 예시:

```text
/rn-auth-manager Supabase OAuth와 세션 복구가 있는 모바일 인증 흐름을 설계해줘
/rn-offline-manager 오프라인 작성 후 재연결 동기화가 필요한 메모 앱 정책을 정리해줘
```

#### Growth / Store / Operations

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-growth-manager` | 성장 담당 | ASO, 앱 분석, 리텐션, 수익화 계획 수립 |
| `/rn-localization-manager` | 현지화 담당 | 앱 i18n, 국가별 스토어, 번역 운영 구조 설계 |
| `/rn-store-manager` | 스토어 담당 | 메타데이터, 스크린샷 메시지, 리뷰 노트 작성 |
| `/rn-engagement-manager` | 운영 담당 | 푸시, referral, win-back, paywall 재진입 운영 설계 |
| `/rn-rating-manager` | 평점 담당 | review prompt, rating recovery, store reputation 운영 정리 |
| `/rn-support-ops` | 지원 운영 담당 | support inbox, refund, review response, FAQ 운영 정리 |
| `/rn-incident-manager` | 인시던트 담당 | sev 기준, rollback, comms, postmortem 운영 정리 |

대표 입력 예시:

```text
/rn-growth-manager 미국/한국 타겟의 습관 앱 ASO와 리텐션 전략을 정리해줘
/rn-support-ops 환불, 계정 복구, 리뷰 대응 운영 규칙을 정리해줘
```

#### Release / Testing

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-test-lab` | 테스트 리드 | 테스트 전략, E2E, 수동 회귀 체크 구성 |
| `/rn-device-lab` | 디바이스 담당 | OS/device matrix, device farm, 접근성 회귀 운영 정리 |
| `/rn-observability` | 관측성 담당 | analytics, crash, performance 운영 체계 설계 |
| `/rn-rollout-manager` | 배포 운영 담당 | release channel, staged rollout, hotfix, rollback 전략 설계 |
| `/rn-release-manager` | 릴리즈 매니저 | 출시 준비, QA, 스토어 제출 체크 |

대표 입력 예시:

```text
/rn-test-lab 로그인, 결제, 딥링크가 있는 앱의 테스트 전략을 정리해줘
/rn-rollout-manager staged rollout과 hotfix 기준을 정리해줘
```

#### Team / Automation

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-team` | 팀 리더 | 멀티 에이전트 병렬 작업과 owner 분리 |
| `/rn-team-status` | 팀 리더 비서 | 팀 상태, 충돌 위험, blocker 확인 |
| `/rn-loop` | 반복 실행기 | 상태 확인, 반복 실행, 재개 |
| `/rn-cancel-loop` | 루프 제어 | 실행 중인 루프 중단 |

대표 입력 예시:

```text
/rn-team 이번 라운드 목표는 출시 준비 완료고 ios/Podfile과 navigation root는 충돌 금지
/rn-team-status 이번 라운드 release blocker와 충돌 위험 파일을 확인해줘
```

### 결과물은 어디에 쌓이나요?

대부분 아래 경로에 문서가 생기거나 갱신됩니다.

- `docs/mobile-prd/`
- `docs/auth/`
- `docs/platform/`
- `docs/data/`
- `docs/media/`
- `docs/testing/`
- `docs/observability/`
- `docs/release/`
- `docs/growth/`
- `docs/localization/`
- `docs/privacy/`
- `docs/ops/`
- `MOBILE_SECURITY_AUDIT.md`

### 설계 기준

- RN 앱은 `Expo Router`가 아니라 `React Navigation` 기준으로 설명합니다
- 상태 관리는 `Zustand` 또는 `Jotai`처럼 가벼운 패턴을 우선합니다
- 애니메이션은 `Reanimated`와 `Gesture Handler`를 기준으로 둡니다
- 인증/데이터는 `Supabase`를 우선 후보로 두되, 모바일 보안과 오프라인 복구를 같이 다룹니다
- 오프라인/불안정 네트워크는 예외가 아니라 기본 조건으로 보고 sync contract를 따로 설계합니다
- 접근성은 screen reader, dynamic type, reduced motion까지 포함한 운영 품질 항목으로 봅니다
- privacy/compliance는 SDK, analytics, account deletion 설계와 같이 다룹니다
- 테스트는 emulator 기준으로 끝내지 않고 실제 device matrix와 OS 분포까지 포함합니다

---

## FAQ

### 프로젝트가 아직 없는데 바로 쓸 수 있나요?

네. 프로젝트가 없어도 `/rn-planner`부터 시작할 수 있습니다.

그 다음 `/rn-bootstrap`이 새 Bare React Native 앱 생성 또는 기존 구조 보강을 맡습니다.

### 이미 앱이 있는데 `/rn-bootstrap`이 꼭 필요한가요?

아니요. 기존 프로젝트가 있으면 `/rn-architect`, `/rn-ui-upgrade`, `/rn-release-manager`부터 시작해도 됩니다.

### 모든 커맨드가 코드를 직접 수정하나요?

아닙니다.

- 일부는 문서 생성 중심
- 일부는 감사와 체크리스트 중심
- 일부는 실제 코드/구조 수정까지 포함

즉, command마다 역할이 다릅니다.

### 커맨드가 너무 많아서 뭘 써야 할지 모르겠어요

이 순서만 기억하면 됩니다:

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
/rn-loop
```

이 5개가 가장 안전한 시작점입니다.

### 큰 작업을 한 번에 맡기고 싶어요

`/rn-loop`를 먼저 써보세요.

진행 중 상태는 `/rn-loop --status` 로 보고, 이어가려면 `--resume`, 멈추려면 `/rn-cancel-loop` 를 쓰면 됩니다.

예:

```bash
/rn-loop 로그인, 결제, 출시 준비까지 필요한 문서와 구조를 정리해줘 --completion-promise '출시 준비 완료'
```

### 영어 README는 없나요?

지금은 한국어 README 하나만 유지합니다. 문서 관리 복잡도를 줄이기 위한 결정입니다.
