#!/usr/bin/env bash


if [ -z "$1" ]; then
  echo "Branch name not set!"
  echo "Exiting..."
  exit 1
fi


# Create new branch
git checkout -b "$1"


# Push branch to remote
git push --set-upstream origin "$1"


# Add commit
git commit --allow-empty -m "Totally Legit Co-Author

Co-authored-by: Arch Warden <tombos255+archwarden@gmail.com>"


# Push commit to current branch
git push


# Create PR from $1 to master
gh pr create --base master --head "$1" --title "PR from $1 to master" --body "Pull request from $1 to master."

# Merge the PR and delete $1 branch 
gh pr merge "$1" --merge --delete-branch
