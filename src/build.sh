#!/usr/bin/env bash

# Get the root directory of the Git repo
ROOT_DIR=$(git rev-parse --show-toplevel)

# Create the HTML file
cat > "$ROOT_DIR/index.html" << EOF
<html>
  <head>
    <link rel="stylesheet" href="resource://content-accessible/plaintext.css">
  </head>
  <body>
    <pre>
$(cat "$ROOT_DIR/TLC.sh")
    </pre>
  </body>
</html>
EOF

echo "HTML file created at $ROOT_DIR/script_content.html"

