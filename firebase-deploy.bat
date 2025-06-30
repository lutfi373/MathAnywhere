@echo off
echo ====================================
echo    Firebase Hosting Deployment
echo ====================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Node.js is not installed
    echo Please download and install Node.js from https://nodejs.org/
    echo After installation, restart your computer and try again.
    pause
    exit /b 1
)

echo Node.js is installed ✓

REM Check if Firebase CLI is installed
firebase --version >nul 2>&1
if errorlevel 1 (
    echo Firebase CLI is not installed. Installing now...
    npm install -g firebase-tools
    if errorlevel 1 (
        echo ERROR: Failed to install Firebase CLI
        echo Please run as Administrator or install manually:
        echo npm install -g firebase-tools
        pause
        exit /b 1
    )
    echo Firebase CLI installed ✓
) else (
    echo Firebase CLI is installed ✓
)

REM Check if user is logged in
firebase projects:list >nul 2>&1
if errorlevel 1 (
    echo Please login to Firebase first...
    firebase login
    if errorlevel 1 (
        echo ERROR: Firebase login failed
        pause
        exit /b 1
    )
)

echo Firebase login verified ✓

REM Check if Firebase is initialized
if not exist "firebase.json" (
    echo Firebase not initialized. Initializing now...
    echo.
    echo Please select the following options:
    echo 1. Use an existing project: fyp-lutfi-naim
    echo 2. Public directory: . (dot)
    echo 3. Single-page app: N
    echo 4. Automatic builds: N
    echo 5. Overwrite index.html: N
    echo.
    pause
    firebase init hosting
    if errorlevel 1 (
        echo ERROR: Firebase initialization failed
        pause
        exit /b 1
    )
    echo Firebase initialized ✓
) else (
    echo Firebase already initialized ✓
)

REM Deploy to Firebase
echo.
echo Deploying to Firebase Hosting...
firebase deploy

if errorlevel 1 (
    echo.
    echo ERROR: Deployment failed
    echo Please check the error messages above
    pause
    exit /b 1
)

echo.
echo ====================================
echo    Deployment Successful! 🎉
echo ====================================
echo.
echo Your MathAnywhere app is now live at:
echo https://fyp-lutfi-naim.web.app/
echo https://fyp-lutfi-naim.firebaseapp.com/
echo.
echo Don't forget to:
echo 1. Add your domain to Firebase Auth authorized domains
echo 2. Test the sign-in functionality
echo 3. Share your app with students!
echo.
echo Press any key to open your live site...
pause >nul

REM Open the deployed site
start https://fyp-lutfi-naim.web.app/ 