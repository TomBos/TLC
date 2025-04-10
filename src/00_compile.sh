#!/usr/bin/env bash

echo "#!/usr/bin/env bash" >> "TLC.sh"

# Add content of Pull Shark File and add indentation
echo "pull_shark () {
$(cat Pull_Shark.sh | sed 's/^/  /')
}" >> "TLC.sh"



echo "Ok!"



