# DailForg Env 2.2 — Connected Knowledge, Mail and Progress

## What actually works locally

- New **Progress Tracker**: unlimited named daily habits, daily completion toggles, a seven-day chart, calendar-based streaks, optional mood check-ins and measured focus sessions. Stored in the signed-in user's DailForg workspace document and subject to the existing cloud-autosave behavior.
- New **Connected Search**: 12 read-only live source API adapters with real external requests, normalized results, source URL links, pinned references and an explicit AI Studio handoff. Includes Wikipedia, Open Library, Google Books, OpenAlex, Crossref, Europe PMC, GitHub public repos, GitLab public projects, npm, Hugging Face public model metadata, Stack Overflow and REST Countries. **Public APIs may impose rate limits, change their CORS rules, or be temporarily unavailable.** These are public searches, not connected personal accounts.
- New **Mail Hub** for optional Gmail and Outlook: user-provided public OAuth client ID, real provider consent, up to 15 inbox previews, and confirmation-gated text-email sending. Only available after the provider grants `gmail.readonly` / `gmail.send` or Microsoft Graph `Mail.Read` / `Mail.Send`. Google restricted-scope verification, Microsoft administrator approval, CORS/browser capability, and live account testing may be required. No provider secret, password, or refresh token is included in the web app. Access tokens stay in memory and are cleared on reload or sign out.
- Existing **Cloud Drives** (Drive, OneDrive, Dropbox), **AI Studio**, **Knowledge Vault**, **24 Tool Library utilities**, **Scientific Lab**, creative canvas and 3D tools are retained.
- Tab favicon replaced with a high-contrast **DF** mark.

## What has NOT been implemented as a working account connector

Notion, Teams, Google Chat, Slack, Discord, Telegram, Trello, Airtable, SharePoint, GitLab private repositories, Stripe, Jira and dozens of other services are **not falsely displayed as connected**. Most require OAuth client registration, a securely deployed backend, app verification, and provider-specific read/write handlers. Their requirements are documented in `FUTURE-APP-CONNECTION-GUIDE.md`, but a guide does not make an API function. Do not claim that DailForg can read these accounts.

## Deployment without breaking Expetenogy

1. Keep the existing Supabase project, migrations and authentication providers. No new SQL migration is needed for the workspace-document-based tracker, references or user public app IDs.
2. Extract this ZIP and run `PREPARE-NETLIFY.bat`. Enter **only** your project's public Supabase URL and publishable/anon key. Do not paste secrets or private OAuth keys.
3. Upload newly produced `dist` to the existing Netlify site's Deploys. Preserve the exact domain and the `?labforg_auth=1` Supabase allowed redirect. Keep Expetenogy's Site URL unchanged.
4. Verify sign-in in a private window, create/check a habit, use Connected Search, upload a document and check its persistence after refresh.
5. To use Gmail, enter a public Web OAuth client ID in the Mail Hub. Its Google JavaScript origin must match the actual deployed domain. Enable the Gmail API and request Gmail read/send scopes. Public access may require Google verification.
6. To use Outlook, create a Microsoft Entra SPA OAuth registration and enter its public Application client ID in Mail Hub. The registered redirect must exactly match `https://YOUR-DOMAIN/?dailforg_mail=outlook` (or the corresponding path), and the app requires delegated `User.Read`, `Mail.Read`, `Mail.Send`. Some tenants require administrator consent.
7. No account password or mail client secret belongs in `config.js`, which remains restricted to the public Supabase project URL and public key.

## Test status

`npm test` passed 55 test cases, and an authenticated mock-browser walkthrough passed at desktop and phone widths without JavaScript exceptions or horizontal overflow. Live Gmail, Outlook, cloud-provider permissions and external source availability were **not** verified against real production accounts or the public Netlify domain. A local mocked pass is not proof of end-to-end API operation.
