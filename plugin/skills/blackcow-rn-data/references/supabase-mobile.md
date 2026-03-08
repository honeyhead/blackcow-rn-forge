# Supabase for Mobile Apps

## Recommended use

- Auth for email, magic link, OAuth
- Postgres for core relational data
- Storage for user media with signed URL where needed
- Edge Functions for privileged logic

## Guardrails

- never expose service role key in the app bundle
- use RLS for user data
- signed URL for sensitive files
- keep auth refresh and session restoration explicit

## Mobile concerns

- app cold start session restore
- background resume token refresh
- flaky network retry
- upload cancellation and resume expectations
