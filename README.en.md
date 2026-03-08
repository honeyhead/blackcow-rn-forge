[한국어](README.md) | **English**

# Blackcow RN Forge

Blackcow RN Forge is a Claude Code plugin for Bare React Native apps, inspired by the document-driven operating pattern used in `fireauto`.

## Overview

This plugin is not just a code generator for React Native apps. It is a command- and document-driven operating layer for managing the full app lifecycle:

- app planning and architecture
- auth, billing, offline, and media flow design
- accessibility, security, privacy, and QA audits
- ASO, ratings, retention, and store operations
- rollout, release, incident response, and support operations

Core direction:
- focused on iOS and Android app workflows rather than web SaaS
- designed for Bare React Native instead of Expo-first defaults
- covers not only development, but also ASO, retention, analytics, and monetization
- uses the `rn-` slash command prefix so it can coexist with other web-oriented plugins

## Good fit for

- teams starting a Bare React Native app in a structured way
- teams trying to make an existing RN app release-ready
- projects where QA, release, growth, privacy, and support documents are scattered
- users who want Claude Code to act like an operating partner rather than only a code generator

## Installation

### Install from GitHub

```bash
/plugin marketplace add honeyhead/blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

To install at project scope:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

### Local development install

If you cloned the repository locally and want to test it directly:

```bash
/plugin marketplace add ./blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

To install at project scope:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

## What you can do with this plugin

- `/rn-planner`: turn an app idea into a mobile PRD
- `/rn-architect`: design navigation, state, and release structure
- `/rn-auth-manager`: define auth, session restore, and OAuth callback flows
- `/rn-offline-manager`: define offline-first, cache, and sync queue policy
- `/rn-release-manager`: prepare release, QA, and store submission workflows
- `/rn-growth-manager`: plan ASO, analytics, retention, and monetization
- `/rn-incident-manager`: define rollback, incident response, and postmortem operations

In practice, it helps generate the documents and execution plans needed for both building and operating a React Native app in the context of the current project.

## Commands

| Command | Role | Description |
|--------|------|------|
| `/rn-planner` | Mobile planner | Turn an app idea into a mobile PRD |
| `/rn-bootstrap` | Bootstrapper | Set up a Bare React Native project baseline |
| `/rn-architect` | Architect | Design navigation, state, offline, and release structure |
| `/rn-designer` | Mobile designer | Build the design system, screen patterns, and components |
| `/rn-ui-upgrade` | UX auditor | Audit and improve mobile UX, accessibility, and performance |
| `/rn-accessibility-guard` | Accessibility lead | Audit screen reader, focus, dynamic type, and reduced motion |
| `/rn-security-guard` | Security lead | Audit mobile app security risks |
| `/rn-privacy-manager` | Privacy lead | Define ATT, consent, data deletion, and store disclosure |
| `/rn-auth-manager` | Auth lead | Design auth, session restore, OAuth callback, and deep link flows |
| `/rn-billing-manager` | Billing lead | Design subscriptions, IAP, entitlements, and paywall provider flows |
| `/rn-platform-manager` | Platform lead | Design push, deep links, permissions, and lifecycle integration |
| `/rn-offline-manager` | Sync lead | Define offline-first, cache, sync queue, and conflict policy |
| `/rn-media-manager` | Media lead | Design camera, gallery, upload, cache, and background transfer |
| `/rn-growth-manager` | Growth lead | Plan ASO, analytics, retention, and monetization |
| `/rn-localization-manager` | Localization lead | Plan app i18n, country-specific store strategy, and translation ops |
| `/rn-store-manager` | Store lead | Write metadata, screenshot messaging, and review notes |
| `/rn-test-lab` | Test lead | Build test strategy, E2E coverage, and manual regression flows |
| `/rn-device-lab` | Device lead | Define OS/device matrix, device farm coverage, and accessibility regression |
| `/rn-observability` | Observability lead | Plan analytics, crash, and performance operations |
| `/rn-engagement-manager` | Engagement lead | Design push, referral, win-back, and paywall re-entry operations |
| `/rn-rollout-manager` | Rollout lead | Define release channels, staged rollout, hotfix, and rollback strategy |
| `/rn-release-manager` | Release manager | Prepare release readiness, QA, and store submission |
| `/rn-support-ops` | Support lead | Organize support inbox, refunds, review response, and FAQ operations |
| `/rn-rating-manager` | Ratings lead | Define review prompts, rating recovery, and store reputation operations |
| `/rn-incident-manager` | Incident lead | Define severity, rollback, communications, and postmortems |
| `/rn-team` | Team lead | Run multi-agent parallel execution |
| `/rn-team-status` | Team assistant | Check team execution status |
| `/rn-loop` | Loop runner | Repeat work until completion conditions are met |
| `/rn-cancel-loop` | Loop control | Stop an active loop |

## Recommended order

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-designer
5. /rn-ui-upgrade
6. /rn-accessibility-guard
7. /rn-security-guard
8. /rn-privacy-manager
9. /rn-auth-manager
10. /rn-billing-manager
11. /rn-platform-manager
12. /rn-offline-manager
13. /rn-media-manager
14. /rn-growth-manager
15. /rn-localization-manager
16. /rn-store-manager
17. /rn-test-lab
18. /rn-device-lab
19. /rn-observability
20. /rn-engagement-manager
21. /rn-rollout-manager
22. /rn-release-manager
23. /rn-support-ops
24. /rn-rating-manager
25. /rn-incident-manager
```

## Structure

```text
blackcow-rn-forge/
├── README.md
├── README.en.md
├── PLAN.md
├── LICENSE
├── .claude-plugin/marketplace.json
└── plugin/
    ├── .claude-plugin/plugin.json
    ├── commands/
    ├── hooks/
    ├── scripts/
    └── skills/
```

## Design principles

- uses `React Navigation` rather than `Expo Router`
- prefers lightweight state patterns such as `Zustand` or `Jotai`
- assumes `Reanimated` and `Gesture Handler` for motion and gesture work
- treats `Supabase` as a strong candidate for auth and data, with mobile security and offline recovery considered together
- treats flaky network conditions as a default constraint, not an edge case
- treats accessibility as an operating quality bar, including screen reader, dynamic type, and reduced motion
- treats privacy/compliance as part of SDK, analytics, and account deletion design, not only a pre-release checklist
- includes store metadata, pricing, and language priority in localization strategy
- includes real device matrix and OS distribution in testing strategy
- includes ASO, analytics, retention, and monetization before launch

## External references that informed the design

- React Native implementation and performance: [vercel-react-native-skills](https://skills.sh/vercel-labs/agent-skills/vercel-react-native-skills), [react-native-best-practices](https://skills.sh/callstackincubator/agent-skills/react-native-best-practices)
- Architecture and design: [react-native-architecture](https://skills.sh/wshobson/agents/react-native-architecture), [react-native-design](https://skills.sh/wshobson/agents/react-native-design)
- Data layer: [supabase-postgres-best-practices](https://skills.sh/supabase/agent-skills/supabase-postgres-best-practices)
- Growth and operations: [aso-skills](https://github.com/Eronred/aso-skills), [startup-os-skills](https://github.com/ncklrs/startup-os-skills/tree/main/skills), [marketing-skills](https://github.com/robertbstillwell/marketing-skills), [wondelai/skills](https://github.com/wondelai/skills)

## Local skills commonly used alongside it

Key local skills already installed:

- `react-native-skills`
- `react-native-best-practices`
- `react-native-architecture`
- `react-native-design`
- `supabase-postgres-best-practices`
- `app-analytics`
- `competitor-analysis`
- `keyword-research`
- `monetization-strategy`
- `retention-optimization`
- `growth-product-manager`
- `product-analyst`
- `pricing-strategy`
- `referral-program`
- `signup-flow-cro`

## Scope

This repository intentionally stays close to a document-first plugin model.

- the core lives in `commands/`, `skills/`, and `agents/`
- runtime code is limited to the loop scripts
- app starter code and static growth templates are not bundled as fixed assets inside the plugin
