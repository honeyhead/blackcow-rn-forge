# Device Lab Matrix

## 1. 분류 기준

- iPhone standard / Pro / small-screen
- Android flagship / mid-range / low-end
- 최신 OS / 최소 지원 OS
- OEM 편차가 큰 Android 기기
- accessibility 보조기기 사용 시나리오

## 2. 최소 세트

- iOS 최신 메이저 1대
- iOS 최소 지원 버전 1대
- Android 최신 flagship 1대
- Android mid-range 1대
- Android low-end 1대

앱 특성상 media, camera, GPS, payment가 중요하면 기기 수를 늘린다.

## 3. 자주 놓치는 항목

- notch / cutout / safe area 차이
- OEM permission popup 차이
- background 제한 정책 차이
- font rendering / line height 차이
- TalkBack / VoiceOver 동작 차이

## 4. 운영 규칙

- pre-release smoke set과 weekly broad regression set을 분리한다
- device farm flaky run은 즉시 제품 실패로 간주하지 말고 재현성 기준을 둔다
- 저사양 성능 회귀는 FPS보다 startup, scroll, input latency 체감으로 본다

## 5. 필수 문서

- `docs/testing/device-matrix.md`
- `docs/testing/device-lab-ops.md`
- `docs/testing/a11y-regression-matrix.md`
