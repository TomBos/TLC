#!/usr/bin/env bash

# Get the directory where the script is located
SCRIPT_DIR=$(dirname "$(realpath "$0")")
EXCLUDED=("01_minify.sh" "00_compile.sh")

mkdir -p "$SCRIPT_DIR/minified"

for f in "$SCRIPT_DIR"/*.sh; do
    # Skip excluded files
    if [[ " ${EXCLUDED[@]} " =~ " $(basename "$f") " ]]; then
        continue
    fi

    # Process the file: remove comments and empty lines
    awk '!/^\s*#/ && !/^\s*$/' "$f" > "$SCRIPT_DIR/minified/$(basename "$f")"
done

# Copy 00_compile.sh to the minified folder
if [[ -f "$SCRIPT_DIR/00_compile.sh" ]]; then
    cp -pr "$SCRIPT_DIR/00_compile.sh" "$SCRIPT_DIR/minified/00_compile.sh"
else
    echo "Error: 00_compile.sh not found"
fi

