# DailForg Env 2.1 — Verification and known limits

## Executed checks

- 48/48 Node automated tests passed, including original LabForg data/statistics/security-contract checks and the new utility suite tests.
- Chromium Playwright walkthrough passed at 1440 × 900 and 390 × 844; no JS page errors and no horizontal overflow.
- Verified guest login gate, simulated authenticated onboarding, 24-tool directory and form interactions, local study output, weighted-grade calculation, isotope-aware Atom Explorer render, drawing shape/extrusion controls, and Cloud Drives account-help interface.
- Standalone HTML build and public-config Netlify builder passed. Verified `LABFORG_SUPABASE_URL` and `LABFORG_SUPABASE_ANON_KEY` are embedded into the generated deployable HTML when supplied. Separate cloud OAuth IDs are not required in `config.js`.

## Not verified live

- Real Supabase Auth OAuth redirects, two-account RLS cross-access, storage-policy behavior and public project deployment against the user's Supabase instance.
- Real Google Drive, OneDrive or Dropbox API tokens, permission grants, quota, uploads, and downloads.
- Camera, microphone, Gemini or OpenAI-compatible inference on the user's actual hardware/provider.

## Design boundaries

- Includes 27 workspace entries and 24 functional tools. This is not 24 autonomous AI services or 100 features per tool.
- Atom diagrams use an educational, approximate Bohr-style shell presentation. Isotope abundance and advanced orbital physics are not independently verified; unusual ion states need scientific review.
- 2.5D canvas extrusion creates a perspective effect, not a 3D mesh.
- Cloud OAuth public identifiers are individual user settings, with tokens in memory. No scheduled sync or backend refresh token service has been implemented.
- Exporting an original file or drawing is a real file operation; generic HTML/JSON downloads are not used as substitutes for connected storage.
