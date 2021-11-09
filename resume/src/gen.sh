#! /usr/bin/env bash
: '
Generate subsidiary files
from the resume source,
`resume.html`
'

# .txt
pandoc -t plain -s resume.html -o resume.txt

# .md
pandoc -t markdown_strict -s resume.html -o resume.md

# .pdf, lots of corrections
pandoc -t html5 resume.html -o resume.pdf \
    --css=resume.css \
    -V title:"" \
    -V margin-top=10 \
    -V margin-left=5 \
    -V margin-right=5 \
    -V margin-bottom=5 \
    -V papersize=letter