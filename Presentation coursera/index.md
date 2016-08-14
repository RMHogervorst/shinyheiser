---
title       : Heisertransform 
subtitle    : A presentation about my shiny app
author      : Roel M. Hogervorst
job         : researcher Leiden University
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Intro
This presentation describes my shiny app. This shiny application gives
a short introduction and two examples of a certain transformation that helps to visually display relative probabilities to categorical assignment.

Wait what? 
---

## werewolves
What do I mean with categorical assignment? I could classify you as
normal, a werewolf or a wererabbit. Since everyone knows that werewolves and
humans are indistinguishable, and that wererabbits are very similar to werewolves, 
it is very hard to find out what type people are.  I could build a model that 
uses all sorts of clues to determine the change that you are a werewolf, a 
normal person or a wererabbit. 
The endresult is for every person three probabilities, one for werewolf, normal
and wererabbit. 

But what if we want to display those probabilities for an entire group?

---

## Transformation
To visualize the probabilities of every person in a group I previously made
an implementation of heiser (2004). The endresult is a triangle with three corners
also called vertices, representing the relative frequency of the categories. 
Individual points (persons for instance) in the triangle have a relative position 
based on strength of association towards the vertices (category). 

Thus points closer to a vertice have a larger probability towards that category.

---

## Triangles

This triangle approach is distinct from other triangle plots known as terniary plots, trilinear diagrams or triplots where every side of the triangle displays a dimension, effectively creating a triangular coordinate system. We can even color the points based on a category
or plot the central position of all people with a certain aspect. 

---

## Example plot


```
## Error in fortify(data): object 'ver' not found
```

---

## Further

Find the application online at <https://rmhogervorst.shinyapps.io/shinyheiser/>

This is previous work on this [package](https://github.com/RMHogervorst/heisertransform)
Read the original paper at: <https://dx.doi.org/10.1007/BF02289854>

Look for more of my projects at my [github](https://github.com/RMHogervorst/)




