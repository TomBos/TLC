create_pull_request() {
  echo "$1"
  echo "$2"
  exit 1
  curl -sL https://raw.githubusercontent.com/TomBos/TLC/master/src/word_lists/word_list.txt -o word_list.txt
  mapfile -t words < word_list.txt
  for i in $(seq 0 "$2"); do
    git checkout -b "$word"
    if [[ "$1" == 1 ]]; then
      git commit --allow-empty -m "Totally Legit Co-Author
      Co-authored-by: Arch Warden <tombos255+archwarden@gmail.com>"
    else
      git commit --allow-empty -m "Totally Legit Pull Request"
    fi
    git push --set-upstream origin "$word"
    gh pr create --base master --head "$word" --title "PR from $word to master" --body "Pull request from $word to master."
    gh pr merge "$word" --merge --delete-branch
  done
};
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
};
make_selection() {
  echo -e "Select which GitHub achievement you want to unlock:
1) Pair Extraordinaire     2) Pull Shark
3) YOLO                    4) Quickdraw \n"
  read -p "Selected: " SELECTION
  case $SELECTION in 
    1)
      echo "Selected: 1) Pair Extraordinaire"
      ;;
    2)
      echo "Selected: 2) Pull Shark"
      ;;
    3)
      echo "Selected: 3) YOLO"
      ;;
    4)
      echo "Selected: 4) Quickdraw"
      echo "❌This option is not implemented yet, please come back later"
      make_selection
      ;;  
    *)
      echo "❌Unknown Option !"
      make_selection
      ;;
  esac
};
choose_number_of_prs() {
  case $1 in 
    1)
      echo "Selected: 1) Pair Extraordinaire"
      echo "Code will create 50 PRs to achieve this badge"
      BRANCH_COUNT=50
      ;;
    2)
      echo "Selected: 2) Pull Shark"
      read -rp "Enter the number of PRs you want (1–150): " input
      if [[ "$input" =~ ^[0-9]+$ ]] && (( input >= 1 && input <= 150 )); then
        BRANCH_COUNT=$input
        echo "Code will create $BRANCH_COUNT PRs"
      else
        echo "❌ Invalid input. Please enter a number between 1 and 150."
        choose_number_of_prs 2
      fi
      ;;
    3)
      echo "Selected: 3) YOLO"
      echo "Code will create 1 PR to achieve this badge"
      BRANCH_COUNT=1
      ;;
    4)
      echo "Selected: 4) Quickdraw"
      echo "❌ This option is not implemented yet. Please come back later."
      make_selection
      ;;  
    *)
      echo "❌ Unknown option!"
      make_selection
      ;;
  esac 
}
echo "Checking Github CLI status"
gh auth status &>/dev/null
if [ $? -ne 0 ]; then
  echo "User is NOT authenticated with GitHub CLI."
  exit 1
fi
clear && display_banner && make_selection
clear && display_banner && choose_number_of_prs "$SELECTION"
create_pull_request "$SELECTION" "$BRANCH_COUNT"
rm word_list.txt
