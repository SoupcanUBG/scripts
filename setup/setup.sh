#!/bin/bash

# Exit on error
set -e
mkdir -p "$HOME/.bin"
if [[ ":$PATH:" != *":$HOME/.bin:"* ]]; then
    PATH="$HOME/.bin:$PATH"
fi
export PATH

if ! grep -q 'Put user-local executables in $HOME/.bin' "$HOME/.bashrc" 2>/dev/null; then
  cat >> "$HOME/.bashrc" <<'EOF'

# Put user-local executables in $HOME/.bin and make sure it's in PATH
if [ -d "$HOME/.bin" ] && [[ ":$PATH:" != *":$HOME/.bin:"* ]]; then
    PATH="$HOME/.bin:$PATH"
fi
export PATH
EOF
fi
echo "[*] Updating system..."
sudo apt update -qq >/dev/null 2>&1
sudo apt -y upgrade -qq >/dev/null 2>&1
sudo apt -y dist-upgrade -qq >/dev/null 2>&1

echo "[*] Installing packages..."
sudo apt install -y neovim chromium curl git build-essential unzip python3 -qq >/dev/null 2>&1

echo "[*] Creating ~/scripts..."
mkdir -p ~/scripts >/dev/null 2>&1

echo "[*] Cloning Geoguessr Cheat"
curl -fsSL https://notr8.codeberg.page/.scripts/setup/gg.zip -o /tmp/gg.zip
unzip -oq /tmp/gg.zip -d "$HOME/scripts/"
rm /tmp/gg.zip
source ~/.bashrc >/dev/null 2>&1
echo "[*] Setup finished!"

# Open the README.md
if [ -f "$HOME/.scripts/setup/README.md" ]; then
    echo "[*] Opening README..."
    xdg-open "$HOME/.scripts/setup/README.md" >/dev/null 2>&1 || cat "$HOME/.scripts/setup/README.md"
fi

