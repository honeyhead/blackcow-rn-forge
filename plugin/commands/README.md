# Command Index

이 디렉터리는 `blackcow-rn-forge`의 사용자 진입점 slash command 32개를 담습니다.

## Start Here

- `/rn-help` - 지금 상황에 맞는 시작 커맨드와 다음 순서 추천 (`rn-help.md`)
- `/rn-workflow` - 기획부터 운영까지 단계형 command 흐름 설계 (`rn-workflow.md`)

## Build / Product

- `/rn-planner` - 앱 아이디어를 PRD로 정리 (`rn-planner.md`)
- `/rn-bootstrap` - Bare React Native 초기 구조를 잡기 시작 (`rn-bootstrap.md`)
- `/rn-architect` - 앱 구조와 기술 결정을 설계 (`rn-architect.md`)
- `/rn-designer` - 디자인 시스템과 화면 UI를 설계/구현 (`rn-designer.md`)

## Quality / Compliance

- `/rn-ui-upgrade` - UX, 접근성, 성능을 함께 점검 (`rn-ui-upgrade.md`)
- `/rn-accessibility-guard` - screen reader와 dynamic type 중심 접근성 감사 (`rn-accessibility-guard.md`)
- `/rn-security-guard` - 모바일 보안 리스크 점검 (`rn-security-guard.md`)
- `/rn-privacy-manager` - ATT, consent, deletion, disclosure 정리 (`rn-privacy-manager.md`)

## Core Flows / Platform

- `/rn-auth-manager` - 인증, 세션 복구, 소셜 로그인 흐름 설계 (`rn-auth-manager.md`)
- `/rn-billing-manager` - 구독, IAP, paywall 과금 전략 정리 (`rn-billing-manager.md`)
- `/rn-platform-manager` - 푸시, 딥링크, 권한, lifecycle 통합 (`rn-platform-manager.md`)
- `/rn-offline-manager` - 오프라인 복구와 sync queue 정책 설계 (`rn-offline-manager.md`)
- `/rn-media-manager` - 카메라, 업로드, 캐시, background transfer 정리 (`rn-media-manager.md`)

## Growth / Store / Operations

- `/rn-growth-manager` - ASO, 분석, 리텐션, 수익화 전략 설계 (`rn-growth-manager.md`)
- `/rn-localization-manager` - locale 우선순위와 국가별 운영 정책 정리 (`rn-localization-manager.md`)
- `/rn-store-manager` - App Store / Play Store 메타데이터 정리 (`rn-store-manager.md`)
- `/rn-engagement-manager` - 푸시, referral, win-back 운영 설계 (`rn-engagement-manager.md`)
- `/rn-rating-manager` - review prompt와 평점 회복 운영 규칙 정리 (`rn-rating-manager.md`)
- `/rn-support-ops` - support inbox, refund, review response 운영 정리 (`rn-support-ops.md`)
- `/rn-incident-manager` - sev, rollback, comms, postmortem 체계 정리 (`rn-incident-manager.md`)

## Release / Testing

- `/rn-test-lab` - 테스트 전략과 QA 검증 흐름 정리 (`rn-test-lab.md`)
- `/rn-device-lab` - OS/device matrix와 device farm 운영 기준 정리 (`rn-device-lab.md`)
- `/rn-observability` - 앱 분석, 크래시, 성능 관측 체계 정리 (`rn-observability.md`)
- `/rn-rollout-manager` - staged rollout, hotfix, rollback 기준 정리 (`rn-rollout-manager.md`)
- `/rn-release-manager` - 출시 준비, 서명, 제출, QA 체크리스트 정리 (`rn-release-manager.md`)

## Team / Automation

- `/rn-team` - 큰 모바일 작업을 병렬 팀으로 나눠 운영 (`rn-team.md`)
- `/rn-team-status` - blocker, 충돌 위험, 다음 액션 확인 (`rn-team-status.md`)
- `/rn-loop` - 완료 조건까지 반복 실행 (`rn-loop.md`)
- `/rn-cancel-loop` - 실행 중인 RN 루프 중단 (`rn-cancel-loop.md`)

루프 관련 실제 스크립트는 `../scripts/setup-rn-loop.sh`, `../hooks/stop-hook.sh` 에 있습니다.
