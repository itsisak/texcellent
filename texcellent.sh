#!/bin/zsh

err () { print "\e[31mERROR:\e[0m $1"}
warn () { print "\e[33mWARNING:\e[0m $1"}
info () { print "TEXcellent: $1" }

# check_command ???

count () {
    file_path="."
    tot_count=0
    if [[ -n $1 ]]; then file_path="$1"; fi
    if [[ -v flag_all ]]; then echo ALL; fi

    if [[ -d $file_path ]]; then
        printf "%-30s   %5s\n" "FILENAME" "WC"
        for file in $file_path/**/*.tex(.); do
            file_count=$(detex "$file" | wc -w | tr -d ' ')
            ((tot_count += $file_count))
            printf "%-30s | %5d\n" ${file:0:30} $file_count
        done
        printf "%-30s | %5d\n" "TOTAL" $tot_count
        exit 0
    elif [[ -f $file_path ]]; then
        echo "Wordcount: " $(detex "$file_path" | wc -w | tr -d ' ')
        exit 0
    fi
    err "Not a valid directory or file"
    exit 1
}

list() {
    if [[ ! -v flag_project ]]; then 
        echo "Single files:" 
        for template in $TEXCELLENT_DIR/templates/files/*; do
            echo " - " ${$(basename $template)%.*}
        done
    fi
    if [[ ! -v flag_file ]]; then 
        echo "Projects:"
        for template in $TEXCELLENT_DIR/templates/projects/*; do
            echo " - " $(basename $template)
        done
    fi
    # What happens if none return true
}

# Better error handling
# - if cp does not work
# - do not open if ^
new () {
    template="basic"
    if [[ -n $2 ]]; then template="$2"; fi
    if [[ -v flag_project ]]; then 
        cp -a "$TEXCELLENT_DIR/templates/projects/$template" "./$1"
        cp "$TEXCELLENT_DIR/utils/tex-vimrc" "./$1/.vimrc"
        if [[ -v flag_open ]]; then open "./$1"; fi
    else
        cp -a "$TEXCELLENT_DIR/templates/files/$template.tex" "./$1.tex"
        if [[ -v flag_open ]]; then open "./$1.tex"; fi
    fi
}

# TODO: Not tested or finished
output () {
    echo "output"
    output_file="out.txt"
    if [[ -n $2 ]]; then output_file="$2"; fi

    if [[ -d $output_file ]]; then
        err "under construction"
        if [[ -v flag_open ]]; then open $1; fi
        exit 0
    elif [[ -f $output_file ]]; then
        detex $1 >> $output_file
        if [[ -v flag_open ]]; then open $1; fi
        exit 0
    fi
    err "Not a valid directory or file"
    exit 1
}

open () { [[ -d $1 || -f $1 ]] && vim $1 || err "Could not open: $1" }

ARGS=()
while [[ $# -gt 0 ]]; do
    case $1 in
        -h | --help ) \. $TEXCELLENT_DIR/utils/usage; exit 0;;
        -o | --open ) flag_open=1; shift;;
        #-a | --all ) flag_all=1; shift;;
        -f | --file ) flag_file=1; shift;;
        -p | --project ) flag_project=1; shift;;
        -* | --* ) err "Unknown option: $1" >&2; exit 1;;
        * ) ARGS+=("$1"); shift;;
    esac
done

set -- "${ARGS[@]}"
 
case "${1}" in 
    h | help ) \. $TEXCELLENT_DIR/utils/usage; exit 0;;
    c | count ) count $2;;
    l | list ) list;;
    n | new ) new $2 $3;;
    o | out | output ) output $2;;
    * ) err "Unknown command: $cmd" >&2; exit 1;;
esac

