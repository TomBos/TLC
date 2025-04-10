#!/usr/bin/env bash

# Source distro file (branch names i guess)
mapfile -t distros < distro_word_list.txt

for distro in "${distros[@]}"; do
    echo "Processing $distro"
    
    # Create new branch
    git checkout -b "$distro"

    # Add commit
    git commit --allow-empty -m "Totally Legit Co-Author

    Co-authored-by: Arch Warden <tombos255+archwarden@gmail.com>"

    # Push commit to current branch
    git push --set-upstream origin "$distro"

    # Create PR from $distro to master
    gh pr create --base master --head "$distro" --title "PR from $distro to master" --body "Pull request from $distro to master."

    # Merge the PR and delete $distro branch 
    gh pr merge "$distro" --merge --delete-branch
done

