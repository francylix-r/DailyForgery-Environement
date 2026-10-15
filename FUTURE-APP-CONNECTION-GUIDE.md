# DailForg — Provider API integration guide / not yet active connectors

This document is for future implementation planning. **The apps below are not connected by this release.** Registering a provider app or entering a credential alone does not activate its API in DailForg. Never put a client secret or long-lived unrestricted token in client-side JavaScript, cloud workspace documents or public configuration.

## Accounts and communication

- **Google Chat:** Google Cloud project, Chat API, OAuth scopes, app configuration and channel/chat read/write handlers. Some operations require a workspace admin.
- **Slack:** create Slack app; define OAuth scopes such as `channels:history` or `chat:write` (least privilege), install into workspace, and implement authorized endpoints. Store tokens server-side.
- **Microsoft Teams:** Entra app + Microsoft Graph delegated chat/channel permissions, tenant consent and a backend for restricted operations.
- **Discord:** install a Discord bot or OAuth app with limited guild/channel permissions. Do not use unofficial user tokens.
- **Telegram:** bot token via BotFather and Bot API, preferably via a server-side function; bot cannot automatically read all private chats.
- **WhatsApp:** official Meta WhatsApp Business Platform; phone-number registration, webhook, business authorization and pricing/eligibility rules.
- **Twilio:** paid messaging API and registered sender requirements.
- **Zoom:** Zoom developer app, OAuth and allowed meeting/recording API scopes.
- **Yahoo Mail:** provider-supported IMAP/SMTP with app-password/account policies, which cannot be implemented securely as browser-only password handling.
- **Proton Mail:** no general third-party mailbox OAuth API comparable to Gmail; Proton Bridge is a desktop service.

## Notes, docs and productivity

- **Notion:** create Notion integration, authorize individual pages/workspaces, use its API from a secure backend (direct browser calls often fail CORS).
- **Google Docs, Sheets, Slides:** enable APIs and request individual appropriate Google OAuth scopes; implement document-type-specific readers/editors, not generic JSON exports.
- **Microsoft Word, Excel, PowerPoint, OneNote:** use Microsoft Graph delegated permissions for user-owned resources; workbook and notes endpoints require specific handlers.
- **Google Calendar / Tasks, Outlook Calendar, Microsoft To Do:** request appropriate Calendar/Tasks delegated scopes, implement listed events and user-confirmed editing; use correct read/write scope boundaries.
- **Trello, Todoist, Asana, ClickUp, monday.com, Linear, Jira, Calendly:** register developer apps or API tokens as available; implement purpose-specific task, project or booking workflows. Some require subscriptions.
- **Coda, Airtable, Miro, Obsidian:** each uses different auth/storage conventions; local Obsidian markdown vault access is user-initiated file access rather than arbitrary filesystem access.

## Storage and infrastructure

- **Box, SharePoint, Nextcloud, ownCloud:** authorize files through each provider's API/WebDAV, browse folders and use actual file actions; report quotas only when the provider supplies them.
- **AWS S3, Cloudflare R2, Backblaze B2:** use narrowly scoped short-lived signed URLs from a secure backend, never permanent object-store credentials in browser JS.
- **GitHub private repos, GitLab, Bitbucket:** user authorization with minimal repository scopes, and tested list/read/write controls before presenting as connected. GitHub login alone does not grant repo access.
- **Netlify, Vercel, Cloudflare, Sentry, Postman:** APIs for deployment/error/project metadata vary; do not expose deployment tokens or infrastructure secrets.

## Learning, creative and business

- **Google Classroom, Moodle, Canvas LMS, Microsoft Teams for Education:** institution-based authorization, school privacy policies and course/assignment-specific API paths.
- **Zotero, ORCID, Semantic Scholar, YouTube:** distinct OAuth/public API and researcher-library workflows as authorized.
- **Figma, Canva, Spotify, Twitch, Unsplash, Pexels:** developer applications, licensing, account/data permissions, and purpose-built visual or media workflows.
- **Stripe, PayPal, Shopify, WooCommerce, QuickBooks, Xero:** server-side signed/authenticated requests, business-level verification, careful handling of financial records and actions; never expose credentials in frontend.
- **Zapier, Make, n8n, Pipedream, IFTTT:** backend-confirmed webhooks and user-controlled automation permission, with replay protection and auditing.

## AI providers

OpenAI, Anthropic, Gemini, OpenRouter, Groq, Mistral, DeepSeek, Cohere, Hugging Face, Ollama and LM Studio have different API contracts and costs. The existing configurable AI Studio is not automatic access to a user’s ChatGPT or Claude web-app chat history. Provider/model keys remain user-controlled; production use may require a secure token vault or same-origin backend. Do not present untested providers as verified.
