---
name: blackcow-rn-offline
description: >
  "offline first", "offline sync", "cache invalidation", "sync queue", "optimistic update",
  "local storage", "conflict resolution", "background sync", "오프라인 우선", "동기화 전략",
  "캐시 정책", "충돌 해결" 같은 모바일 데이터 복구 작업일 때 사용하세요.
---

# Mobile Offline Sync

React Native 앱의 offline-first, local persistence, sync queue, conflict policy를 다루는 스킬입니다.

## 핵심 원칙

1. offline은 예외 처리 항목이 아니라 제품 요구사항으로 보세요.
2. local source of truth와 remote authority를 섞지 말아요.
3. optimistic update를 쓰면 반드시 idempotency와 retry 규칙을 같이 적어요.
4. sync 품질은 화면 UX와 metric 둘 다로 검증해요.

## 다루는 영역

- local storage map
- cache policy
- mutation queue
- conflict resolution
- retry / resume triggers

## 읽을 자료

- `references/offline-sync-playbook.md`
