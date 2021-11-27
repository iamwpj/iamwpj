---
title: Pretty BASH
subtitle: |
    Not you're ugly cron job scripts.
author: Wes Jones
date: "27 November 2021"
---

## BASH, but pretty

All code can be (should be...) pretty! It has done enough work to be worth it. There are no standards like Python's PEP here, but here's what I do. I don't see any reason it can't be good looking.

### 1. Add title block

```bash
: << 'NOTES'
Use this script to look cool.

Title: A Script
Author: Wes Jones
Date: 11/2021
Contact: wes@iamwpj.com

References:
    - http://tldp.org
NOTES
...
echo "Start your script here\!"
```

This offers a simple block that is similar to other languages. I find that the header block allows me to easily include links for `references` that contain links to guides or manuals.

**How does it work?**

[The colon is a *null operator*](https://tldp.org/LDP/abs/html/special-chars.html), which accepts data from the `<<` -- essentially piping the [`heredoc`](https://tldp.org/LDP/abs/html/here-docs.html). It's a cool trick that I found while reading about redirecting a `heredoc`.

### 2. ShellCheck

If you only do one thing from this list -- do this. Nothing else really matters. I should have made this the first point! Shellcheck catches all those anti-patterns that you've just dealt with over the years. It's as close as you can get to a language standard.

The process is easy enough, if you rely on a tool like Visual Studio Code you can install the plugin to get syntax highlighting showing potential issues:

![Example of ShellCheck integration in Visual Studio Code.](scraps/src/_media/bash1.png)

If you use `vi` or edit remotely you can install ShellCheck from your favorite repository and get similar output -- maybe even more useful:

![Example of ShellCheck output in terminal.](scraps/src/_media/bash2.png)

*Get more information for ShellCheck here: <https://www.shellcheck.net>*

### 3. Use arrays more

I always used to say that if you're using arrays in BASH you should switch to another language that is better for data processing. Learning about sub-shells outputting to arrays changed this notion. I still recommend reaching for Python or the likes for data processing, but don't be so quick to dismiss the opportunities of using BASH arrays.

```bash
arr=( 3 5 7 )
for n in ${arr[*]}; do
    echo "file-$n.txt"
done
```

It's hard to see in real life so here is a better example.

```bash
arr=( "$(find ~/Desktop/test -type f -name "*.xml")" )

for file in ${arr[*]}; do
    mv "$file" /data/xmls/
done
```

One of the most useful things I find is directly handling a sub-command directly into an array. Obviously there are many options here (`$(ls ~/Desktop/test/*.xml)`) -- it comes down to the data splitting. It's easy to take advantage of the organized data at this point.

*Read more here: <https://tldp.org/LDP/Bash-Beginners-Guide/html/sect_10_02.html>*

### Quick list

A few last thoughts. All of these could be their own post or in some cases multiple chapters in a book.

* Use shell expansions more: <https://ss64.com/bash/syntax-expand.html>
* Split your script into functions: <https://linuxize.com/post/bash-functions>
* Shell parameter expansions: <https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html>
