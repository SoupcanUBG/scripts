#!/bin/bash

# Exit on error
set -e

URL="https://notr8.codeberg.page/.scripts/ma/ma"
TARGET="$HOME/.bin/"

echo "[*] Downloading ma from $URL..."
curl -fsSL "$URL" -o /tmp/ma

echo "[*] Installing ma to $TARGET..."
sudo mv /tmp/ma "$TARGET"
sudo chmod +x "$TARGET"

echo "[*] Installation complete. You can now run 'ma' from anywhere."

