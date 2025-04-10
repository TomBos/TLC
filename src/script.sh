#!/usr/bin/env bash

create_pull_request() {
  # Source wordlist (branch names)
  mapfile -t words < word_list.txt

  for word in "${words[@]}"; do
    git checkout -b "$word"

    # TODO: Swap modes based on user input
    if [[ "$mode" == "pair" ]]; then
      git commit --allow-empty -m "Totally Legit Co-Author
      Co-authored-by: Arch Warden <tombos255+archwarden@gmail.com>"
    else
      git commit --allow-empty -m "Totally Legit Pull Request"
    fi
 
    # Push Branch to remote and create PR
    git push --set-upstream origin "$word"
    gh pr create --base master --head "$word" --title "PR from $word to master" --body "Pull request from $word to master."

    gh pr merge "$word" --merge --delete-branch
  done


}

display_banner() {
 cat << "EOF" 
__/\\\\\\\\\\\\\\\__/\\\____________________/\\\\\\\\\_        
__\///////\\\/////__\/\\\_________________/\\\////////__       
_________\/\\\_______\/\\\_______________/\\\/___________      
__________\/\\\_______\/\\\______________/\\\_____________     
___________\/\\\_______\/\\\_____________\/\\\_____________    
____________\/\\\_______\/\\\_____________\//\\\____________   
_____________\/\\\_______\/\\\______________\///\\\__________  
______________\/\\\_______\/\\\\\\\\\\\\\\\____\////\\\\\\\\\_ 
_______________\///________\///////////////________\/////////__

EOF

}


echo "Checking Github CLI status"

# Check GitHub CLI authentication status
gh auth status &>/dev/null
if [ $? -ne 0 ]; then
  echo "User is NOT authenticated with GitHub CLI."
  exit 1
fi

clear && display_banner


echo -e "Select which GitHub achievement you want to unlock:
1) Pair Extraordinaire     2) Pull Shark
3) YOLO                    4) Quickdraw \n"


read -p "Selected: " SELECTION
echo "You selected: $SELECTION"


