---
title: Code that I think is neat
subtitle: |
    Humble brag? Show off? Maybe.
author: Wes Jones
date: "2 Nov 2023"
---

# Background

I find that every project I work on I tend to steer the code in a different direction. Often this is a response to the project. With Python, I have this flexibility -- at times I focus on functions, other times I'll give data the bulk of my attention.

I used to write a lot of small Bash and Python interactions, but more and more my experience is trending toward larger projects that involve constructing an entire back-end using these languages. Either way -- over the years I have written some neat code (I think).

# Auto-reestablish API session

I encountered a service with an inconvenient combination of problems: it was slow to get all data, process it, and submit responses back incrementally. I couldn't batch the problem, but this all left the interaction vulnerable to the session token timing out.

The process to resolve this involved implementing Python `dataclasses` to manage both the connection details and API session token. This allowed the data to persist and be efficiently checked before every API interaction. When the `expiretime` was reached, a process to `_reestablish` the token was kicked off.

```python
def _reestablish(self):
    """
    Use this to peroidically re-establish your 
    API Key. During long running API queries
    you'll end up with an exipred token and receive
    401 errors.
    This check is triggered to handle those.
    """

    if self.expiretime < round(time.time()):
        l.notice(
            f"API token session has expired. Expiration time: {datetime.fromtimestamp(self.expiretime).strftime('%c')}")
        
        object.__setattr__(self, 'token', _token(test=self.test))
        object.__setattr__(self, 'expiretime', round(time.time()) + self.duration)
        object.__setattr__(self, 'headers', headers)
```

I'd never worked with manipulating the loaded `object` object in Python, but a dataclass can be manipulated with values from any function that has access to the object. I don't know how _frequent_ I will use this manipulation, but it was certainly useful here!

# State Checks

When I'm integrating data from several sources, there's often an ugly combination of logic that will become unavoidable at some point. It's along the lines of:

```psuedo
if ( A in set1 and setB ) and not (if A.1 exists and ( A.1 == 2 )):
    . . .
```

Gross.

I had some really problematic code that was causing issues and went looking for design patterns in Python that would help to manage just this type of logic. I found a clever feature of Python: [`all()`](https://realpython.com/python-all/).

Here's a readable chunk of code from the linked site:

```python
>>> bool_exps = [
...     5 > 2,
...     1 == 1,
...     42 < 50,
... ]
>>> all_true(bool_exps)
True
```

My real world implementation is a little more...involved. I'm sure there's performance advantages, but it's also really nice to be able to `print` a dictionary in debug logging that would just show _why_ the conditions aren't met. I think I'll use this for to create better auditing/reporting during evaluation processes.

```python
if item in list(self.data.SUBDICT.keys()):
    state_check = {
        "item_id_exists": True,
        "item_unused": True 
            if self.data.SUBDICT[item] not in comparision_dict
            else False,
    }
else:
    state_check = {"item_id_exists": False}

if all(list(state_check.values())):
    l.info(f"Beginning delete process for {item}: {state_check}")
    self._checkitem(item)
```

# Send HTML emails in Bash

`mail` can easily submit an email to a configure relay or mail server and provide some basic features. Presentation however...that requires some work. There are clear advantages to plain text, but anymore I really prefer to have a nice looking list/report that I can easily review. I don't use emails for _monitoring_ as much as I used to -- instead it's typically _reporting_ -- which should look nice!

In Bash you can submit mail direct to the `sendmail` program. It takes a formatted email message, parses, and handles it.

```bash
(
    echo -e From: serviceA@iamwpj.com
    echo -e To: wes@iamwpj.com
    echo -e Subject: Long running jobs
    echo -e Content-Type: text/html
    echo -e "
    <html>
        <body>
        The following jobs took longer this week:

        <pre>$(
            echo "${results[@]}" | sed 's/ /\n/g' | column -N "JOB,ID,START DATE, EXPECTED RUNTIME, ACTUAL RUNTIME" -t -s','
        )</pre>

        [$(hostname -f)] - $(date)
        </body>
    </html>
    "
) | /usr/sbin/sendmail -t
```

Would produce a message like this:

> The following jobs took longer this week:
>```plain
>JOB    ID  START_DATE          EST_RUNTIME     RUNTIME
>FeedMe 24  2023-09-08T11:35    12s             94s
>```
>[feedme.iamwpj.com] - Fri Sep 8 17:51:14 CDT 2023

If I tried to send a plain formatted table in Bash, I can't control the plain text table -- the email viewer will simply output the text in the system font:

<!-- 
This has to have a '<br>' tag because of the nature of block quotes in MD.
It's still representative of the email content.
-->
>The following jobs took longer this week:
>
>JOB     ID  START_DATE         EST_RUNTIME   RUNTIME<br>
>FeedMe  24  2023-09-08T11:35   12s           94s
>
>[feedme.iamwpj.com] - Thu Nov  2 11:32:37 CDT 2023

This pattern is easily reproducible and _looks nice_ in scripts. It means I can simply drop my variables and subshells directly into the HTML layout. In the Bash world, I consider that a big win.

**The one major detraction here: you cannot send attachments ([well...not reasonably at least IMHO](https://unix.stackexchange.com/questions/223636/can-sendmail-include-an-attachment/507171#507171)) using this method**

# Shell Parameter Expansions

I _love_ [shell parameter expansions](https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html). I think of it like the regex of Bash variables. It's ugly, relatively unreadable, but still worth it.

Let's look at my favorites:

## Defaults

If you suspect you might collect a `null` variable that you don't want, Bash can allow you set a default:

```bash
$ var=
$ : ${var:=DEFAULT}
$ echo $var
DEFAULT
```

## Pattern Matching

* <https://www.gnu.org/software/bash/manual/html_node/Pattern-Matching.html>

I use this a lot to manage subdirectories and dynamically specify either a _file_ or it's containing _directory_ without having multiple variables or using `awk` to parse out components.

```bash
$ data_location='data/folderA/mydata.txt'
# Directories:
$ echo -e ${data_location%/**}
data/folderA
# File
$ echo -e ${data_location##*/}
mydata.txt
```

## Replacement

Frequently, you'll get a resulting variable from an external source or something internally that needs to dynamically update. This means you'll need to update the value within a variable. Rather than _overwriting_ the variable, parameter expansion can replace components:

```bash
$ data_location='data/folderA/mydata.txt'
$ echo -e ${data_location/my/your}
data/folderA/yourdata.txt
```

# Conclusion

I'm sure there's more, but these just hit me right today.
