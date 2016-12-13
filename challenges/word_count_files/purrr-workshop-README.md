# Abstract

Happy R users purrr: using functional programming to solve iteration problems

Code with a lot of duplication is harder to understand, troubleshoot and maintain. The goal of this tutorial is help you remove duplication in your code with two strategies: writing your own functions and using functions that write `for` loops for you.

We'll assume you already know the mechanics of defining a function but give you some tips on when and how to write a function emphasizing that good functions aren't just correct, they are also understandable.  Then we'll talk about using functions as inputs to other functions, a key idea in functional programming.  In the rest of the tutorial you'll learn to use the functions in the `purrr` package that remove code that is duplicated across for loops.  By the end of the tutorial you'll be writing code that is more readable and easier to update and you'll be ready to solve new iteration problems faster and with fewer mistakes.

# Prerequisites

* You know how to define your own function, and have written a few.
* You know how to write a for loop.
* You have seen `sapply()` and `lapply()`, but it's OK if you don't use them (or don't know why you should use them).
