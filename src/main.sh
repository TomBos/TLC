#!/usr/bin/env bash

echo "Establishing SSH connection to github.com ..."

ssh -qT git@github.com >/dev/null 2>&1; [ $? -ne 1 ] && echo "SSH connection to GitHub failed. Please check your SSH configuration."

echo "Checking Github CLI status"

gh auth status &>/dev/null || echo "User is NOT authenticated with GitHub CLI."



