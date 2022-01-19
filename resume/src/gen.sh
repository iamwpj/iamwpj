#! /usr/bin/env bash
: << 'NOTES'
Generate subsidiary files
from the resume source,
`resume.html`
NOTES

# .txt
pandoc -t plain -f html -o resume.txt <(sed '/<nav>/,/<\/nav>/d' ../resume.html)

# .md
pandoc -t markdown_strict -f html -o resume.md <(sed '/<nav>/,/<\/nav>/d' ../resume.html)

# .pdf, lots of corrections
# Strip <nav> block
pandoc -f html -t html5 -o resume.pdf \
    --css=../resume.css \
    -V title:"" \
    -V margin-top=10 \
    -V margin-left=5 \
    -V margin-right=5 \
    -V margin-bottom=20 \
    -V papersize=letter \
    <(sed '/<nav>/,/<\/nav>/d' ../resume.html)