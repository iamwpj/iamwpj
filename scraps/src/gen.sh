#!/usr/bin/env bash

: << 'NOTES'
Generate a new post from a markdown file.
This applies the HTML/CSS template. This
will also add a link to the index.
NOTES

usage="
Please specify the name of a post by file without extension!
Ex.
    File: a-post.md
    Use:  $(basename $0) a-post
"
post=$1
title="${@:2}"

if [ -z $post ]; then
    echo -e "$usage"
else
    pandoc \
        -s $post.md \
        -o ../$post.html \
        --from=markdown+yaml_metadata_block \
        --standalone \
        --template template.html \
        --css src/template.css
fi

# Modify the index.html

if [ $(grep -cw "$1.html" ../index.html) -lt 1 ]; then
    # https://unix.stackexchange.com/questions/52131/sed-on-osx-insert-at-a-certain-line/
    sed -i.bak -e '/<ul class\=toc>/a\'$'\n'"$(printf '\t\t')<li><a href=$post.html>$title</a></li>" ../index.html
fi