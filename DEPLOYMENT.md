# GitHub Pages Deployment Guide

This guide will help you deploy the MathAnywhere project to GitHub Pages.

## 📋 Prerequisites

1. GitHub account
2. Git installed on your computer
3. Your project files ready for deployment

## 🚀 Step-by-Step Deployment

### Step 1: Create GitHub Repository

1. Log in to your GitHub account
2. Click the "+" icon in the top right corner
3. Select "New repository"
4. Name your repository (e.g., `mathanywhere` or `math-learning-platform`)
5. Make sure it's set to **Public** (required for free GitHub Pages)
6. Don't initialize with README (we already have one)
7. Click "Create repository"

### Step 2: Prepare Your Local Repository

Open your terminal/command prompt in your project directory and run:

```bash
# Initialize git repository (if not already done)
git init

# Add all files to staging
git add .

# Commit your files
git commit -m "Initial commit: MathAnywhere learning platform"

# Add your GitHub repository as remote origin
git remote add origin https://github.com/lutfi373/MathAnywhere.git

# Push to GitHub
git push -u origin main
```

**Note**: Replace `lutfi373` and `MathAnywhere` with your actual GitHub username and repository name.

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click on the **Settings** tab
3. Scroll down to the **Pages** section in the left sidebar
4. Under **Source**, select "Deploy from a branch"
5. Choose **main** branch
6. Select **/ (root)** folder
7. Click **Save**

### Step 4: Wait for Deployment

- GitHub will take 1-10 minutes to build and deploy your site
- You'll see a green checkmark when it's ready
- Your site will be available at: `https://lutfi373.github.io/MathAnywhere/`

## 🔧 Important Files for Deployment

Your project includes these essential files for GitHub Pages:

- ✅ `index.html` - Main entry point (sign-in page)
- ✅ `home.html` - Dashboard page
- ✅ `.nojekyll` - Prevents Jekyll processing
- ✅ `README.md` - Project documentation
- ✅ All CSS, JS, and image files

## 🌐 File Structure for GitHub Pages

```
Your-Repository/
├── index.html                 # 🚀 GitHub Pages entry point
├── home.html                 # Main dashboard
├── .nojekyll                 # Prevents Jekyll processing
├── README.md                 # Project documentation
├── css/                      # Stylesheets
│   ├── bootstrap.min.css
│   ├── bootstrap-icons.css
│   └── styles.css
├── js/                       # JavaScript files
│   ├── bootstrap.bundle.min.js
│   ├── jquery.min.js
│   └── custom.js
├── images/                   # Image assets
└── [all other HTML files]    # Learning modules and pages
```

## 🔄 Updating Your Deployed Site

To update your live site after making changes:

```bash
# Add your changes
git add .

# Commit with a descriptive message
git commit -m "Update: describe your changes here"

# Push to GitHub
git push origin main
```

GitHub Pages will automatically rebuild and deploy your changes within a few minutes.

## ⚡ Quick Deployment Checklist

- [ ] All files are in the root directory
- [ ] `index.html` exists as the main entry point
- [ ] `.nojekyll` file is present
- [ ] All relative links use correct paths
- [ ] Firebase configuration is set up
- [ ] Repository is public
- [ ] GitHub Pages is enabled in repository settings

## 🔍 Troubleshooting

### Site Not Loading
- Check that GitHub Pages is enabled in repository settings
- Ensure your repository is public
- Wait 5-10 minutes for initial deployment

### 404 Errors
- Verify `index.html` is in the root directory
- Check that all file paths are relative and correct
- Ensure file names match exactly (case-sensitive)

### CSS/JS Not Loading
- Verify all asset paths are relative (not absolute)
- Check that all CSS and JS files are in the repository
- Ensure file names and paths match exactly

### Firebase Not Working
- Check Firebase configuration in your HTML files
- Ensure Firebase project is properly set up
- Verify domain is added to Firebase authorized domains

## 📱 Testing Your Deployed Site

1. Visit your GitHub Pages URL
2. Test the sign-in functionality
3. Navigate through different modules
4. Check responsive design on mobile
5. Verify all links and features work

## 🎉 Your Site is Live!

Once deployed, your MathAnywhere platform will be accessible at:
`https://lutfi373.github.io/MathAnywhere/`

Share this URL with students and educators to start using your interactive mathematics learning platform!

## 📞 Support

If you encounter issues:
1. Check the GitHub Pages documentation
2. Review the troubleshooting section above
3. Check repository settings and file structure
4. Ensure all prerequisites are met 

<head>
    <base href="/MathAnywhere/">
    <!-- rest of your head content -->
</head> 