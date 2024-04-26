# TEXcellent

An *excellent* CLI for managing LaTeX projects

## Installation

```zsh
curl -fsSL "https://raw.githubusercontent.com/itsisak/texcellent/main/install.sh" | zsh
```

And make sure that `$HOME/bin` is in $PATH. If not add this to `.zshrc`

```zsh
export PATH="$PATH:$HOME/bin"
```

The above is recommended but you can also manually clone this repo and add the follwing to your `.zshrc`

```zsh

export TEXCELLENT_DIR="$HOME/texcellent"
alias tx=". $TEXCELLENT_DIR/texcellent"

```

PS: Remember to update the path to `TEXCELLENT_DIR` 

## Usage

run `tx -h`
