# 🔥 Firebase Hosting Deployment Guide

## Prerequisites

### 1. Install Node.js (Required for Firebase CLI)
1. Go to [nodejs.org](https://nodejs.org/)
2. Download and install the LTS version
3. Restart your computer after installation

### 2. Verify Installation
Open Command Prompt or PowerShell and run:
```bash
node --version
npm --version
```

## 🚀 Firebase Deployment Steps

### Step 1: Install Firebase CLI
```bash
npm install -g firebase-tools
```

### Step 2: Login to Firebase
```bash
firebase login
```
- This will open your browser
- Sign in with your Google account
- Allow Firebase CLI access

### Step 3: Initialize Firebase in Your Project
Navigate to your project folder and run:
```bash
firebase init hosting
```

**Configuration Options:**
- **Use an existing project**: Select your existing project (`fyp-lutfi-naim`)
- **Public directory**: Enter `.` (current directory)
- **Single-page app**: Choose `N` (No)
- **Set up automatic builds**: Choose `N` (No)
- **Overwrite index.html**: Choose `N` (No)

### Step 4: Deploy Your App
```bash
firebase deploy
```

## 🎯 Alternative Method: Firebase Console Upload

If you can't install Node.js, use the web interface:

### Step 1: Prepare Your Files
1. Create a ZIP file containing all your project files
2. Make sure `index.html` is in the root of the ZIP

### Step 2: Use Firebase Console
1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project (`fyp-lutfi-naim`)
3. Click **Hosting** in the left sidebar
4. Click **Get started** or **Add another site**
5. Follow the setup wizard

## 📁 Your Firebase Configuration

I've already created the `firebase.json` file for you with optimal settings:

```json
{
  "hosting": {
    "public": ".",
    "ignore": [
      "firebase.json",
      "**/.*",
      "**/node_modules/**",
      "**/*.md",
      "deploy.bat"
    ],
    "rewrites": [
      {
        "source": "/signin",
        "destination": "/index.html"
      },
      {
        "source": "/dashboard",
        "destination": "/home.html"
      }
    ],
    "headers": [
      {
        "source": "**/*.@(css|js)",
        "headers": [
          {
            "key": "Cache-Control",
            "value": "public, max-age=31536000"
          }
        ]
      }
    ],
    "cleanUrls": true,
    "trailingSlash": false
  }
}
```

## 🌐 After Deployment

Your site will be available at:
- **Primary URL**: `https://fyp-lutfi-naim.web.app/`
- **Secondary URL**: `https://fyp-lutfi-naim.firebaseapp.com/`

## 🔧 Fix Firebase Auth Domain Error

After deployment, add your Firebase domain to authorized domains:

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Select your project
3. Go to **Authentication** → **Settings**
4. Scroll to **Authorized domains**
5. Add these domains:
   ```
   fyp-lutfi-naim.web.app
   fyp-lutfi-naim.firebaseapp.com
   localhost
   ```

## 🔄 Update Your Site

To update your deployed site:
```bash
firebase deploy
```

## 📱 Custom Domain (Optional)

To use your own domain:
1. In Firebase Console, go to **Hosting**
2. Click **Add custom domain**
3. Follow the DNS setup instructions

## 🎯 Automated Deployment Script

Create `firebase-deploy.bat` for easy deployment:

```batch
@echo off
echo ====================================
echo    Firebase Hosting Deployment
echo ====================================
echo.

REM Check if Firebase CLI is installed
firebase --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Firebase CLI is not installed
    echo Please run: npm install -g firebase-tools
    pause
    exit /b 1
)

echo Firebase CLI is installed ✓

REM Login check
firebase projects:list >nul 2>&1
if errorlevel 1 (
    echo Please login to Firebase first...
    firebase login
)

REM Deploy
echo.
echo Deploying to Firebase Hosting...
firebase deploy

if errorlevel 1 (
    echo.
    echo ERROR: Deployment failed
    pause
    exit /b 1
)

echo.
echo ====================================
echo    Deployment Successful! 🎉
echo ====================================
echo.
echo Your site is live at:
echo https://fyp-lutfi-naim.web.app/
echo https://fyp-lutfi-naim.firebaseapp.com/
echo.
pause
```

## ⚡ Quick Start Commands

```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Initialize hosting (run once)
firebase init hosting

# Deploy your app
firebase deploy

# View your live site
firebase open hosting:site
```

## 🔍 Troubleshooting

### "Firebase command not found"
- Install Node.js first
- Run: `npm install -g firebase-tools`
- Restart your terminal

### "Permission denied"
- Run terminal as Administrator
- Or use: `npm install -g firebase-tools --force`

### "Project not found"
- Make sure you're logged in: `firebase login`
- Check your project: `firebase projects:list`

### "Build failed"
- Make sure all files are in the correct location
- Check `firebase.json` configuration

## 🎉 Benefits of Firebase Hosting

- ✅ **Free SSL certificate**
- ✅ **Global CDN**
- ✅ **Perfect Firebase integration**
- ✅ **Automatic domain authorization**
- ✅ **Easy custom domains**
- ✅ **Rollback capabilities**
- ✅ **Preview channels**

Your MathAnywhere app will be blazing fast on Firebase Hosting! 🚀 