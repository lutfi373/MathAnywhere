@echo off
echo ========================================
echo   UPLOAD UPDATED FILES TO GITHUB
echo ========================================
echo.
echo This script will help you upload your updated files to GitHub.
echo.
echo IMPORTANT: You need to upload these files to your repository:
echo   https://github.com/lutfi373/MathAnywhere
echo.
echo FILES TO UPLOAD:
echo   - index.html (Updated with better error handling)
echo   - All other HTML files (if you made changes)
echo.
echo STEPS TO FOLLOW:
echo.
echo 1. Go to: https://github.com/lutfi373/MathAnywhere
echo 2. Click "Upload files" button
echo 3. Drag and drop your updated files
echo 4. Write commit message: "Fix Google sign-in error handling"
echo 5. Click "Commit changes"
echo.
echo AFTER UPLOADING:
echo 1. Go to Firebase Console: https://console.firebase.google.com/
echo 2. Select your project: fyp-lutfi-naim
echo 3. Go to Authentication → Settings
echo 4. Add domain: lutfi373.github.io
echo.
echo Press any key to open GitHub repository...
pause
start https://github.com/lutfi373/MathAnywhere
echo.
echo Press any key to open Firebase Console...
pause
start https://console.firebase.google.com/
echo.
echo Done! Follow the steps above to fix the Google sign-in issue.
pause 