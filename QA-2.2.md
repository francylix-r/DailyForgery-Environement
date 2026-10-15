# DailForg Env 2.2 — Verification

- Regression/unit tests: see `npm test` for counts (including existing 2.1 tests).
- Static build: `npm run build:deploy` builds a self-contained HTML application and copies the **DF** favicon to `dist/assets/favicon.svg`.
- Chromium mock browser: authenticated onboarding, habit toggles, daily check-in, Connected Search UI, Gmail/Outlook configuration UI, mobile 390px and desktop 1440px; zero JS errors and no horizontal overflow in tested screens.
- Actual third-party OAuth exchanges, mail sending, and external search APIs: **NOT VERIFIED LIVE**. Must be validated after provider registration and permission approval.
- Existing Supabase database preserved, no new migration. Profiles and workspace data remain under LabForg-owned Supabase tables and account-scoped local records.
