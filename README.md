# TEXcellent

CLI for managing LaTeX projects

## Installation

```zsh
curl -fsSL "https://raw.githubusercontent.com/itsisak/texcellent/main/install.sh" | zsh
```

## Setup

clone this repo and add the following to `.zshrc`. Remember to update path to `TEXCELLENT_DIR` based on where you put it and its name.

```zsh

export TEXCELLENT_DIR="$HOME/.texcellent"
[ -s "$TEXCELLENT_DIR/texcellent" ] && \. "$TEXCELLENT_DIR/texcellent"

```

## Usage

The program is available as either `tx` or `texcellent`

run `tx -h`
