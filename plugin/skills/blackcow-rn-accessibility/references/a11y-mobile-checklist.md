# Mobile Accessibility Checklist

## 1. semantic contract

- 아이콘 버튼에 label과 hint를 둔다
- 상태 변화는 텍스트나 announcement로 노출한다
- disabled, selected, loading 상태를 screen reader가 읽을 수 있게 한다

## 2. focus and navigation

- modal, sheet, dialog는 focus 진입과 복귀를 제어한다
- tab, carousel, custom list는 순회 순서를 명확히 한다
- gesture only interaction에는 대체 조작을 둔다

## 3. dynamic type

- headline, body, caption의 확장 한계를 정한다
- 큰 글꼴에서 CTA 잘림 여부를 따로 본다
- scroll 안의 form에서 키보드와 큰 글꼴이 겹치지 않게 본다

## 4. feedback and motion

- error, success, validation은 시각 외 채널로도 전달한다
- reduced motion 사용자는 과한 animation을 피한다
- haptic이 없어도 이해 가능한 흐름을 만든다

## 5. 꼭 볼 화면

- onboarding
- auth
- paywall
- settings
- permission prompt 직전/직후
- deep link / error recovery

## 6. 필수 문서

- `docs/accessibility/a11y-audit.md`
- `docs/accessibility/screen-reader-map.md`
- `docs/accessibility/dynamic-type-plan.md`
