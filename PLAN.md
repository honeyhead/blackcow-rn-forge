# blackcow-rn-forge Plan

## 목표

문서형 플러그인 패턴을 유지하면서, 웹 SaaS 대신 Bare React Native 앱 개발과 모바일 성장 운영에 맞는 플러그인을 만든다.

## 제품 원칙

1. 웹 전용 개념은 제거하고 모바일 개념으로 치환한다.
2. Expo 의존 가이드는 배제하고 Bare React Native 기준으로 문서화한다.
3. 개발 명령과 성장 명령을 동시에 제공한다.
4. 원본 플러그인과 공존할 수 있도록 명령어 네이밍을 분리한다.
5. 반복 작업은 `rn-loop`로 끝까지 밀어붙일 수 있게 한다.
6. 플러그인 자체는 문서형 구조를 유지한다.

## 1차 범위

- Bare React Native 초기 구성
- 모바일 아키텍처 문서화
- 화면/디자인 시스템 구축 가이드
- 모바일 UX 감리
- 모바일 접근성 심화 감사
- 모바일 보안 점검
- 프라이버시 / consent / store disclosure 운영
- 오프라인/동기화 전략
- media capture / upload / cache 파이프라인
- ASO/리텐션/분석/수익화 계획 수립
- 앱 현지화와 국가별 스토어 운영
- device matrix / farm / 접근성 회귀 운영
- release channel / staged rollout / hotfix 운영
- support ops / review response / refund 대응
- review prompt / rating recovery / 스토어 평판 운영
- 인시던트 대응과 postmortem 운영
- 멀티 에이전트와 반복 루프 재사용

## 이후 반복 작업 후보

1. Android flavor / iOS scheme 운영 규칙을 rollout 문서와 더 촘촘히 연결
2. CRM, Braze, OneSignal 같은 engagement provider 비교 기준을 skill reference로 강화
3. 결제 실험과 가격 테스트를 store/localization 흐름과 연결
4. 운영 자동화와 support triage 템플릿을 더 구조화
5. enterprise auth / SSO 전용 command 추가 여부 검토
6. tablet / foldable / desktop-class layout 대응 축 분리 여부 검토

## 커맨드 분류

- Build: `rn-bootstrap`, `rn-architect`, `rn-designer`
- Audit: `rn-ui-upgrade`, `rn-accessibility-guard`, `rn-security-guard`
- Compliance: `rn-privacy-manager`
- Core Flows: `rn-auth-manager`, `rn-billing-manager`
- Platform: `rn-platform-manager`
- Data Reliability: `rn-offline-manager`
- Media: `rn-media-manager`
- Growth: `rn-planner`, `rn-growth-manager`, `rn-store-manager`
- Localization: `rn-localization-manager`
- Engagement: `rn-engagement-manager`
- Testing: `rn-test-lab`, `rn-device-lab`
- Observability: `rn-observability`
- Rollout: `rn-rollout-manager`
- Release: `rn-release-manager`
- Support: `rn-support-ops`
- Reputation: `rn-rating-manager`
- Incident: `rn-incident-manager`
- Orchestration: `rn-team`, `rn-team-status`, `rn-loop`, `rn-cancel-loop`
