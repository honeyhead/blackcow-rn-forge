---
description: "실행 중인 RN 루프를 중단해요."
allowed-tools: ["Bash(test -f .claude/blackcow-rn-loop.local.md:*)", "Bash(rm -f .claude/blackcow-rn-loop.local.md)", "Read(.claude/blackcow-rn-loop.local.md)"]
hide-from-slash-command-tool: "true"
user-invocable: true
---

# rn-cancel-loop

루프를 취소하려면:

1. `.claude/blackcow-rn-loop.local.md` 가 있는지 확인해요.
2. 없으면 실행 중인 루프가 없다고 안내해요.
3. 있으면 현재 `iteration:` 값을 읽고 파일을 삭제해요.
4. 몇 번째 반복 중이었는지 함께 알려줘요.
