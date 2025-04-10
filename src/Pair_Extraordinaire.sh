#!/usr/bin/env bash

# Source wordlist (branch names)
mapfile -t words < word_list.txt

for word in "${words[@]}"; do
    # Create new branch
    git checkout -b "$word"

    # Add commit
    git commit --allow-empty -m "Totally Legit Co-Author
    Co-authored-by: Arch Warden <tombos255+archwarden@gmail.com>"

    # Push commit to current branch
    git push --set-upstream origin "$word"

    # Create PR from $distro to master
    gh pr create --base master --head "$word" --title "PR from $word to master" --body "Pull request from $word to master."

    # Merge the PR and delete $distro branch 
    gh pr merge "$word" --merge --delete-branch
done

