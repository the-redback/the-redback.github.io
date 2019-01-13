#!/bin/bash
set -x
chmod +x update_academic.sh
./update_academic.sh
git submodule update --remote --merge

# ref: https://gohugo.io/hosting-and-deployment/hosting-on-github/#put-it-into-a-script

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

echo -e "\n\033[1;35mDeploying updates to GitHub...\033[0m\n"

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..