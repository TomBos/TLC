#!/usr/bin/env bash

# Dont include this files
EXCLUDED=("01_minify.sh" "00_compile.sh")

for f in ./*.sh; do
  if [[ " ${EXCLUDED[*]} " =~ " $(basename "$f") " ]]; then
    echo "Excluding $f"
    continue
  fi
  
  awk '!/^\s*#/ && !/^\s*$/' "$f" > "./minified/minified_$(basename "$f")"

done



