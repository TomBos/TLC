#!/usr/bin/env bash

# Source distro file (branch names i guess)
mapfile -t distros < distro_word_list.txt

for distro in "${distros[@]}"; do
    echo "Processing $distro"
    ./coauthor.sh "$distro" 
done

