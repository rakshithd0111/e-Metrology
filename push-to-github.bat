@echo off
setlocal
title Push e-Metrology to GitHub
set "GIT_EXE=C:\Users\Rakshith D\mingit\cmd\git.exe"

echo ========================================================
echo   Pushing e-Metrology to GitHub: rakshithd0111/e-Metrology
echo ========================================================
echo.

cd /d "%~dp0"

echo [1/4] Checking Git repository...
if not exist .git (
    "%GIT_EXE%" init
    "%GIT_EXE%" branch -M main
    "%GIT_EXE%" config user.name "rakshithd0111"
    "%GIT_EXE%" config user.email "rakshithd0111@users.noreply.github.com"
)

echo [2/4] Staging files...
"%GIT_EXE%" add .

echo [3/4] Committing changes...
"%GIT_EXE%" commit -m "e-Metrology Digital Legal Metrology System" 2>nul

echo [4/4] Setting remote to https://github.com/rakshithd0111/e-Metrology.git ...
"%GIT_EXE%" remote remove origin 2>nul
"%GIT_EXE%" remote add origin https://github.com/rakshithd0111/e-Metrology.git

echo.
echo ========================================================
echo Pushing your files to GitHub...
echo If a GitHub Sign-in window or browser opens, click 'Sign in with your browser'.
echo ========================================================
echo.

"%GIT_EXE%" push -u origin main

echo.
if %errorlevel% equ 0 (
    echo ========================================================
    echo SUCCESS! Your code is now live on GitHub!
    echo Check it here: https://github.com/rakshithd0111/e-Metrology
    echo ========================================================
) else (
    echo ========================================================
    echo If push asks for a password, GitHub requires a Personal Access Token (PAT)
    echo or browser sign-in.
    echo ========================================================
)

pause
