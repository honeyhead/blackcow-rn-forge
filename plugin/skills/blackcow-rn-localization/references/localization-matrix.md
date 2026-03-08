# Localization Matrix

## 1. locale 우선순위

- tier 1: 핵심 매출 국가와 초기 런칭 국가
- tier 2: ASO 테스트 가치가 있는 국가
- tier 3: 지원 문의 대응이 가능한 국가

locale 추가 여부는 번역 비용보다 운영 비용으로 판단한다.

## 2. 현지화 범위

- 앱 UI copy
- onboarding / paywall / empty state
- push / email / referral message
- billing / refund / support copy
- App Store / Play Store 메타데이터
- screenshot caption / video subtitle

## 3. source of truth

- `locales/` 혹은 CMS를 번역 원본으로 정한다
- 용어집은 PM, designer, marketer가 함께 승인한다
- 제품 이름, 기능 이름, 핵심 CTA는 임의 번역을 금지한다

## 4. 자주 깨지는 포인트

- 긴 독일어/프랑스어 문장으로 버튼 잘림
- 한국어/일본어 line-height 차이
- 아랍어 등 RTL 지원 미검토
- plural rule 누락
- 통화/날짜 formatting locale 불일치

## 5. store localization 규칙

- 앱 설명은 literal translation보다 국가별 keyword intent에 맞춘다
- screenshot copy는 앱 UI보다 더 짧고 강하게 쓴다
- 지원하지 않는 언어를 스토어에서 먼저 약속하지 않는다

## 6. QA 체크

- locale 전환 후 캐시된 문자열 갱신
- notification payload locale 적용
- paywall 가격 표기와 실제 billing currency 일치
- dynamic text 길이 증가 시 레이아웃 유지
- fallback locale이 한 화면 안에서 섞이지 않는지 확인

## 7. 필수 문서

- `docs/localization/locale-plan.md`
- `docs/localization/i18n-glossary.md`
- `docs/release/store-localization.md`
