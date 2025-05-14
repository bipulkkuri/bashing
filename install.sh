#!/bin/bash

# === CONFIG ===
INSTALL_PATH="/usr/local/bin"
GITHUB_USER="bipulkkuri"
REPO_NAME="bashing"
BRANCH="main"
SCRIPT_NAMES=("string" "collection")

# === INSTALL ===
echo "Installing scripts to $INSTALL_PATH..."

if [[ $EUID -ne 0 ]]; then
  echo "Error: Please run this script with sudo."
  exit 1
fi

for SCRIPT in "${SCRIPT_NAMES[@]}"; do
  TARGET_PATH="$INSTALL_PATH/$SCRIPT"
  RAW_URL="https://raw.githubusercontent.com/$GITHUB_USER/$REPO_NAME/$BRANCH/$SCRIPT.sh"

  echo "Installing $SCRIPT..."
  curl -fsSL "$RAW_URL" -o "$TARGET_PATH" || {
    echo "Failed to download $SCRIPT from $RAW_URL"
    exit -1
  }

  chmod +x "$TARGET_PATH"
  echo "Installed $SCRIPT to $TARGET_PATH"
done

echo "✅ Installation complete."

echo "⭐️ Thank you for installing! Want to contribute?"
echo "Fork or star the repo: https://github.com/bipulkkuri/bashing"
echo