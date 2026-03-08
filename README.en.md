[한국어](README.md) | **English**

# Blackcow RN Forge

Blackcow RN Forge is a Claude Code plugin for planning, structuring, releasing, and operating Bare React Native apps.

It is inspired by the document-driven operating pattern used in `fireauto`, but rebuilt for mobile app development and release operations rather than web SaaS.

Quick links:
[Getting Started](#getting-started) · [Use Cases](#which-command-should-i-use) · [Beginner Path](#if-you-are-new-start-here) · [All Commands](#all-commands) · [FAQ](#faq)

---

## What is this?

This plugin is not just a code generator.

It acts more like an operating layer inside Claude Code for the full React Native app lifecycle:

- app planning and architecture
- auth, billing, offline, and media flow design
- accessibility, security, privacy, and QA audits
- ASO, ratings, retention, and store operations
- rollout, release, incident response, and support operations

In short, it helps turn "what should we build?" and "how do we ship and run it?" into project-aware docs and execution plans.

---

## Getting Started

### Step 1: Install the plugin

#### Install from GitHub

```bash
/plugin marketplace add honeyhead/blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

To install at project scope:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

#### Local development install

If you cloned the repo and want to test it locally:

```bash
/plugin marketplace add ./blackcow-rn-forge
/plugin install blackcow-rn-forge@blackcow-rn-forge
```

To install at project scope:

```bash
/plugin install blackcow-rn-forge@blackcow-rn-forge --scope project
```

### Step 2: Decide whether this is a new app or an existing project

#### If you are starting a new app

1. Create a Bare React Native app with the RN CLI
2. `/rn-planner`
3. `/rn-bootstrap`
4. `/rn-architect`

`/rn-bootstrap` is the right starting point after RN CLI initialization because it organizes the environment, dependencies, folder structure, and native setup.

#### If you already have an RN project

1. `/rn-architect`
2. `/rn-ui-upgrade`
3. `/rn-security-guard`
4. `/rn-release-manager`

If the app already exists, you can skip `/rn-bootstrap`.

### Step 3: If you are new, start with these 5 commands

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-release-manager
5. /rn-loop
```

These five commands are enough to get through:
- planning the app
- setting up the Bare RN baseline
- designing the core architecture
- checking release readiness
- pushing long-running work through completion

---

## If you are new, start here

### `/rn-planner`

Turns an app idea into a mobile PRD.

Use it when:
- the idea is still fuzzy
- you have not decided feature priorities yet

You get:
- core screens
- P0 / P1 / P2 features
- stack direction
- launch and growth draft

### `/rn-bootstrap`

Sets up the Bare React Native project baseline.

Use it when:
- you just created a new project
- you do not know what to organize after RN CLI init

You get:
- dependency direction
- folder structure
- native setup checklist
- recommended next commands

### `/rn-architect`

Designs the app structure.

Use it when:
- you want to lock down navigation, state, data, offline, and release structure first

You get:
- mobile architecture docs
- data flow decisions
- risk points

### `/rn-release-manager`

Checks whether the app is actually ready to ship.

Use it when:
- the app feels close, but release readiness is unclear
- QA, signing, and store checklist docs are missing

You get:
- `docs/release/release-plan.md`
- `docs/release/store-checklist.md`
- `docs/release/qa-matrix.md`

### `/rn-loop`

Repeats work until a completion condition is met.

Use it when:
- you are not sure what to prompt first
- the task is too large for a single pass

Example:

```bash
/rn-loop organize everything needed from login flow to release readiness --completion-promise 'release readiness complete'
```

---

## Which command should I use?

### If you are starting a new app

```text
1. /rn-planner
2. /rn-bootstrap
3. /rn-architect
4. /rn-designer
```

### If the app already exists and needs structure

```text
1. /rn-architect
2. /rn-ui-upgrade
3. /rn-security-guard
4. /rn-privacy-manager
```

### If you are close to release

```text
1. /rn-test-lab
2. /rn-device-lab
3. /rn-observability
4. /rn-release-manager
```

### If you are in post-launch operations

```text
1. /rn-growth-manager
2. /rn-engagement-manager
3. /rn-rating-manager
4. /rn-support-ops
5. /rn-incident-manager
```

### If the work is large or long-running

```text
1. /rn-team
2. /rn-team-status
3. /rn-loop
```

---

## Do I need a starter kit?

Not necessarily.

This plugin is designed to work by reading the current project and creating the docs and structure that fit it, instead of copying a fixed starter bundle into the plugin itself.

In practice:
- if you already have a project, you can use it immediately
- if you are starting fresh, create a Bare RN app with the RN CLI and begin with `/rn-bootstrap`

So at the current stage, a separate starter kit is optional rather than required.

---

## Recommended workflows

### Minimal workflow

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
```

### Better baseline workflow

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-auth-manager
/rn-platform-manager
/rn-offline-manager
/rn-test-lab
/rn-release-manager
```

### Add operations after launch

```text
/rn-growth-manager
/rn-store-manager
/rn-rating-manager
/rn-support-ops
/rn-incident-manager
```

---

## All commands

### Build / Product

| Command | Role | Description |
|--------|------|------|
| `/rn-planner` | Mobile planner | Turn an app idea into a mobile PRD |
| `/rn-bootstrap` | Bootstrapper | Set up a Bare React Native project baseline |
| `/rn-architect` | Architect | Design navigation, state, offline, and release structure |
| `/rn-designer` | Mobile designer | Build the design system, screen patterns, and components |

### Quality / Compliance

| Command | Role | Description |
|--------|------|------|
| `/rn-ui-upgrade` | UX auditor | Audit and improve mobile UX, accessibility, and performance |
| `/rn-accessibility-guard` | Accessibility lead | Audit screen reader, focus, dynamic type, and reduced motion |
| `/rn-security-guard` | Security lead | Audit mobile app security risks |
| `/rn-privacy-manager` | Privacy lead | Define ATT, consent, data deletion, and store disclosure |

### Core Flows / Platform

| Command | Role | Description |
|--------|------|------|
| `/rn-auth-manager` | Auth lead | Design auth, session restore, OAuth callback, and deep link flows |
| `/rn-billing-manager` | Billing lead | Design subscriptions, IAP, entitlements, and paywall provider flows |
| `/rn-platform-manager` | Platform lead | Design push, deep links, permissions, and lifecycle integration |
| `/rn-offline-manager` | Sync lead | Define offline-first, cache, sync queue, and conflict policy |
| `/rn-media-manager` | Media lead | Design camera, gallery, upload, cache, and background transfer |

### Growth / Store / Operations

| Command | Role | Description |
|--------|------|------|
| `/rn-growth-manager` | Growth lead | Plan ASO, analytics, retention, and monetization |
| `/rn-localization-manager` | Localization lead | Plan app i18n, store localization, and translation ops |
| `/rn-store-manager` | Store lead | Write metadata, screenshot messaging, and review notes |
| `/rn-engagement-manager` | Engagement lead | Design push, referral, win-back, and paywall re-entry operations |
| `/rn-rating-manager` | Ratings lead | Define review prompts, rating recovery, and store reputation operations |
| `/rn-support-ops` | Support lead | Organize support inbox, refunds, review response, and FAQ operations |
| `/rn-incident-manager` | Incident lead | Define severity, rollback, communications, and postmortems |

### Release / Testing

| Command | Role | Description |
|--------|------|------|
| `/rn-test-lab` | Test lead | Build test strategy, E2E coverage, and manual regression flows |
| `/rn-device-lab` | Device lead | Define OS/device matrix, device farm coverage, and accessibility regression |
| `/rn-observability` | Observability lead | Plan analytics, crash, and performance operations |
| `/rn-rollout-manager` | Rollout lead | Define release channels, staged rollout, hotfix, and rollback strategy |
| `/rn-release-manager` | Release manager | Prepare release readiness, QA, and store submission |

### Team / Automation

| Command | Role | Description |
|--------|------|------|
| `/rn-team` | Team lead | Run multi-agent parallel execution |
| `/rn-team-status` | Team assistant | Check team execution status |
| `/rn-loop` | Loop runner | Repeat work until completion conditions are met |
| `/rn-cancel-loop` | Loop control | Stop an active loop |

---

## Where do outputs go?

Most generated or updated docs will end up in paths like:

- `docs/mobile-prd/`
- `docs/auth/`
- `docs/platform/`
- `docs/data/`
- `docs/media/`
- `docs/testing/`
- `docs/observability/`
- `docs/release/`
- `docs/growth/`
- `docs/localization/`
- `docs/privacy/`
- `docs/ops/`
- `MOBILE_SECURITY_AUDIT.md`

So the plugin helps build both app code direction and the operational docs needed to ship and run the app.

---

## Design principles

- uses `React Navigation` instead of `Expo Router`
- prefers lightweight state patterns such as `Zustand` or `Jotai`
- uses `Reanimated` and `Gesture Handler` as the default motion stack
- treats `Supabase` as a strong candidate for auth and data, alongside mobile security and offline recovery
- treats flaky network conditions as a default constraint rather than an edge case
- treats accessibility as an operational quality bar, including screen reader, dynamic type, and reduced motion
- treats privacy/compliance as part of SDK, analytics, and account deletion design
- includes real device matrix and OS coverage in testing strategy

---

## FAQ

### Can I use this if I do not have a project yet?

Yes. Since this plugin is designed for Bare React Native, the most natural path is:

1. create the app with the RN CLI
2. run `/rn-bootstrap`

### Do I need `/rn-bootstrap` for an existing app?

No. If the app already exists, start with `/rn-architect`, `/rn-ui-upgrade`, and `/rn-release-manager`.

### Do all commands edit code directly?

No.

- some commands mainly generate docs
- some focus on audits and checklists
- some can directly update code and structure

The role depends on the command.

### There are too many commands. Where should I start?

Start here:

```text
/rn-planner
/rn-bootstrap
/rn-architect
/rn-release-manager
/rn-loop
```

Those five are the safest starting point.

### I want to hand off a large task in one go

Use `/rn-loop`.

Example:

```bash
/rn-loop organize the docs and structure needed for login, billing, and release readiness --completion-promise 'release readiness complete'
```

---

## Notes

- React Native implementation and performance: [vercel-react-native-skills](https://skills.sh/vercel-labs/agent-skills/vercel-react-native-skills), [react-native-best-practices](https://skills.sh/callstackincubator/agent-skills/react-native-best-practices)
- Architecture and design: [react-native-architecture](https://skills.sh/wshobson/agents/react-native-architecture), [react-native-design](https://skills.sh/wshobson/agents/react-native-design)
- Data layer: [supabase-postgres-best-practices](https://skills.sh/supabase/agent-skills/supabase-postgres-best-practices)
- Growth and operations: [aso-skills](https://github.com/Eronred/aso-skills), [startup-os-skills](https://github.com/ncklrs/startup-os-skills/tree/main/skills), [marketing-skills](https://github.com/robertbstillwell/marketing-skills), [wondelai/skills](https://github.com/wondelai/skills)

This repository intentionally stays close to a document-first plugin model.

- the core lives in `commands/`, `skills/`, and `agents/`
- runtime code is limited to the loop scripts
- app starter code and fixed template assets are not bundled inside the plugin
