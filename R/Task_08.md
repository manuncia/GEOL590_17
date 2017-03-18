Task 8
================

### The following code takes the values from "two" selected columns and adds it together into a new column and can be renamed as specified by the "user".

A dataset "test\_pre" was tested for the function and generated a warning that states the data not in dataframe format.

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(lazyeval)
test_data <- read.csv("test_data.csv")
str(test_data)
```

    ## 'data.frame':    108 obs. of  4 variables:
    ##  $ Species            : Factor w/ 6 levels "American holly",..: 6 6 6 6 6 6 6 6 6 6 ...
    ##  $ Levels             : int  1 1 5 5 15 15 1 1 5 5 ...
    ##  $ Pre.Photosynthesis : num  4.78 4.43 6.95 4.8 4.2 5.83 4.78 4.97 4.78 4.5 ...
    ##  $ Post.Photosynthesis: num  1.44 5.58 1.08 3.24 7.03 ...

``` r
col1_col2 <- function(df, list_of_cols, new_col) 
  { 
   if(is.data.frame(df)!= TRUE)
    warning("not a data frame")
  df %>% 
  mutate_(.dots = ~Reduce(`+`, .[list_of_cols])) %>% 
  setNames(c(names(df), new_col))
  }

head(col1_col2(test_data, c("Pre.Photosynthesis", "Post.Photosynthesis"), "Final_Photosynthesis"))
```

    ##   Species Levels Pre.Photosynthesis Post.Photosynthesis
    ## 1  Yaupon      1               4.78                1.44
    ## 2  Yaupon      1               4.43                5.58
    ## 3  Yaupon      5               6.95                1.08
    ## 4  Yaupon      5               4.80                3.24
    ## 5  Yaupon     15               4.20                7.03
    ## 6  Yaupon     15               5.83               11.01
    ##   Final_Photosynthesis
    ## 1                 6.22
    ## 2                10.01
    ## 3                 8.03
    ## 4                 8.04
    ## 5                11.23
    ## 6                16.84

### The function uses a for loop and a package microbenchmark to calculate the sum of the elements "your\_fun" vector, that returned 50005000 values.

#### For Loop

##### Takes the summary of all the squared values in loop\_test\_comparison

``` r
library(microbenchmark)
# takes the summary of all the squared values in loop_test_comparison
loop_test_comparison <- c(1:10^4)
your_fun <- function (loop_test_comparison) 
  {for(val in loop_test_comparison)
  sums <- sum(loop_test_comparison) 
  sum
  print(sums)
  }
# takes the summary of all squared values for each rows because of "for loop"
your_fun(1:10^4)
```

    ## [1] 50005000

``` r
test.vec <- 1:10^4
microbenchmark(your_fun(test.vec), sum(test.vec)) #your_fun takes longer because the for loop 
```

    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000

    ## Unit: microseconds
    ##                expr        min         lq         mean     median
    ##  your_fun(test.vec) 168392.598 170779.204 180421.32173 174022.584
    ##       sum(test.vec)     16.011     16.011     18.17054     17.653
    ##          uq        max neval
    ##  186542.263 253669.611   100
    ##      18.474     35.717   100

\` \#\#\#\#\# Takes the summary of all squared values for each rows because of "for loop"

``` r
your_fun(1:10^4)
```

    ## [1] 50005000

``` r
test.vec <- 1:10^4
microbenchmark(your_fun(test.vec), sum(test.vec)) 
```

    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000
    ## [1] 50005000

    ## Unit: microseconds
    ##                expr        min         lq         mean     median
    ##  your_fun(test.vec) 168260.817 170043.333 177011.12793 171897.073
    ##       sum(test.vec)     16.011     16.011     18.05146     17.654
    ##          uq        max neval
    ##  178387.321 222063.440   100
    ##      18.064     33.664   100

### In general, \#your\_fun takes longer because for the for loop option.
