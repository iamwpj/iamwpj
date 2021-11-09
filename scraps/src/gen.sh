#!/usr/bin/env bash

: << 'NOTES'
Generate a new post from a markdown file.
This applies the HTML/CSS template.
NOTES

usage="
Please specify the name of a post by file without extension!
Ex.
    File: a-post.md
    Use:  $(basename $0) a-post
"
post=$1

if [ -z $1 ]; then
    echo -e "$usage"
else
    pandoc \
        -s $1.md \
        -o ../$1.html \
        --from=markdown+yaml_metadata_block \
        --standalone \
        --template template.html \
        --css src/template.css
fi