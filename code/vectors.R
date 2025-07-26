library(tidyverse)

1:10 %% 3 == 0
#>  [1] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE

c(TRUE, TRUE, FALSE, NA)
#> [1]  TRUE  TRUE FALSE    NA


typeof(1)
#> [1] "double"
typeof(1L)
#> [1] "integer"
1.5L
#> [1] 1.5