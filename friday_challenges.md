Friday Challenges!
========================================================
author: Software Carpentry
date: 01 May 2015

Brief outline
========================================================

 - vectorizing
 - logical tests
 - adding logic to functions
 - `if`
 - `for`

Remi's Question
========================================================


If `x <- c(1,3,6,34,2,3,5,76,3,4,5,6,7,9)` which answer below will calculate the mean of the first 3 numbers in x?

  1.  `mean[x[1:3]]`
  2.  `mean{x[1:3]}`
  3.  `mean(x{1:3})`
  4.  `mean(x[1:3])`
  5.  `mean(x{1:3})`




Challenge 1
========================================================

What happens when we multiply two vectors of **different** length? why?
```r
1:8 * 1:2
```
try it for different lengths of the vectors.

Challenge 2
========================================================

We're interested in looking at the sum of the
 following sequence of fractions:
```r
x = 1/(1^2) + 1/(2^2) + 1/(3^2) + ... + 1/(n^2)
```
This would be tedious to type out, and impossible for high values of n.
Can you use vectorisation to solve for x when n=100?
How about when n = 10 000?

Challenge 3
========================================================

R has two useful functions which work on vectors of `TRUE` and `FALSE`:

```r
any()
all()
```
What do you think they do?

Using `any()` and `country_list`, write a test to find out if there is a country called "Svitz". 
(i.e. the test should return a single **TRUE** or a single **FALSE**)

