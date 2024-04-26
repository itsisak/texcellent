# TEXcellent

An *excellent* CLI for managing LaTeX projects

## Installation

```zsh
curl -fsSL "https://raw.githubusercontent.com/itsisak/texcellent/main/install.sh" | zsh
```

The above is recommended but you can also manually clone this repo and add the follwing to your `.zshrc`

```zsh

export TEXCELLENT_DIR="$HOME/texcellent"
alias tx="$TEXCELLENT_DIR/texcellent.sh"

```
And run `chmod +x texcellent.sh` if it is not excecutable

PS: Remember to update the path to `TEXCELLENT_DIR` 

## Usage

run `tx -h`
