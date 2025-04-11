create_pull_request() {
  mapfile -t words < word_list.txt
  for word in "${words[@]}"; do
    git checkout -b "$word"
    if [[ "$mode" == "pair" ]]; then
      git commit --allow-empty -m "Totally Legit Co-Author
      Co-authored-by: Arch Warden <tombos255+archwarden@gmail.com>"
    else
      git commit --allow-empty -m "Totally Legit Pull Request"
    fi
    git push --set-upstream origin "$word"
    gh pr create --base master --head "$word" --title "PR from $word to master" --body "Pull request from $word to master."
    gh pr merge "$word" --merge --delete-branch
  done
}
echo "Establishing SSH connection to github.com ..."
ssh -qT git@github.com >/dev/null 2>&1; [ $? -ne 1 ] && echo "SSH connection to GitHub failed. Please check your SSH configuration."
echo "Checking Github CLI status"
gh auth status &>/dev/null || echo "User is NOT authenticated with GitHub CLI."
