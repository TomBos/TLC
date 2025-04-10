#!/usr/bin/env bash

# Source wordlist (branch names)
mapfile -t words < word_list.txt

for word in "${words[@]}"; do
    # Create new branch
    git checkout -b "$word"

    # Add commit
    # 1 Char commit - 1 byte
    git commit --allow-empty -m "A"

    # Push commit to current branch
    git push --set-upstream origin "$word"

    # Create PR pointing to master
    gh pr create --base master --head "A" --title "B" --body "C"

    # Merge the PR and delete current branch 
    gh pr merge "A" --merge --delete-branch
done

