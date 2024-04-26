#!/bin/zsh

if [[ -d "$HOME/.texcellent" ]]; then
    echo "TEXcellent already exists on your system. Attempting to update.."
    cd "$HOME/.texcellent" || exit 1
    git pull || exit 1
else
    git clone "https://github.com/itsisak/texcellent.git" "$HOME/.texcellent" || {
    echo "Install failed"; exit 1 
    }
fi

cat "$HOME/.texcellent/tx" > "$HOME/bin/tx" || {
    echo "Install failed"; exit 1 
}

echo "Install successful!"
