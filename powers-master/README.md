
<!-- README.md is generated from README.Rmd. Please edit that file -->
[![Build Status](https://travis-ci.org/vincenzocoia/powers.svg?branch=master)](https://travis-ci.org/vincenzocoia/powers)

**Note**: This R package is not mean to be "serious". It's just for teaching purposes.

powers
======

This is an R package that gives `sqrt()` friends by providing other power functions. Additionally, I have added a box-cox transformation function that gives the boxcox power transformation of the data values, when a choice of lambda is indicated.

Installation
------------

You can install my version of the powers package from github from:

``` r
# install.packages("devtools")
devtools::install_github("STAT545-UBC-students/hw07-rachlobay/powers-master")
```

Examples of the functions in the package
----------------------------------------

See the vignette for more extensive use, but here's an example of the reciprocal function that shows the reciprocal of 2 (which we expect to be 0.5).

``` r
powers::reciprocal(2)
#> [1] 0.5
```

The following are examples of the of the cube and square functions on the even numbers 2, 4, 6, 8, 10.

``` r
powers::cube(c(2,4,6,8,10))
#> [1]    8   64  216  512 1000
powers::square(c(2,4,6,8,10))
#> [1]   4  16  36  64 100
```

Here is an example of a basic use of the boxcox.transform() function in the powers package. This example has the positive data values in a vector, x, of 1,2,3,4,5. The lambda parameter, which is a measure of the strength of the boxcox transformation, is set to 3.

``` r
x = 1:5
powers::boxcox.transform(x, lambda = 3)
#> [1]  0.000000  2.333333  8.666667 21.000000 41.333333
```

It is important to note that the lambda argument may be a vector of values. In this case, the output will be a matrix of transformed data values, where each column corresponds to a different lambda value. Notice that the columns are labelled to indicate which lambda value each refers to.

``` r
powers::boxcox.transform(x = 1:5, lambda = c(0,1))
#>           Z1^0 Z2^1
#> [1,] 0.0000000    0
#> [2,] 0.6931472    1
#> [3,] 1.0986123    2
#> [4,] 1.3862944    3
#> [5,] 1.6094379    4
```

Finally, I will finish off with an examplex of the boxcox.transform function where the data values are not strictly positive. In this case, if the user doesn't specify what constant they wish to add to each of the data (x) values to make them positive, the function will automatically add the minimum constant required to make all the data values positive.

``` r
powers::boxcox.transform(x = -5:5, lambda = c(0,1))
#> Warning in powers::boxcox.transform(x = -5:5, lambda = c(0, 1)): Warning:
#> The minimum constant value was automatically added to each data value to
#> make all data values positive.
#>            Z1^0 Z2^1
#>  [1,] 0.0000000    0
#>  [2,] 0.6931472    1
#>  [3,] 1.0986123    2
#>  [4,] 1.3862944    3
#>  [5,] 1.6094379    4
#>  [6,] 1.7917595    5
#>  [7,] 1.9459101    6
#>  [8,] 2.0794415    7
#>  [9,] 2.1972246    8
#> [10,] 2.3025851    9
#> [11,] 2.3978953   10
```

That said, the user could specify what constant they wish to add to each x value to make them all positive using the makepos parameter.

``` r
powers::boxcox.transform(x = -5:5, lambda = c(0,1), makepos = 10)
#>           Z1^0 Z2^1
#>  [1,] 1.609438    4
#>  [2,] 1.791759    5
#>  [3,] 1.945910    6
#>  [4,] 2.079442    7
#>  [5,] 2.197225    8
#>  [6,] 2.302585    9
#>  [7,] 2.397895   10
#>  [8,] 2.484907   11
#>  [9,] 2.564949   12
#> [10,] 2.639057   13
#> [11,] 2.708050   14
```

For Developers
--------------

(Again, I don't actually intend for anyone to develop this silly package, but if I did, here's what I'd write.)

Use the internal `pow` function as the machinery for the front-end functions such as `square`, `cube`, and `reciprocal`.
