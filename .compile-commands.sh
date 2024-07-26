#!/usr/bin/env sh
set -e

cmd(){
    echo "$@"
    "$@"
}

comp(){
    input_file="$1"
    shift
    output_file="$1"
    shift

    cmd g++ -c -Wall "$input_file" -o  "$output_file" $@
}


