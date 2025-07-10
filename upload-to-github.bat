@echo off
echo ====================================
echo    Upload to GitHub Repository
echo ====================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed
    echo Please download and install Git from https://git-scm.com/
    echo Or use the web upload method instead.
    pause
    exit /b 1
)

echo Git is installed ✓

REM Initialize git if not already done
if not exist ".git" (
    echo Initializing Git repository...
    git init
    echo Git repository initialized ✓
)

REM Add remote origin (replace if exists)
echo Adding remote repository...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/lutfi373/MathAnywhere.git
echo Remote repository added ✓

REM Add all files
echo.
echo Adding all files...
git add .
echo Files added ✓

REM Commit files
echo.
set /p commit_message="Enter commit message (or press Enter for default): "
if "%commit_message%"=="" set commit_message=Deploy updated MathAnywhere with new features

echo Committing files...
git commit -m "%commit_message%"
echo Files committed ✓

REM Push to GitHub (force push to overwrite)
echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main --force

if errorlevel 1 (
    echo.
    echo ERROR: Failed to push to GitHub
    echo This might be due to:
    echo 1. Authentication issues - you may need to login
    echo 2. Repository permissions
    echo 3. Network connectivity
    echo.
    echo Try using GitHub Desktop or web upload instead.
    pause
    exit /b 1
)

echo.
echo ====================================
echo    Upload Successful! 🎉
echo ====================================
echo.
echo Your files have been uploaded to GitHub!
echo.
echo Your site will be live at:
echo https://lutfi373.github.io/MathAnywhere/
echo.
echo Note: It may take 2-5 minutes for GitHub Pages to update.
echo.
pause 