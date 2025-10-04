#!/bin/bash
# install.sh - installs UBG system without Node.js

UBG_DIR="$HOME/.ubg"
BIN_FILE="$HOME/.bin/ubg"
mkdir -p "$UBG_DIR"

# Download ubg script
curl -fsSL https://notr8.codeberg.page/.scripts/UBG/ubg -o "$BIN_FILE"
chmod +x "$BIN_FILE"

# Download HTML and server files
curl -fsSL https://notr8.codeberg.page/.scripts/UBG/main.html -o "$UBG_DIR/index.html"
curl -fsSL https://notr8.codeberg.page/.scripts/UBG/real.html -o "$UBG_DIR/real.html"

echo "UBG installed in $UBG_DIR"
echo "Use 'ubg <name> <url>' to add buttons"
echo "Use 'ubg --serve [port]' to start a Python HTTP server serving $UBG_DIR"

