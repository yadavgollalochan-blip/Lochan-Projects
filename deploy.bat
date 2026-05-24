@echo off
title Lochan Portfolio — One-Click Deploy to GitHub + Vercel
color 0A

echo.
echo  ================================================
echo   LOCHAN PORTFOLIO — ONE-CLICK DEPLOY
echo   GitHub + Vercel auto-deploy
echo  ================================================
echo.

:: ── Move to the portfolio folder ──
cd /d "C:\Users\lochan.yadav\Documents\Claude-global\SEO\Portfolio"

:: ── Check git is installed ──
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Git is not installed or not in PATH.
    echo  Download from: https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

:: ── Initialize git if not already a repo ──
if not exist ".git" (
    echo  [SETUP] First time — initialising git repository...
    git init
    git remote add origin https://github.com/yadavgollalochan-blip/Lochan-Projects.git
    echo  [OK] Repository connected to GitHub.
    echo.
)

:: ── Stage all changes ──
echo  [1/3] Staging all changes...
git add .

:: ── Commit with timestamp ──
for /f "tokens=1-4 delims=/ " %%a in ('date /t') do set MYDATE=%%a-%%b-%%c
for /f "tokens=1-2 delims=: " %%a in ('time /t') do set MYTIME=%%a:%%b
set COMMIT_MSG=update: portfolio refresh %MYDATE% %MYTIME%

echo  [2/3] Committing: "%COMMIT_MSG%"
git commit -m "%COMMIT_MSG%"

if %errorlevel% neq 0 (
    echo.
    echo  [INFO] Nothing new to commit — everything is already up to date.
    echo.
    pause
    exit /b 0
)

:: ── Push to GitHub ──
echo  [3/3] Pushing to GitHub...
echo.
git push -u origin main

if %errorlevel% neq 0 (
    echo.
    echo  ------------------------------------------------
    echo  [!] Push failed. Try this fix:
    echo.
    echo  Run:  git push -u origin master
    echo  (if your branch is called 'master' not 'main')
    echo.
    echo  Or first-time auth failed — when Git asks:
    echo    Username: your GitHub username
    echo    Password: your Personal Access Token
    echo    (get one at https://github.com/settings/tokens)
    echo  ------------------------------------------------
    echo.
    pause
    exit /b 1
)

echo.
echo  ================================================
echo   SUCCESS! Files pushed to GitHub.
echo.
echo   Vercel is now auto-deploying your site.
echo   Live in ~30 seconds at: https://lochan.online
echo  ================================================
echo.

:: ── Open GitHub repo and Vercel dashboard in browser ──
start "" "https://github.com/yadavgollalochan-blip/Lochan-Projects"
timeout /t 2 /nobreak >nul
start "" "https://vercel.com/yadavgollalochan-blips-projects"

echo  Opened GitHub and Vercel in your browser.
echo.
pause
