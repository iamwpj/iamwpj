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
    Use:  $(basename "$0") a-post
"
post=$1

if [ -z "$post" ]; then
    echo -e "$usage"
else
    pandoc \
        -s "$post".md \
        -o ../"$post".html \
        --from=markdown+yaml_metadata_block \
        --standalone \
        --template template.html \
        --css src/template.css
fi

# Modify the index.html
post_date=$(sed -n -e 's/^date: //p' "$post".md | sed 's/"//g')
post_title=$(sed -n -e 's/^title: //p' "$post".md | sed 's/"//g')
# https://stackoverflow.com/questions/17988756/how-to-select-lines-between-two-marker-patterns-which-may-occur-multiple-times-w
post_subtitle=$( awk '/subtitle: /{flag=1;next}/author: /{flag=0}flag' "$post".md | sed 's/    //g')
if [ "$(grep -cw "$post.html" ../index.html)" -lt 1 ]; then
    # https://unix.stackexchange.com/questions/52131/sed-on-osx-insert-at-a-certain-line/
    echo "$post_title - $post_date: $post_subtitle"
    listelement="\t\t<li><a href=$post.html>$post_title - $post_date: $post_subtitle</a></li>"
    sed -i.bak '/<ul class\=toc>/a\'$'\n'"$(echo -e "$listelement")"$'\n' ../index.html
fi