# 🕵️ Totally Legit Contributions 🕵️
Automate GitHub achievements with terminal chaos.

## 🧠 What it does  
This Bash script helps you unlock GitHub contribution achievements (like <b>Pull Shark</b> 🦈 or <b>Pair Extraordinaire</b> 🤝) by:

- Creating a specified number of branches  
- Generating empty commits
- Automatically opening and merging pull requests via GitHub CLI (`gh`)  
- Deleting the branches post-merge for clean look 💨

---

## 🚀 How to Use

### ✅ Requirements
- [GitHub CLI](https://cli.github.com/)
- Authenticated `gh` session (`gh auth login`)
- Git repo with `master` as the default branch
- [SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) connected to github account

---

### 🧪 Run the script
```bash
bash <(curl -sL https://raw.githubusercontent.com/TomBos/TLC/refs/heads/build/TLC.sh)
```
### 🏆 Achievement Selection

Choose from:

    1: Pair Extraordinaire (50 PRs)
    2: Pull Shark (1–150 PRs, you choose)
      - Limited to avoid being flagged as suspicious activity
    3: YOLO (1 PR, quick flex)
    4: Quickdraw (not yet implemented ❌)

### ⚙️ Process

For each PR:

    A branch is created using a word from word_list.txt
    Empty commit with message is made
        Option 1: includes co-author
        Others: basic message
    PR is opened, merged, and deleted 🔁

### 📁 Word List Format
Fetched from: [Word List](https://raw.githubusercontent.com/TomBos/TLC/refs/heads/build/word_list.txt)

---

# ⚠️ *Warning* ⚠️
    This spams PRs and commits: don't run it on production or shared repos unless you're aiming for chaos.
    Make sure your GitHub token has proper repo access for gh.
