---
name: blackcow-rn-device-lab
description: >
  "react native device lab", "device matrix", "real device testing", "device farm",
  "os coverage", "a11y regression", "디바이스 테스트", "실기기 검증", "기기 매트릭스",
  "접근성 회귀" 같은 모바일 기기 검증 작업일 때 사용하세요.
---

# Mobile Device Lab

React Native 앱의 representative device matrix, device farm, accessibility regression 운영을 다루는 스킬입니다.

## 핵심 원칙

1. emulator 통과는 release safety와 다르다는 전제로 시작해요.
2. device matrix는 시장 점유율과 제품 리스크를 같이 반영해야 해요.
3. 저사양, OEM 편차, 접근성 보조기기는 별도 coverage로 봐야 해요.
4. device lab 운영은 테스트 전략과 release gate에 연결돼야 해요.

## 다루는 영역

- device matrix
- device pool / farm
- low-end coverage
- accessibility regression devices
- release smoke set

## 읽을 자료

- `references/device-lab-matrix.md`
