#!/bin/zsh

if [[ -d "$HOME/.texcellent" ]]; then
    echo "TEXcellent already exists on your system. Attempting to update.."
    cd "$HOME/.texcellent" || exit 1
    git pull || exit 1
else
    git clone "https://github.com/itsisak/texcellent.git" "$HOME/.texcellent" || exit 1
    echo "export TEXCELLENT_DIR='$HOME/.texcellent'" >> "$HOME/.zshrc"
    echo "export PATH=\$PATH:\$HOME/bin" >> "$HOME/.zshrc"
fi

cat "$HOME/.texcellent/texcellent.sh" > "$HOME/bin/tx"

if [[ ! -x "$HOME/bin/tx" ]]; then chmod +x "$HOME/bin/tx"; fi

echo "Install successful!"
