@echo off
setlocal
cd /d "%~dp0"
echo.
echo  DAILFORG ENV 2.2 - NETLIFY BUILD PREPARATION
echo  Only enter your PUBLIC Supabase URL and PUBLISHABLE / ANON key.
echo  NEVER enter a service_role key or OAuth Client Secret.
echo.
set /p LABFORG_SUPABASE_URL=Supabase project URL (https://xxxxx.supabase.co): 
set /p LABFORG_SUPABASE_ANON_KEY=Supabase PUBLIC publishable/anon key: 
echo.
echo Cloud app connections are set up separately inside each user account.
call npm run build:deploy
if errorlevel 1 (
 echo.
 echo Build failed. Review the URL and public key.
 pause
 exit /b 1
)
echo.
echo SUCCESS. Open https://app.netlify.com/drop and drag the DIST folder there.
echo After deployment, add https://YOUR-NETLIFY-DOMAIN/?labforg_auth=1 to Supabase Authentication Redirect URLs.
echo Do not replace Expetenogy's existing Site URL.
pause
