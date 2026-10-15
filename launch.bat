@echo off
cd /d "%~dp0"
echo LabForg Bench is starting at http://localhost:4173
where node >nul 2>&1
if %errorlevel%==0 (
  start "" "http://localhost:4173"
  node server.mjs
  goto :eof
)
start "" "http://localhost:4173"
py -m http.server 4173
if errorlevel 1 python -m http.server 4173
