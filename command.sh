#!/bin/bash

# 1. Create a new React application using the create-react-app tool.
npx create-react-app my-app

# Navigate to project directory
cd my-app

# 2. Initialize a Git repository, stage and commit the initial files, and create a public GitHub repository using the GitHub CLI.
git init
git add .
git commit -m "Initial commit"
gh repo create my-app --public --source=. --remote=origin --push

# 3. Switch your branch to 'update_logo'.
git checkout -b update_logo

# 4. Replace the existing logo with the image from 'https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg'.
curl -sL "https://cdn-ikponof.nitrocdn.com/vGqfYAGlOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -o src/logo.svg

# 5. Replace the existing link with 'https://www.propelleraero.com/dirtmate/'.
sed -i 's|https://reactjs.org|https://www.propelleraero.com/dirtmate/|g' src/App.js

# 6. Commit and push these changes.
git add src/App.js src/logo.svg
git commit -m "Update logo and link"
git push -u origin update_logo

# 7. Create a pull request from 'update_logo' to the 'master' branch using the GitHub CLI.
gh pr create --base master --head update_logo --title "Update logo and link" --body "Replaced logo with Propeller logo and updated link to dirtmate"

# 8. Merge the pull request using the GitHub CLI, skipping the approval step.
gh pr merge 1 --admin --merge

# REPO_URL https://github.com/zeeshansaeed6/my-app
