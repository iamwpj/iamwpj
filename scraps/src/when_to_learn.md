---
title: When to learn the basics
subtitle: |
    Learning the basics of Python, but after using the language for years.
author: Wes Jones
date: "11 May 2022"
---

# __init__()

I'm writing some new code and one of the pleasures (dismays?) of starting a fresh codebase is defining your "infrastructure". Loading logging. Defining a configuration standard. Integrate CI and creating a runbook template. Why shouldn't I revisit my code writing too?

I've known for the past few years I've written Python that I'm only using the basics of the language. I don't use static types or decorators. I avoid classes and of course unit testing is a chuckle. I'm not going to add all of that into my workflow right now, but in the past I've always been good about composing my infrastructure components to ensure that down-the-road I don't have to refactor a *huge* chunk of a project to allow for a basic change — so I'll improve my Python writing.

**Areas of focus:**

* Use data models, <https://docs.python.org/3/reference/datamodel.html>. Specifically special methods and other core features beyond the typical dicts and lists. If I compose my data to an object that supports these functions I can more easily pass it through logic — or even limit the amount of logic handling I'll have to do!
* Catch exceptions (and handle them!), <https://docs.python.org/3/tutorial/errors.html>. This is only feasible since I'll be doing a better job managing what data gets stored in my objects. I find myself looking to merge datasets often enough, that I've gotten use to just using a couple of iterators to dump data blindly to a new dict. No more blindness!
* Using list comprehension for managing logic, <https://www.geeksforgeeks.org/python-list-comprehension-and-slicing/>. I understand this isn't a new paradigm of coding, I've pondered if it goes against Python's readability advantages, but I find that in my workflow I enjoy it. I'm tired of spending time buried in tabbed iterations.

That's all. Just a couple of points. I'm not an expert, but I write Python all the time, yet aside from `def` and some clever `for` loops I rarely find myself pushing into new territory.