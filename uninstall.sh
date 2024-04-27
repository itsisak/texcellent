#!/bin/zsh

[[ -d "$HOME/.texcellent" ]] && rm -rf "$HOME/.texcellent" || { echo "TEXcellent is not installed"; exit 1 }
[[ -f "$HOME/bin/tx" ]] && rm "$HOME/bin/tx"

echo "TEXcellent successfully removed"
