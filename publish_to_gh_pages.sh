#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <public-folder> <repo-name>"
  exit 1
fi

PUBLIC_FOLDER=$1
REPO_NAME=$2

echo "Deploying to GitHub Pages..."

# Ensure gh-pages branch exists
git branch -D gh-pages 2>/dev/null
git checkout --orphan gh-pages
git rm -rf .

# Copy the new public folder
cp -r $PUBLIC_FOLDER/* .

# Commit and push
git add .
git commit -m "Deploying website to GitHub Pages 🚀"
git push -f origin gh-pages

# Switch back to main branch
git checkout main
echo "Deployment complete! 🎉"
