# Recipes

A simple LaTeX template and PDF output for writing readable recipes.

## Dependencies

- endnotes: https://ctan.org/pkg/endnotes
- cuisine: https://ctan.org/pkg/cuisine 

## Usage

I have done some templating that can be included quickly using the top-matter and via useful comments lines. Example:

```latex
% Title: Chili by Wes
% Description: Slightly more intesting tradiontal Midwest chili
% Author: Wesley Jones
% Date: December 2017

\documentclass{article}
\input{../template/recipe-top.tex}

\begin{document}
```

The comment section will be pulled out to fulfill webpage details, the `\input` loads templat defaults found here, [`recipe-top.tex`](./source/template/recipe-top.tex`). The webpage code can be seen in [`index.html`](./index.html); this is just a simple JavaScript query and parsing.

Once the above dependencies are installed a top-matter defined in a file, any traditional latex tool will follow the provided settings in [`.latexmkrc`](./latexmkrc) to generate the PDF.
