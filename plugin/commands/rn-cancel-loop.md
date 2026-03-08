---
description: "실행 중인 RN 루프를 중단해요. 중단 전에는 /rn-loop --status로 상태만 확인할 수 있어요."
allowed-tools: ["Bash(${CLAUDE_PLUGIN_ROOT}/scripts/setup-rn-loop.sh:*)"]
hide-from-slash-command-tool: "true"
user-invocable: true
---

# rn-cancel-loop

셋업 스크립트를 통해 루프를 안전하게 중단해요:

```!
"${CLAUDE_PLUGIN_ROOT}/scripts/setup-rn-loop.sh" --cancel
```

동작 방식:
- 상태 파일이 없으면 "중단할 루프 없음"으로 안내하고 아무것도 지우지 않아요.
- 상태 파일이 inactive 면 실행 중 루프는 없다고 안내해요. 필요하면 `/rn-loop --resume 다음 할 일` 로 이어가고, 버리려면 남아 있던 상태 파일만 정리해요.
- 상태 파일이 active 면 현재 iteration 을 알려준 뒤 상태 파일을 삭제해요.
- 취소 후에는 `/rn-loop 새 할 일`로 새로 시작하고, 확인만 하려면 `/rn-loop --status`를 써요.
