## New in 2.2

- **Connected Search** — 12 real public knowledge/book/research/developer APIs, pinned sources, explicit AI handoff.
- **Progress Tracker** — daily habits, completed-day streaks, real focus sessions, private check-ins and 7-day activity chart.
- **Mail Hub** — optional Gmail and Outlook OAuth client IDs entered per user, inbox previews and confirmation-gated sending; requires provider approval and real live account tests.
- **New high-contrast DF favicon**.
- See `RELEASE-2.2.md` and `FUTURE-APP-CONNECTION-GUIDE.md` for exact supported actions and integration limitations.

# DailForg Env 2.2 — Connected Knowledge & Progress Release

DailForg Env is a connected personal environment for studying, organizing, creating, working with files, and using optional user-configured AI. The specialist laboratory workflow is preserved under Scientific Laboratory.

## New in 2.1

- **27 navigable workspaces**, including direct routes into Homework Helper, Practice Quiz, Flashcards, Writing Studio, Atom Explorer, Creative Canvas, Budget Studio, Focus Timer and others.
- **24 working, browser-executed utilities** (each has a distinct computation or workflow and a help panel). They are **not** advertised as 100 functions each. The original data and experiment features remain.
- **Creative Canvas Pro**: pen, eraser, shape tools, adjustable brush width and color, text annotations, background color, undo, PNG output and stylized 2.5D extrusion. This is not a fully volumetric or AI mesh converter.
- **Atom Explorer** for the first 36 elements: element search, common default isotope mass numbers, manual isotope mass, particle counts, charge and shell diagrams. The displayed atom is a simplified teaching model, not an orbital simulator.
- **Cloud IDs belong to individual users.** DailForg's `config.js` is now for the PUBLIC Supabase URL/key only. OAuth public app IDs are entered within each user's Cloud Drives page, stored in the signed-in workspace record and reused when their data synchronizes. Tokens are kept in memory, not permanently persisted.
- **Cleaner cloud guide**: users expand the connection guide when needed, copy the required redirect address, authorize with the actual provider, then browse folders, check reported quota, upload, download and import files. No false service connections.
- **AI handoff**: computed tool results can be saved to My Desk or copied into AI Studio for a user-approved follow-up. The AI service needs the user's own configured provider and credentials.
- **Real file management**: original file download remains available for genuine files or drawings; no HTML/JSON download is positioned as a substitute for connected cloud storage.

## Deploy on existing Netlify site

1. Extract the ZIP. Double-click `PREPARE-NETLIFY.bat` in the project root.
2. Paste **only** the existing public Supabase project URL (HTTPS `*.supabase.co`) and publishable or legacy anon key when prompted. NEVER paste a service role key, Supabase secret key, Google client secret, or a Microsoft client secret.
3. After successful build, upload the **`dist`** folder to Netlify -> your existing DailForg / LabForg site -> Deploys.
4. Keep your existing domain, for example `https://labforgbench.netlify.app`.
5. Verify `https://labforgbench.netlify.app/?labforg_auth=1` is allowed under Supabase Authentication -> URL Configuration -> Redirect URLs. **Do not replace Expetenogy's existing Site URL.**
6. Open the site in a private window. Sign in, check onboarding, open Tool Library, test one computation, and open Cloud Drives.

The application has no external npm dependencies. You can also build using PowerShell:

```powershell
$env:LABFORG_SUPABASE_URL="https://YOUR-PROJECT.supabase.co"
$env:LABFORG_SUPABASE_ANON_KEY="YOUR_PUBLIC_KEY"
npm run build:deploy
```

## User cloud connection (Google Drive, OneDrive, Dropbox)

A user's first connection requires registering a public OAuth application with the service and granting it the specific file permissions. Open Cloud Drives -> choose a provider -> expand **Need help connecting?**. Enter the *public* OAuth app identifier and approve access. An app owner must register the user's real website origin/redirect URL; having Google login configured in Supabase does NOT automatically grant Google Drive scopes. Sensitive Google Drive scopes may require verification for public use. If the provider has not approved the application, the connection may not succeed for judges. Provider permissions and API quotas vary. See `CONNECTED-STORAGE-SETUP.md`.

## Important limitations

- Google Drive, Dropbox and OneDrive API code exists and is browser-tested against simulated services, **not live-certified** for each user's credentials or permissions. The token is not persisted for future background use; users may need to reconnect after refresh.
- Numerical tools execute deterministically, but quizzes, study plans and homework scaffolds use user-supplied text and rule-based transformations. They do not claim to solve arbitrary academic problems correctly or replace teachers.
- An AI assistant requires a user-configured API/model. No free inference is guaranteed; cost and data handling depend on the provider.
- The camera/microphone functions require browser permission and real device testing.
- Normalized tables and evidence storage depend on the already-installed LabForg Supabase migration; this release creates no new database tables.
- The database project is shared with Expetenogy, so Supabase Auth settings, quotas and top-level policies remain shared. Existing `labforg_*` tables are used for DailForg data; Expetenogy-owned tables are not modified.

## Test results

`npm test` currently passes **48 tests**. A Playwright/Chromium smoke test checks guest blocking, authenticated onboarding, tool navigation, study plans, weighted grades, atom canvas, sketch control, cloud guide, desktop/mobile overflow and browser exceptions. See `QA-2.1.md`. Live provider credentials and real backend account isolation were not available to this build environment; do not treat mocked service tests as production certification.

## Development

```bash
npm run dev          # http://localhost:4173
npm test
npm run build
npm run build:deploy # requires public Supabase environment variables for hosted login
```

`config.js` holds only public Supabase credentials. Keep real OAuth client secrets, service-role keys and user private AI keys out of the frontend bundle.

### AI assistance disclosure

The project was developed with AI-assisted coding and testing. Disclose that in competition materials under any applicable AI development rules.
