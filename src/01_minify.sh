#!/usr/bin/env bash

# Dont include this files
EXCLUDED=("01_minify.sh" "00_compile.sh")

# Ensure dir exists
mkdir -p ./minified

# Loop trought all .sh file except the excluded ones
for f in ./*.sh; do
  if [[ " ${EXCLUDED[*]} " =~ " $(basename "$f") " ]]; then
    echo "Excluding $f"
    continue
  fi
  
  awk '!/^\s*#/ && !/^\s*$/' "$f" > "./minified/$(basename "$f")"

done



