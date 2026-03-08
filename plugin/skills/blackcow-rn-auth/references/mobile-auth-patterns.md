# Mobile Auth Patterns

## Must-cover flows

- fresh sign in
- cold start session restore
- expired session redirect
- social login callback
- password reset or magic link return
- sign out and account switch

## Bad patterns

- multiple auth stores
- callback route not validated
- session state only in component local state
- no restore purchase or auth-linked entitlement sync
