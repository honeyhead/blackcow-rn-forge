# Mobile Test Matrix

## Must-cover flows

- install and first open
- sign up / sign in / sign out
- session restore after app restart
- permission denied and retry
- offline request failure and recovery
- deep link entry
- paywall and purchase
- push notification open
- app update regression

## Tool split

- Jest / RNTL: component logic and state transitions
- Detox: deterministic app flows on CI
- Maestro: high-level smoke flows and release validation

## Good first automation targets

- auth happy path
- paywall view to purchase mock flow
- deep link to target screen
- app cold start to home
