@echo off
title Samriddhi Ray Portfolio - Deployment Control
cd /d "%~dp0"

echo ========================================================
echo   SAMRIDDHI RAY PORTFOLIO // LIVE DEPLOYMENT
echo ========================================================
echo.
echo Choose how you would like to make the site live:
echo.
echo [1] Deploy to Vercel (Instant HTTPS URL, 100%% free)
echo [2] Deploy to Netlify (Instant HTTPS URL, 100%% free)
echo [3] Push to GitHub (Automated GitHub Pages deployment)
echo [4] Start Local Live Server (Localhost & Network IP)
echo [5] Exit
echo.
set /p choice="Enter choice [1-5]: "

if "%choice%"=="1" (
    echo.
    echo Building latest production assets...
    call "C:\Users\satadru\.gemini\antigravity\tools\node\node.exe" "node_modules\vite\bin\vite.js" build
    echo.
    echo Deploying to Vercel...
    call "C:\Users\satadru\.gemini\antigravity\tools\node\npx.cmd" vercel --prod
    pause
    goto :eof
)

if "%choice%"=="2" (
    echo.
    echo Building latest production assets...
    call "C:\Users\satadru\.gemini\antigravity\tools\node\node.exe" "node_modules\vite\bin\vite.js" build
    echo.
    echo Deploying to Netlify...
    call "C:\Users\satadru\.gemini\antigravity\tools\node\npx.cmd" netlify deploy --prod --dir=dist
    pause
    goto :eof
)

if "%choice%"=="3" (
    echo.
    set /p repo="Enter your GitHub repository remote URL (e.g. https://github.com/sam007xo/portfolio.git): "
    if not "%repo%"=="" (
        git remote remove origin 2>nul
        git remote add origin %repo%
        git branch -M main
        git push -u origin main
        echo.
        echo Pushed to GitHub! Check the Actions tab in your repository for the live GitHub Pages link.
    )
    pause
    goto :eof
)

if "%choice%"=="4" (
    echo.
    echo Starting live local server...
    python serve.py
    pause
    goto :eof
)

echo Exiting.
