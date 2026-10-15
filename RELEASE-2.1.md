# DailForg Env 2.1 — Final workspace upgrade

**What changed:** A guided 24-tool library, 27 directly discoverable workspaces, per-user OAuth application identifiers (instead of `config.js`), an enhanced creative canvas, a scientific Atom Explorer, less developer-oriented UI, and direct result continuation in AI Studio.

**Deploy:** Run `PREPARE-NETLIFY.bat` (public Supabase URL/key only); upload the resulting `dist` folder to your existing Netlify project. Add or preserve your hosted OAuth callback in Supabase. No new SQL migration is necessary if the existing LabForg schema is already installed.

**Trust boundary:** External storage is API-backed but requires real provider setup and consent and has not been live-certified. Tool outputs use real local calculations or clear rule-based processing. The AI Studio needs the user's own provider/key; no autonomous background actions are claimed.

**Source:** `src/forge-suite.js` contains the new tools; `src/connectors.js` saves public IDs per signed-in user; `src/app.js` handles workspace routing, account-level sync, help, and AI handoff. `config.js` contains only the two public Supabase fields.
