# Blackcow RN Forge

<p>
  <a href="https://github.com/honeyhead/blackcow-rn-forge/stargazers"><img src="https://img.shields.io/github/stars/honeyhead/blackcow-rn-forge?style=social" alt="GitHub Stars" /></a>
  <a href="https://github.com/honeyhead/blackcow-rn-forge/blob/main/LICENSE"><img src="https://img.shields.io/github/license/honeyhead/blackcow-rn-forge" alt="License" /></a>
  <a href="https://github.com/honeyhead/blackcow-rn-forge"><img src="https://img.shields.io/github/last-commit/honeyhead/blackcow-rn-forge" alt="Last Commit" /></a>
</p>

Bare React Native 앱을 Claude Code 안에서 기획하고, 구조를 설계하고, 출시하고, 운영하는 흐름을 command 중심으로 정리하는 플러그인입니다.

이 저장소는 "코드 템플릿 한 번 뿌리기"보다 현재 프로젝트 문맥을 읽고 문서, 체크리스트, 운영 산출물을 쌓아가는 워크플로우에 더 가깝습니다.

[빠른 시작](#빠른-시작) · [추천 흐름](#추천-흐름) · [YOLO 모드](#yolo-모드) · [라이프사이클 플로우](#라이프사이클-플로우) · [핵심 커맨드](#핵심-커맨드) · [커맨드 맵](#커맨드-맵) · [`/rn-loop`](#rn-loop) · [FAQ](#faq) · [최근 변경사항](CHANGELOG.md)

---

## 한눈에 보기

- Bare React Native 기준으로 앱 기획부터 출시 운영까지 이어지는 command 세트를 제공합니다.
- 아키텍처, auth, billing, offline, media, QA, release, ASO, support 흐름을 문서형으로 정리합니다.
- 새 프로젝트뿐 아니라 이미 운영 중인 RN 프로젝트에도 바로 붙여서 쓸 수 있습니다.
- 큰 작업은 `/rn-loop`, 병렬 작업은 `/rn-team` 계열로 밀어붙일 수 있습니다.
- 전체 command 흐름이 필요하면 `/rn-workflow`가 기획부터 운영까지 단계를 연결해 줍니다.
- YOLO 모드가 필요하면 `/rn-yolo-plan` -> `/rn-yolo-build`를 기본 고속 트랙으로 쓰고, 길어질 때만 `/rn-loop`를 붙이면 됩니다.

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
/rn-yolo-plan https://ref1 https://ref2 "광고/부스터 중심 방치형 리워드 앱"
/rn-yolo-build
/rn-workflow 습관 앱 아이디어가 있는데 기획 -> 구조 설계 -> 출시 준비 -> 운영까지 어떤 command 순서로 진행하면 되는지 정리해줘
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
| 빨리 하나 출시하고 싶을 때 | `/rn-yolo-plan` -> `/rn-yolo-build` -> 필요시 `/rn-loop` | refs 기반 빠른 기획, 현재 프로젝트 기반 빠른 실행, 남은 작업 반복 |
| 전체 흐름이 필요할 때 | `/rn-workflow` -> 각 단계별 command 실행 | 기획 -> 구조 -> 출시 -> 운영까지 이어지는 command 로드맵 |
| 시작점이 막막할 때 | `/rn-help` -> `/rn-planner` 또는 `/rn-architect` | 현재 상황에 맞는 첫 커맨드와 다음 순서 |
| 새 앱을 시작할 때 | `/rn-planner` -> `/rn-bootstrap` -> `/rn-architect` | PRD, 초기 구조, 아키텍처 문서 |
| 기존 앱을 정리할 때 | `/rn-architect` -> `/rn-ui-upgrade` -> `/rn-security-guard` | 구조 재정리, UX 감사, 보안 점검 |
| 출시 직전일 때 | `/rn-test-lab` -> `/rn-device-lab` -> `/rn-release-manager` | QA matrix, 기기 점검, 스토어 제출 체크 |
| 운영 단계일 때 | `/rn-growth-manager` -> `/rn-rating-manager` -> `/rn-support-ops` | 성장 전략, 평점 운영, 지원 운영 룰 |
| 작업이 크고 길 때 | `/rn-team` -> `/rn-team-status` -> `/rn-loop` | 병렬 진행, 상태 추적, 반복 실행 |

---

## YOLO 모드

레퍼런스를 던지고 빨리 출시 가능한 앱 하나를 정한 뒤, 현재 프로젝트에서 바로 구현까지 밀고 싶다면 이 두 개를 기본 트랙으로 쓰면 됩니다.

```text
/rn-yolo-plan https://ref1 https://ref2 "방치형으로 금을 캐고 일정 시간마다 광고를 봐야 채굴이 이어지고, 광고/유료 부스터로 속도를 높이는 방치형 리워드 앱"
/rn-yolo-build
/rn-loop 부족한 문서와 QA 정리를 이어서 진행해줘 --completion-promise 'pre-ops readiness 완료'
```

| 커맨드 | 역할 | 기본값 |
| --- | --- | --- |
| `/rn-yolo-plan` | 레퍼런스 기반 빠른 컨셉 확정, MVP 범위, build brief 작성 | refs + 한 줄 아이디어 입력 |
| `/rn-yolo-build` | 현재 워크스페이스와 최신 yolo brief/PRD를 읽고 pre-ops readiness까지 실행 | 현재 프로젝트 / 최신 brief/PRD |

YOLO 모드 기본 원칙은 아래와 같습니다.

- 분석보다 빠른 출시 가능성을 우선합니다.
- growth / support / incident는 기본 범위에서 뺍니다.
- observability / release / QA는 최소 세트만 챙깁니다.
- `rn-yolo-build`는 slug를 강제하지 않고 현재 워크스페이스를 기본값으로 사용합니다.
- 기본 흐름은 `/rn-yolo-plan` -> `/rn-yolo-build`이고, 한 번에 안 끝나는 작업만 `/rn-loop`로 넘깁니다.

---

## 라이프사이클 플로우

기획부터 운영까지 전체 command 흐름을 한 번에 설계하고 싶으면 `/rn-workflow`로 시작하면 됩니다.

```text
/rn-workflow 기존 RN 앱 기준으로 기획 보강부터 출시 준비와 운영 문서까지 어떤 command 순서로 이어가면 될지 정리해줘
```

기본적으로는 아래 4단계로 묶어 설명합니다.

| 단계 | 먼저 보는 command | 기대 산출물 |
| --- | --- | --- |
| 기획 | `/rn-help`, `/rn-planner` | 시작점 판단, PRD |
| 구조 설계 | `/rn-bootstrap`, `/rn-architect`, `/rn-designer` | 초기 구조, 아키텍처, 화면 패턴 |
| 출시 준비 | `/rn-test-lab`, `/rn-device-lab`, `/rn-observability`, `/rn-rollout-manager`, `/rn-release-manager` | QA, release health, rollout, store checklist |
| 운영 | `/rn-growth-manager`, `/rn-rating-manager`, `/rn-support-ops`, `/rn-incident-manager` | 성장 운영, 평점 운영, 지원/장애 대응 |

핵심 기능 축은 필요할 때 중간에 끼워 넣습니다.

- 인증/세션: `/rn-auth-manager`
- 푸시/딥링크/권한: `/rn-platform-manager`
- 오프라인 복구: `/rn-offline-manager`
- 미디어 파이프라인: `/rn-media-manager`
- 보안/프라이버시: `/rn-security-guard`, `/rn-privacy-manager`

작업이 길어지면 `/rn-team`으로 병렬화하고, 완료 조건까지 밀 때는 `/rn-loop`를 붙이면 됩니다.

---

## 핵심 커맨드

| 커맨드 | 역할 | 언제 먼저 쓰면 좋은가 |
| --- | --- | --- |
| `/rn-help` | 시작점 추천 | 지금 뭘 먼저 써야 할지 감이 안 올 때 |
| `/rn-yolo-plan` | refs 기반 빠른 기획 확정 | 경쟁앱을 참고해 빨리 하나 밀고 싶을 때 |
| `/rn-yolo-build` | 현재 프로젝트 기반 빠른 실행 | 최신 yolo brief/PRD를 바탕으로 바로 구현에 들어가고 싶을 때 |
| `/rn-workflow` | 단계형 command 로드맵 설계 | 기획부터 운영까지 전체 흐름을 command 순서로 보고 싶을 때 |
| `/rn-planner` | 모바일 PRD 정리 | 앱 아이디어가 아직 흐릴 때 |
| `/rn-bootstrap` | Bare RN 초기 구조 정리 | 프로젝트를 막 시작했을 때 |
| `/rn-architect` | 구조 설계 | navigation, state, offline, release 흐름을 먼저 고정하고 싶을 때 |
| `/rn-release-manager` | 출시 준비 점검 | QA, signing, store checklist가 비어 있을 때 |
| `/rn-loop` | 반복 실행 | 완료 조건까지 긴 작업을 계속 밀고 싶을 때 |

막막하면 `/rn-help` 로 시작하고, 가장 무난한 시작 순서는 아래 다섯 개입니다.

```text
/rn-workflow
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
```

---

## 커맨드 능력 매트릭스

처음 쓸 때 가장 헷갈리는 지점은 "이 커맨드가 문서만 쓰는지, 코드까지 건드릴 수 있는지, 자동화가 어느 정도인지"입니다. 아래 표를 기준으로 기대치를 맞추면 됩니다.

| 커맨드 | 주 역할 | 주 산출물 | 코드/구조 수정 가능성 | 자동화 수준 |
| --- | --- | --- | --- | --- |
| `/rn-help` | 시작점 추천 | 다음 커맨드와 예시 입력 | 낮음 | 낮음 |
| `/rn-workflow` | 단계형 로드맵 설계 | command 순서와 handoff | 낮음 | 낮음 |
| `/rn-yolo-plan` | refs 기반 빠른 기획 | PRD, `docs/yolo-build-brief.md` | 중간 | 중간 |
| `/rn-yolo-build` | 현재 프로젝트 기반 빠른 실행 | MVP 구현, architecture/observability/release 문서 | 높음 | 높음 |
| `/rn-planner` | 일반 PRD 작성 | `docs/mobile-prd/{name}.md` | 낮음 | 중간 |
| `/rn-architect` | 구조 설계/보강 | `docs/mobile-architecture.md` | 중간 | 중간 |
| `/rn-release-manager` | 출시 준비 점검 | `docs/release/` 문서 | 낮음 | 중간 |
| `/rn-loop` | 완료 조건까지 반복 실행 | 상태 파일 기반 지속 실행 | 높음 | 가장 높음 |

요약하면 `/rn-help`, `/rn-workflow`는 길잡이이고, `/rn-yolo-plan`, `/rn-planner`, `/rn-architect`, `/rn-release-manager`는 문서 중심 설계 축이며, `/rn-yolo-build`와 `/rn-loop`는 실제 실행 쪽 기대치를 높게 가져가도 되는 커맨드입니다.

---

## 커맨드 맵

### Start Here

`/rn-help`, `/rn-workflow`

지금 상황에 맞는 첫 커맨드 또는 전체 lifecycle command 흐름을 추천합니다.

### Build / Product

`/rn-yolo-plan`, `/rn-yolo-build`, `/rn-planner`, `/rn-bootstrap`, `/rn-architect`, `/rn-designer`

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
/rn-yolo-plan https://ref1 https://ref2 "광고와 부스터가 있는 방치형 리워드 앱"
/rn-yolo-build
/rn-workflow 지금 있는 RN 앱을 기준으로 다음 단계 command 흐름을 기획 -> 구조 설계 -> 출시 준비 -> 운영 순서로 짜줘
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
- `--max-iterations` 를 주면 해당 회차에 도달했을 때 상태 파일을 지우고 루프를 종료합니다.
- loop 훅은 `jq` 가 필요하고, 상태 파일은 `.claude/blackcow-rn-loop.local.md` 에 저장됩니다.
- `--completion-promise` 는 완료 조건으로 저장만 하고, 실제 작업이 끝났을 때만 `<promise>...</promise>` 가 출력됩니다.

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
- `docs/yolo-build-brief.md`
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

네. 전체 흐름이 필요하면 `/rn-workflow`, 바로 PRD부터 만들려면 `/rn-planner`로 시작하면 됩니다. 새 앱이면 그다음 `/rn-bootstrap`, 기존 앱이면 `/rn-architect` 쪽으로 이어가면 됩니다.

### 기존 앱이 있는데 `/rn-bootstrap`이 꼭 필요한가요?

아니요. 이미 프로젝트가 있으면 `/rn-architect`, `/rn-ui-upgrade`, `/rn-release-manager`부터 바로 시작해도 됩니다.

### `/rn-yolo-build`는 언제 바로 써도 되나요?

현재 워크스페이스가 이미 있거나 `docs/yolo-build-brief.md`, `docs/mobile-prd/*.md` 중 하나라도 있으면 바로 써도 됩니다. 아무 계획 문서도 없고 프로젝트도 비어 있으면 먼저 `/rn-yolo-plan`으로 컨셉과 범위를 확정하는 편이 맞습니다.

### PRD가 여러 개면 `/rn-yolo-build`가 마음대로 고르나요?

아니요. 현재 프로젝트와 맞는 문서가 하나로 좁혀지면 바로 진행하고, 여러 PRD가 동시에 후보면 그때만 짧게 한 번 확인하도록 설계돼 있습니다.

### 모든 커맨드가 코드를 직접 수정하나요?

아닙니다. 문서 생성 중심인 커맨드도 있고, 감사/체크리스트 중심인 커맨드도 있고, 실제 코드와 구조 수정까지 이어지는 커맨드도 있습니다.

### 커맨드가 많아서 뭘 먼저 써야 할지 모르겠어요.

그럴 땐 전체 흐름이면 `/rn-workflow`, 시작점 추천이면 `/rn-help`를 먼저 쓰고, 바로 시작하고 싶으면 이 다섯 개부터 기억하면 됩니다.

```text
/rn-workflow
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
```

### 영어 README는 없나요?

지금은 한국어 README 하나만 유지합니다.
