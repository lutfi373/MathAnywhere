@echo off
echo ====================================
echo    MathAnywhere GitHub Deployment
echo ====================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed or not in PATH
    echo Please install Git from https://git-scm.com/
    pause
    exit /b 1
)

echo Git is installed ✓

REM Initialize git repository if not already done
if not exist ".git" (
    echo Initializing Git repository...
    git init
    echo Git repository initialized ✓
) else (
    echo Git repository already exists ✓
)

REM Add all files
echo.
echo Adding all files to Git...
git add .
echo Files added ✓

REM Commit files
echo.
set /p commit_message="Enter commit message (or press Enter for default): "
if "%commit_message%"=="" set commit_message=Deploy MathAnywhere to GitHub Pages

echo Committing files...
git commit -m "%commit_message%"
echo Files committed ✓

REM Ask for repository URL
echo.
echo ====================================
echo    Repository Setup
echo ====================================
echo.
echo Please create a repository on GitHub first, then enter the details below:
echo.
set /p username="lutfi373"
set /p repo_name="MathAnywhere"

REM Add remote origin
echo.
echo Adding remote origin...
git remote remove origin >nul 2>&1
git remote add origin https://github.com/lutfi3/MathAnywhere.git
echo Remote origin added ✓

REM Push to GitHub
echo.
echo Pushing to GitHub...
git branch -M main
git push -u origin main

if errorlevel 1 (
    echo.
    echo ERROR: Failed to push to GitHub
    echo Please check:
    echo 1. Repository exists on GitHub
    echo 2. Username and repository name are correct
    echo 3. You have write access to the repository
    echo.
    pause
    exit /b 1
)

echo.
echo ====================================
echo    Deployment Successful! 🎉
echo ====================================
echo.
echo Your MathAnywhere platform has been pushed to GitHub!
echo.
echo Next steps:
echo 1. Go to https://github.com/lutfi3/MathAnywhere
echo 2. Click on Settings
echo 3. Scroll to Pages section
echo 4. Select "Deploy from a branch"
echo 5. Choose "main" branch and "/ (root)" folder
echo 6. Save and wait for deployment
echo.
echo Your site will be available at:
echo https://lutfi3.github.io/MathAnywhere/
echo.
echo Press any key to exit...
pause >nul 