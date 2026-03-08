# Mobile Workstreams

## Good splits

- native-core: app shell, env, navigation root
- feature-dev: feature module and API integration
- ui-dev: screen layout and design tokens
- backend-dev: auth, sync, data contract
- qa-release: test matrix, release docs, store checklist

## Bad splits

- two agents editing `android/app/build.gradle`
- two agents editing root navigation at the same time
- multiple agents changing auth flow without a shared contract

## Handoff rules

- define route names before UI implementation
- define API response shapes before screen wiring
- keep release checklist updated while features are landing
