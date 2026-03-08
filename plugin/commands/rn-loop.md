---
description: "완료 조건까지 계속 반복하며 모바일 앱 작업을 밀어붙여요."
argument-hint: "할 일 [--max-iterations 횟수] [--completion-promise 완료조건]"
allowed-tools: ["Bash(${CLAUDE_PLUGIN_ROOT}/scripts/setup-rn-loop.sh:*)"]
hide-from-slash-command-tool: "true"
user-invocable: true
---

# rn-loop

셋업 스크립트를 실행해서 모바일 작업 루프를 시작해요:

```!
"${CLAUDE_PLUGIN_ROOT}/scripts/setup-rn-loop.sh" $ARGUMENTS
```

중요 규칙:
- 완료 조건이 있으면 실제로 충족됐을 때만 `<promise>...</promise>` 를 출력해요.
- RN 앱은 빌드, 런타임, 네이티브 설정까지 확인해야 완료로 간주해요.
