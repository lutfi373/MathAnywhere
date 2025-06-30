# 🔧 Fix Google Sign-in on GitHub Pages

## Problem
When users try to sign in with Google on your GitHub Pages site (`lutfi373.github.io`), they get an error because Firebase doesn't recognize this domain as authorized.

## Solution

### Step 1: Add GitHub Pages Domain to Firebase

1. **Open Firebase Console**: Go to [https://console.firebase.google.com/](https://console.firebase.google.com/)

2. **Select Your Project**: Click on `fyp-lutfi-naim` (or your project name)

3. **Go to Authentication**:
   - Click "Authentication" in the left sidebar
   - Click the "Settings" tab (next to "Users")

4. **Find Authorized Domains**:
   - Scroll down to the "Authorized domains" section
   - You should see `localhost` already there

5. **Add Your GitHub Domain**:
   - Click "Add domain"
   - Type: `lutfi373.github.io`
   - Click "Add"

6. **Save Changes**: The changes should save automatically

### Step 2: Enable Google Sign-in Provider (if not already done)

1. In Firebase Console → Authentication
2. Click "Sign-in method" tab
3. Find "Google" in the list
4. Click on it and make sure it's "Enabled"
5. Save if needed

### Step 3: Wait for Changes to Propagate

- Firebase changes can take 5-10 minutes to propagate
- Clear your browser cache after waiting
- Try signing in again

### Step 4: Test the Fix

1. Go to your GitHub Pages site: `https://lutfi373.github.io/MathAnywhere/`
2. Try signing in with Google
3. If you still get errors, check the browser console (F12) for specific error messages

## Common Error Messages

- **"auth/unauthorized-domain"** → Domain not added to Firebase (follow Step 1)
- **"Popup blocked"** → Allow popups in your browser
- **"Network error"** → Check internet connection
- **"Sign-in cancelled"** → User closed the popup, try again

## Alternative: Use Firebase Hosting Instead

If GitHub Pages continues to have issues, consider using Firebase Hosting:

1. Install Firebase CLI: `npm install -g firebase-tools`
2. Login: `firebase login`
3. Initialize: `firebase init hosting`
4. Deploy: `firebase deploy`

Firebase Hosting automatically includes your domain in authorized domains.

## Need Help?

If you're still having issues:
1. Check the browser console (F12) for error messages
2. Verify the domain was added correctly in Firebase Console
3. Try incognito/private browsing mode
4. Contact me with the specific error message you're seeing 