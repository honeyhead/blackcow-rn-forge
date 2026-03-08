---
description: "Expo 없이 Bare React Native 프로젝트를 직접 구성해요."
argument-hint: "[새 앱 이름 | 기존 프로젝트 구조 보강 요청]"
allowed-tools:
  - Bash
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
user-invocable: true
---

# rn-bootstrap

예시 입력:

```text
/rn-bootstrap HabitMate
```

당신은 Bare React Native 부트스트래퍼예요. Expo를 기본값으로 제안하지 말고, iOS/Android 폴더가 있는 직접 구성 프로젝트를 만드세요.

## Step 1: 환경 점검

다음을 확인해요:

```bash
node --version
npm --version
ruby --version
java -version
xcodebuild -version
adb version
```

준비되지 않은 항목이 있으면 설치 가이드를 먼저 안내해요.

## Step 2: 프로젝트 생성 방식 결정

기본값은 새 Bare React Native 앱 생성:

```bash
npx @react-native-community/cli@latest init {AppName} --template react-native-template-typescript
```

이미 프로젝트가 있으면 현재 구조를 스캔하고 누락된 것만 보강해요.

기존 프로젝트를 보강할 때는 먼저 아래를 읽고 검색해요:

- `package.json`, `tsconfig.json`, `babel.config.js`, `metro.config.js`
- `ios/`, `android/` 루트 설정 파일
- navigation, state, env, error reporting 관련 현재 구현

이때는 `Glob`으로 구조를 보고, `Read`와 `Grep`으로 이미 있는 설정과 패턴을 확인한 뒤 중복 없이 보강해요.

새 프로젝트라면 생성 직후 아래를 확인해요:

- Hermes 활성화 여부
- New Architecture 사용 여부
- iOS / Android 패키지명
- TypeScript 기본 설정
- 기본 테스트 스크립트

## Step 3: 기본 의존성 구성

앱 유형에 따라 아래를 우선 검토해요:

- `@react-navigation/native`
- `@react-navigation/native-stack`
- `react-native-screens`
- `react-native-safe-area-context`
- `react-native-gesture-handler`
- `react-native-reanimated`
- `zustand` 또는 `jotai`
- `@tanstack/react-query`
- `zod`
- `react-hook-form`
- `react-native-mmkv` 또는 `@react-native-async-storage/async-storage`
- `@sentry/react-native`

카테고리별로 묶어서 설명하세요:

- navigation
- data / caching
- storage
- forms / validation
- observability
- monetization

## Step 4: 최소 구조 정리

기본 디렉토리 제안:

```text
src/
  app/
  screens/
  features/
  components/
  navigation/
  services/
  store/
  hooks/
  lib/
  theme/
  types/
```

## Step 5: 네이티브 기본 설정

다음을 확인하거나 설정해요:

- iOS bundle identifier
- Android applicationId
- 환경변수 주입 방식
- Reanimated Babel 설정
- Gesture Handler 루트 설정
- 다크 모드 대응
- 앱 아이콘/스플래시 전략
- 권한 설명 문자열
- 환경별 앱 이름 suffix
- crash reporting 초기화

## Step 6: 결과 정리

완료 후 아래를 알려줘요:

- 생성/수정된 파일
- 바로 실행할 명령
- 아직 사용자 입력이 필요한 값

실행 예시는 `npm run ios`, `npm run android`를 우선 사용해요.

가능하면 `docs/mobile-bootstrap.md`도 같이 작성해요:

- 현재 선택한 스택
- 아직 미설정인 값
- 다음에 실행할 커맨드

## 출력 원칙

플러그인 안에 고정 starter 파일을 들고 있지 말고, 현재 프로젝트에 맞는 파일과 코드를 직접 생성하거나 수정하세요.
