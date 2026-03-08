---
description: "완료 조건까지 반복 실행해요. --status로 확인하고, --resume으로 이어가고, --cancel로 명시적으로 중단해요."
argument-hint: "--status | --cancel | [--resume] 할 일 [--max-iterations 횟수] [--completion-promise 완료조건]"
allowed-tools: ["Bash(${CLAUDE_PLUGIN_ROOT}/scripts/setup-rn-loop.sh:*)"]
hide-from-slash-command-tool: true
user-invocable: true
---

# rn-loop

예시 입력:

```text
/rn-loop 로그인부터 출시 준비까지 필요한 문서와 구조를 정리해줘 --completion-promise '출시 준비 완료'
```

셋업 스크립트를 실행해서 모바일 작업 루프를 시작해요:

```!
"${CLAUDE_PLUGIN_ROOT}/scripts/setup-rn-loop.sh" $ARGUMENTS
```

중요 규칙:
- `--status` 는 상태 파일을 읽기만 하고 루프를 시작/재개/중단하지 않아요. 다른 인자 없이 단독으로 실행해요.
- `--cancel` 은 명시적으로 요청했을 때만 상태 파일을 정리해요. 다른 인자 없이 단독으로 실행해요.
- `--status`, `--cancel`, `--resume` 은 함께 섞지 않고 한 번에 하나만 써요.
- active 루프가 이미 있으면 새로 덮어쓰지 않아요. 이때는 `--resume` 으로 이어가거나 `/rn-cancel-loop` 로 중단해요.
- `--resume` 으로 재개하면 iteration 이 다음 회차로 증가하고 상태 파일을 같은 경로에서 갱신해요. 훅 오류로 inactive 상태가 된 루프도 명시적으로 이어갈 수 있어요.
- 완료 조건이 있으면 실제로 충족됐을 때만 `<promise>...</promise>` 를 출력해요.
- RN 앱은 빌드, 런타임, 네이티브 설정까지 확인해야 완료로 간주해요.
