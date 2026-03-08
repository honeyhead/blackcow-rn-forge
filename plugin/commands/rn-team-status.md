---
description: "모바일 앱 AI 팀의 현재 상태, 충돌 위험, 바로 할 다음 액션을 보여줘요."
allowed-tools:
  - TaskList
  - TaskGet
  - Read
  - Glob
  - Grep
  - Bash
user-invocable: true
---

# rn-team-status

실행 중인 모바일 앱 팀의 상태를 확인해요.

## 보고 형식

상태를 볼 때는 아래 순서로 바로 말해요:

1. 전체 상태: green / yellow / red
2. 진행 중 / 완료 / blocked 태스크 수
3. 지금 당장 충돌 위험이 큰 파일과 owner
4. release blocker 유무
5. 바로 할 다음 액션 3개

## 확인 포인트

1. 태스크 상태
2. worktree 변경량
3. 네이티브 파일 충돌 가능성
4. iOS/Android 설정 충돌
5. QA 대기 항목
6. release 문서 진행도
7. 자동화 테스트 커버리지 공백
8. offline / media 복구 문서 진행도
9. locale / store metadata 정합성
10. rollout gate 정의 여부
11. support triage / refund 문서 진행도
12. incident severity / postmortem 문서 진행도
13. device matrix / farm 운영 문서 진행도
14. rating recovery / review prompt 운영 문서 진행도
15. privacy disclosure / consent 문서 진행도

## 특히 경고할 것

- 여러 팀원이 `ios/Podfile` 또는 `android/app/build.gradle`을 같이 수정한 경우
- `.env` 또는 시크릿 관련 파일을 만진 경우
- 네비게이션 구조를 두 명 이상이 동시에 바꾼 경우
- release 관련 문서가 비어 있는데 코드만 먼저 끝난 경우
- offline queue 규칙이 바뀌었는데 QA matrix가 갱신되지 않은 경우
- store metadata와 localized app copy가 서로 다른 포지셔닝을 쓰는 경우
- rollout / rollback 문서가 없는데 feature flag만 먼저 추가된 경우
- 장애 알람은 있는데 incident owner와 rollback owner가 비어 있는 경우
- billing 문의가 많은데 refund / escalation 문서가 없는 경우
- 지원 OS / 기기 범위가 안 정해졌는데 레이아웃 회귀가 늘어나는 경우
- review prompt 실험은 있는데 부정 리뷰 복구 운영 문서가 없는 경우
- analytics / ad SDK가 추가됐는데 privacy disclosure 문서가 비어 있는 경우

## 상태 해석 가이드

- green: owner 충돌이 없고 blocker 없이 진행 가능한 상태
- yellow: 진행은 가능하지만 문서/계약/QA 공백이 있는 상태
- red: 네이티브 충돌, release blocker, privacy blocker처럼 바로 멈춰야 하는 상태
