**한국어** | [English](README.en.md)

# Blackcow RN Forge

Bare React Native 앱을 기획하고, 구조를 잡고, 출시하고, 운영하는 과정을 Claude Code 안에서 command 중심으로 정리하는 플러그인입니다.

`fireauto`의 문서형 운영 패턴을 참고했지만, 웹 SaaS 대신 모바일 앱 개발과 출시 운영에 맞게 다시 설계했습니다.

빠른 이동:
[시작하기](#시작하기) · [상황별 가이드](#어떤-상황에서-뭘-쓰면-되나요) · [초심자용 경로](#초심자는-이것만-쓰세요) · [전체 커맨드](#전체-커맨드) · [faq](#faq)

---

## 이게 뭔가요?

이 플러그인은 React Native 앱을 단순히 "코드 생성"하는 도구가 아닙니다.

아래 과정을 Claude Code 안에서 정리하고 밀어붙이기 위한 운영 레이어에 가깝습니다.

- 앱 아이디어를 PRD로 정리
- Bare React Native 구조 설계
- auth, billing, offline, media 흐름 정리
- 접근성, 보안, 프라이버시, QA 감사
- ASO, 평점, 리텐션, 스토어 운영
- rollout, release, incident, support 운영

즉, "무엇을 만들지"부터 "어떻게 출시하고 운영할지"까지 현재 프로젝트 문맥에 맞춘 문서와 실행 계획을 만드는 데 초점이 있습니다.

---

## 시작하기

### 1단계: 플러그인 설치

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

### 2단계: 신규 프로젝트인지, 기존 프로젝트인지 정하세요

#### 새 앱을 이제 시작한다면

1. React Native CLI로 Bare RN 앱을 만듭니다.
2. `/rn-planner`
3. `/rn-bootstrap`
4. `/rn-architect`

`/rn-bootstrap`은 Expo 대신 Bare React Native 기준으로 환경, 기본 의존성, 폴더 구조, 네이티브 설정을 정리합니다.

#### 이미 RN 프로젝트가 있다면

1. `/rn-architect`
2. `/rn-ui-upgrade`
3. `/rn-security-guard`
4. `/rn-release-manager`

이미 앱이 있으면 `/rn-bootstrap`은 건너뛰어도 됩니다.

### 3단계: 초심자는 이 5개부터 쓰세요

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

---

## 초심자는 이것만 쓰세요

### `/rn-planner`

앱 아이디어를 모바일 PRD로 정리합니다.

언제 쓰나:
- "무슨 앱을 만들지" 아직 흐린 상태일 때
- 기능 우선순위를 못 정했을 때

얻는 것:
- 핵심 화면
- P0 / P1 / P2 기능
- 기술 스택 방향
- 출시/성장 전략 초안

### `/rn-bootstrap`

Bare React Native 프로젝트의 기본 구조를 잡습니다.

언제 쓰나:
- 새 프로젝트를 막 만들었을 때
- RN CLI 초기화 후 뭐부터 정리해야 할지 모를 때

얻는 것:
- 기본 의존성 방향
- 폴더 구조
- 네이티브 기본 설정 체크
- 다음에 실행할 커맨드

### `/rn-architect`

앱의 큰 구조를 설계합니다.

언제 쓰나:
- navigation, state, data, offline, release 구조를 먼저 고정하고 싶을 때

얻는 것:
- 모바일 아키텍처 문서
- 데이터 흐름 정리
- 리스크 포인트

### `/rn-release-manager`

지금 앱을 진짜 출시할 수 있는 상태인지 점검합니다.

언제 쓰나:
- 앱은 어느 정도 되었는데 출시 감이 안 올 때
- QA, signing, store checklist가 비어 있을 때

얻는 것:
- `docs/release/release-plan.md`
- `docs/release/store-checklist.md`
- `docs/release/qa-matrix.md`

### `/rn-loop`

프롬프트 하나를 던지고 완료 조건까지 반복 작업을 시킵니다.

언제 쓰나:
- 무엇부터 시킬지 애매할 때
- 한 번에 끝내지 못하는 작업을 계속 밀고 싶을 때

예시:

```bash
/rn-loop 로그인부터 출시 준비까지 문서와 구조를 정리해줘 --completion-promise '출시 준비 완료'
```

---

## 어떤 상황에서 뭘 쓰면 되나요?

### 새 앱을 처음 시작한다면

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-designer
```

### 이미 앱이 있고 구조를 정리하고 싶다면

```text
1. /rn-architect
2. /rn-ui-upgrade
3. /rn-security-guard
4. /rn-privacy-manager
```

### 출시 직전이라면

```text
1. /rn-test-lab
2. /rn-device-lab
3. /rn-observability
4. /rn-release-manager
```

### 출시 후 운영 단계라면

```text
1. /rn-growth-manager
2. /rn-engagement-manager
3. /rn-rating-manager
4. /rn-support-ops
5. /rn-incident-manager
```

### 작업이 크고 길다면

```text
1. /rn-team
2. /rn-team-status
3. /rn-loop
```

---

## Starter Kit이 필요한가요?

지금은 필수 아닙니다.

이 플러그인은 고정 starter 코드를 끼워 넣는 방식보다, 현재 프로젝트를 읽고 문서와 구조를 직접 만드는 쪽에 가깝습니다.

정리하면:
- 이미 프로젝트가 있으면 바로 써도 됩니다
- 새 프로젝트면 RN CLI로 Bare RN 앱을 만든 뒤 `/rn-bootstrap`부터 시작하면 됩니다

즉, 지금 단계에서는 별도 starter kit 없이도 사용 가능합니다.

---

## 추천 워크플로우

### 최소 워크플로우

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
```

### 조금 더 제대로 하려면

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-auth-manager
/rn-platform-manager
/rn-offline-manager
/rn-test-lab
/rn-release-manager
```

### 운영까지 포함하면

```text
/rn-growth-manager
/rn-store-manager
/rn-rating-manager
/rn-support-ops
/rn-incident-manager
```

---

## 전체 커맨드

### Build / Product

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-planner` | 모바일 기획자 | 앱 아이디어를 모바일 PRD로 정리 |
| `/rn-bootstrap` | 부트스트래퍼 | Bare React Native 프로젝트 초기 구성 |
| `/rn-architect` | 아키텍트 | 네비게이션, 상태, 오프라인, 배포 구조 설계 |
| `/rn-designer` | 모바일 디자이너 | 디자인 시스템, 화면 패턴, 컴포넌트 구축 |

### Quality / Compliance

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-ui-upgrade` | UX 감사자 | 모바일 UX/접근성/성능 감사를 진행하고 수정 |
| `/rn-accessibility-guard` | 접근성 담당 | screen reader, focus, dynamic type, reduced motion 감리 |
| `/rn-security-guard` | 보안 담당 | 모바일 앱 보안 점검 |
| `/rn-privacy-manager` | 프라이버시 담당 | ATT, consent, data deletion, store disclosure 정리 |

### Core Flows / Platform

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-auth-manager` | 인증 담당 | auth, session restore, OAuth callback, deep link 설계 |
| `/rn-billing-manager` | 과금 담당 | subscription, IAP, entitlement, paywall provider 설계 |
| `/rn-platform-manager` | 플랫폼 담당 | push, deep link, 권한, lifecycle 통합 설계 |
| `/rn-offline-manager` | 동기화 담당 | offline-first, cache, sync queue, conflict 정책 설계 |
| `/rn-media-manager` | 미디어 담당 | camera, gallery, upload, cache, background transfer 설계 |

### Growth / Store / Operations

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-growth-manager` | 성장 담당 | ASO, 앱 분석, 리텐션, 수익화 계획 수립 |
| `/rn-localization-manager` | 현지화 담당 | 앱 i18n, 국가별 스토어, 번역 운영 구조 설계 |
| `/rn-store-manager` | 스토어 담당 | 메타데이터, 스크린샷 메시지, 리뷰 노트 작성 |
| `/rn-engagement-manager` | 운영 담당 | 푸시, referral, win-back, paywall 재진입 운영 설계 |
| `/rn-rating-manager` | 평점 담당 | review prompt, rating recovery, store reputation 운영 정리 |
| `/rn-support-ops` | 지원 운영 담당 | support inbox, refund, review response, FAQ 운영 정리 |
| `/rn-incident-manager` | 인시던트 담당 | sev 기준, rollback, comms, postmortem 운영 정리 |

### Release / Testing

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-test-lab` | 테스트 리드 | 테스트 전략, E2E, 수동 회귀 체크 구성 |
| `/rn-device-lab` | 디바이스 담당 | OS/device matrix, device farm, 접근성 회귀 운영 정리 |
| `/rn-observability` | 관측성 담당 | analytics, crash, performance 운영 체계 설계 |
| `/rn-rollout-manager` | 배포 운영 담당 | release channel, staged rollout, hotfix, rollback 전략 설계 |
| `/rn-release-manager` | 릴리즈 매니저 | 출시 준비, QA, 스토어 제출 체크 |

### Team / Automation

| 커맨드 | 역할 | 설명 |
|--------|------|------|
| `/rn-team` | 팀 리더 | 멀티 에이전트 병렬 작업 |
| `/rn-team-status` | 팀 리더 비서 | 팀 상태 확인 |
| `/rn-loop` | 반복 실행기 | 완료 조건까지 반복 작업 |
| `/rn-cancel-loop` | 루프 제어 | 실행 중인 루프 중단 |

---

## 결과물은 어디에 쌓이나요?

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

즉, 앱 코드만이 아니라 출시와 운영에 필요한 실행 문서가 프로젝트 안에 같이 쌓입니다.

---

## 설계 기준

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

네. 다만 Expo가 아니라 Bare React Native 기준이므로, RN CLI로 프로젝트를 만든 뒤 `/rn-bootstrap`부터 시작하는 게 가장 자연스럽습니다.

### 이미 앱이 있는데 `/rn-bootstrap`이 꼭 필요한가요?

아니요. 기존 프로젝트가 있으면 `/rn-architect`, `/rn-ui-upgrade`, `/rn-release-manager`부터 시작해도 됩니다.

### 모든 커맨드가 코드를 직접 수정하나요?

아닙니다.

- 일부는 문서 생성 중심
- 일부는 감사와 체크리스트 중심
- 일부는 실제 코드/구조 수정까지 포함

즉, command마다 역할이 다릅니다.

### 너무 많아서 뭘 써야 할지 모르겠어요

그럴 때는 이 순서만 기억하면 됩니다:

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

예:

```bash
/rn-loop 로그인, 결제, 출시 준비까지 필요한 문서와 구조를 정리해줘 --completion-promise '출시 준비 완료'
```

---

## 참고

- React Native 구현/성능: [vercel-react-native-skills](https://skills.sh/vercel-labs/agent-skills/vercel-react-native-skills), [react-native-best-practices](https://skills.sh/callstackincubator/agent-skills/react-native-best-practices)
- 구조/디자인: [react-native-architecture](https://skills.sh/wshobson/agents/react-native-architecture), [react-native-design](https://skills.sh/wshobson/agents/react-native-design)
- 데이터 계층: [supabase-postgres-best-practices](https://skills.sh/supabase/agent-skills/supabase-postgres-best-practices)
- 성장 운영: [aso-skills](https://github.com/Eronred/aso-skills), [startup-os-skills](https://github.com/ncklrs/startup-os-skills/tree/main/skills), [marketing-skills](https://github.com/robertbstillwell/marketing-skills), [wondelai/skills](https://github.com/wondelai/skills)

이 저장소는 문서형 플러그인 구조를 유지합니다.

- 핵심은 `commands/`, `skills/`, `agents/` 에 있습니다
- 실제 실행 코드는 반복 루프용 스크립트만 둡니다
- 앱 starter 코드나 고정 템플릿 자산을 플러그인 안에 묶어두지 않습니다
