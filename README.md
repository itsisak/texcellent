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

Can also be found by running `tx -h`.

### Options

| Short | Long      | Description                                                                                                     |
|-------|-----------|-----------------------------------------------------------------------------------------------------------------|
| -h    | --help    | Shows this usage guide                                                                                          |
| -o    | --open    |  Opens file in `vim`. Works with command `new` and `output`.                                                    |
| -f    | --file    | Sets `file` flag. Works with command `new` to create a new file or `list` to only list file template            |
| -p    | --project | Sets `project` flag. Works with command `new` to create a new project or `list` to only list project templates. |

### Commands

| Short | Long   | ARGS                                        | Description                                                                                                                           |
|-------|--------|---------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| h     | help   | None                                        | Shows this usage guide                                                                                                                |
| c     | count  | <file_path/prohect_path>                    | Count words in file or project.                                                                                                       |
| l     | list   | None                                        | List templates. If `-f` is set it only lists file templates. If `-p` is set it only lists project templates.                          |
| o     | output | <output_file>                               | Remove LaTeX from file/project and output pure text to <output_file>. Default `out.txt`.                                              |
| n     | new    | <new_file_name/new_project_name> <template> | Create a new file/project from template. Default behaviour is creating a file with `basic` template. Set `-p` flag to create project. |
