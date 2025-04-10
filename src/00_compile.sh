#!/usr/bin/env bash
GIT_ROOT=$(git rev-parse --show-toplevel)
OUTPUT_FILE="$GIT_ROOT/TLC.sh"

echo "#!/usr/bin/env bash" >> "$OUTPUT_FILE"

# Add content of Pull Shark File and add indentation
echo "pull_shark () {
$(cat Pull_Shark.sh | sed 's/^/  /')
}" >> "$OUTPUT_FILE"

# Add content of Pair Extraordinaire and indentation
echo "pair_extraordinaire () {
$(cat Pair_Extraordinaire.sh | sed 's/^/  /')
}" >> "$OUTPUT_FILE"

cat "main.sh" >> "$OUTPUT_FILE"

echo "Ok!"



