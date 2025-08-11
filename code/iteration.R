
# Iteration ---------------------------------------------------------------

library(tidyverse)

set.seed(42)


df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

median(df$a)
#> [1] -0.2457625

median(df$b)
#> [1] -0.2873072

median(df$c)
#> [1] -0.05669771

median(df$d)
#> [1] 0.1442633


median_all <- function(df) {
  med_a <- median(df$a) 
  med_b <- median(df$b)
  med_c <- median(df$c) 
  med_d <- median(df$d)
  
  cat(med_a, med_b, med_c, med_d)
  
}

median_all(df)


output <- vector("double", ncol(df))  # 1. output


for (i in seq_along(df)) {            # 2. sequence
  output[[i]] <- median(df[[i]])      # 3. body
}

output


library(tibble)
library(purrr)
library(dplyr)

# Define your function (returns a named list of medians)
median_all <- function(df) {
  list(
    a = median(df$a),
    b = median(df$b),
    c = median(df$c),
    d = median(df$d)
  )
}

# Generate a list of data frames with different seeds
df_list <- map(1:5, ~{
  set.seed(42 + .x)
  tibble(
    a = rnorm(10),
    b = rnorm(10),
    c = rnorm(10),
    d = rnorm(10)
  )
})

# Apply median_all to each data frame
median_results <- map(df_list, median_all)

# Convert to a tidy tibble
bind_rows(median_results, .id = "simulation")


library(tibble)
library(purrr)
library(dplyr)

# Function to compute medians
median_all <- function(df) {
  list(
    a = median(df$a),
    b = median(df$b),
    c = median(df$c),
    d = median(df$d)
  )
}

# Simulate data frames with different distributions
results <- map_dfr(1:5, ~{
  set.seed(100 + .x)
  df <- tibble(
    a = runif(10, min = 0, max = 100),     # Uniform between 0 and 100
    b = rpois(10, lambda = 20),            # Poisson with mean 20
    c = rexp(10, rate = 0.1),              # Exponential with mean 10
    d = rbinom(10, size = 50, prob = 0.3)  # Binomial with 50 trials, p = 0.3
  )
  median_all(df)
}, .id = "simulation")


# Input vector
nums <- 1:5

# Initialize output vector
squared_for <- numeric(length(nums))

# For loop
for (i in seq_along(nums)) {
  squared_for[i] <- nums[i]^2
}

squared_for

library(purrr)

# Input vector
nums <- 1:5

# Using map to apply squaring
squared_map <- map_dbl(nums[nums >= 3], ~ .x^2)

squared_map


means <- c(0, 1, 2)

output <- double()

for (i in seq_along(means)) {
  n <- sample(100, 1)
  output <- c(output, rnorm(n, means[[i]]))
}
str(output)
#>  num [1:138] 0.912 0.205 2.584 -0.789 0.588 ...




set.seed(42)


n <- sample(100, 1)

print(n)


out <- vector("list", length(means))

for (i in seq_along(means)) {
  n <- sample(100, 1)
  out[[i]] <- rnorm(n, means[[i]])
}
str(out)
#> List of 3
#>  $ : num [1:76] -0.3389 -0.0756 0.0402 0.1243 -0.9984 ...
#>  $ : num [1:17] -0.11 1.149 0.614 0.77 1.392 ...
#>  $ : num [1:41] 1.88 2.46 2.62 1.82 1.88 ...
str(unlist(out))
#>  num [1:134] -0.3389 -0.0756 0.0402 0.1243 -0.9984 ...


mean(out[[1]])
mean(out[[2]])
mean(out[[3]])

out[[1]]


col_summary <- function(df, fun) {
  out <- vector("double", length(df))
  for (i in seq_along(df)) {
    out[i] <- fun(df[[i]])
  }
  out
}
col_summary(df, median)

col_summary(df, mean)


col_summary <- function(df, fun) {
  map_dbl(df, fun)
}


map_dbl(df, mean)


means <- map_dbl(df, mean)

means
print(means)
view(means)






