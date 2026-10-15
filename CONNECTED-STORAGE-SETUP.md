# Connecting your storage in DailForg Env 2.1

The cloud provider is **storage**, not an export destination. Connected accounts expose file/folder browsing, available-space reports when the API permits, direct file uploads, downloads, readable-text inspection and imports into the Knowledge Vault.

## First-time setup — done separately by each user

Open DailForg -> Cloud Drives -> choose Google Drive, OneDrive or Dropbox -> **Need help connecting?**. This reveals the exact guided setup and a button to copy the browser's required return address. Use your own provider account to register an OAuth application. Enter **only its public client ID/app key** in DailForg, then click **Connect my account**. The setup is saved with your signed-in workspace data. You may have to reconnect to renew an expired access token.

### Google Drive

1. At `https://console.cloud.google.com/`, select your Google Cloud project.
2. Enable the **Google Drive API** under APIs & Services -> Library.
3. In Google Auth Platform, configure branding, audience, and data-access scopes. The app currently requests `drive.readonly` and `drive.file` for listing/importing and uploading files; sensitive scopes can trigger verification or test-user restrictions.
4. Create an OAuth client of type **Web application**. Add your current hosted DailForg domain as an **Authorized JavaScript origin** (for example, `https://labforgbench.netlify.app`, without any path). Do not put the Supabase `/auth/v1/callback` URL here; this is distinct from Google login to Supabase.
5. Copy the **public Client ID** ending in `.apps.googleusercontent.com`, not its secret. Paste it in DailForg Cloud Drives, save, click Connect, and grant permission.

### OneDrive

1. Go to Microsoft Entra -> App registrations -> New registration. Select the supported account types.
2. In Authentication, add a **Single-page application** redirect URI. Use DailForg's **Copy Return Address** button (the hosted site's URL with `?labforg_provider=onedrive`).
3. Under API permissions, enable the relevant delegated **Microsoft Graph** scopes (`User.Read`, `Files.ReadWrite`); admin consent may be needed for some organizations.
4. Copy the public **Application (client) ID** (never the client secret), paste it in Cloud Drives, save and authorize.

### Dropbox

1. Visit `https://www.dropbox.com/developers/apps` and create a **Scoped access** app.
2. Under permissions enable `files.metadata.read`, `files.content.read`, `files.content.write`, and `account_info.read` for the functions you intend to use.
3. Under OAuth2 add the return URL from DailForg's **Copy Return Address** button (the hosted site's URL with `?labforg_provider=dropbox`).
4. Copy only the public **App key**, paste it into Cloud Drives, save and authorize.

## Understanding the privacy boundary

Your OAuth access token stays in the running page's memory; DailForg does not upload this token to the database, nor ask for your third-party account password. Your public app identifier is saved per signed-in DailForg user. The app shows provider storage quota **only if the provider returns it**. Files aren't automatically read by AI. Import a file into Knowledge Vault, open it, and explicitly opt into AI use before asking a question about it.

## Troubleshooting

- **Connect button asks for setup:** You haven't saved that provider's public OAuth app ID yet; open the guided setup.
- **Permission denied or unauthorized client:** Double-check OAuth app origin, callback URL and scopes in the provider console. Google login to Supabase does not equal Drive authorization.
- **No quota available:** The connected provider did not return quota data; this is not proof of zero storage.
- **Expired connection:** Reconnect through the provider's official consent screen.
- **Access is still restricted:** Your OAuth app may need verified publishing status or organization administrator approval.

**No OAuth client secret and no Supabase service-role key should ever be typed in DailForg's browser interface.**
