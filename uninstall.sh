#!/bin/bash

# === CONFIG ===
INSTALL_PATH="/usr/local/bin"
SCRIPT_NAMES=("string" "collection" "netprobe" "gitguess")

# === UNINSTALL ===
echo "This will uninstall the following scripts from $INSTALL_PATH:"
for SCRIPT in "${SCRIPT_NAMES[@]}"; do
  echo " - $SCRIPT"
done

read -p "Are you sure you want to continue? (y/N): " confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
  echo "Uninstall cancelled."
  exit 0
fi

if [[ $EUID -ne 0 ]]; then
  echo "Error: Please run this script with sudo."
  exit 1
fi

for SCRIPT in "${SCRIPT_NAMES[@]}"; do
  TARGET_PATH="$INSTALL_PATH/$SCRIPT"
  if [[ -f "$TARGET_PATH" ]]; then
    echo "Removing $TARGET_PATH..."
    rm -f "$TARGET_PATH"
  else
    echo "Not found: $TARGET_PATH"
  fi
done

echo "✅ Uninstall complete."

