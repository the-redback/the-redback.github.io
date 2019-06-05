#!/bin/bash
echo $@
set -exo pipefail
# chmod +x update_academic.sh
# ./update_academic.sh
# git submodule update --remote --merge

# ref: https://gohugo.io/hosting-and-deployment/hosting-on-github/#put-it-into-a-script

# Build the project.
# if using a theme, replace with `hugo -t <YOURTHEME>`
hugo --source=src
cp -R src/public/. .

echo -e "\n\033[1;35mDeploying updates to GitHub...\033[0m\n"

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -gt 0 ];then
  msg="$@"
fi
git commit -m "$msg" || true

# Push source and build repos.
git push origin HEAD
