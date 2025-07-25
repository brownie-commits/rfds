# Functions ---------------------------------------------------------------


f1 <- function(string, prefix) {
  substr(string, 1, nchar(prefix)) == prefix
}

string <- "statistic"
prefix <- "stat"


f1(string, prefix)




f2 <- function(x) {
  if (length(x) <= 1) return(NULL)
  x[-length(x)]
}

f3 <- function(x, y) {
  rep(y, length.out = length(x))
}


f2(c(10, 20, 30))
# Output: 10 20

f2(c("a"))
# Output: NULL


f2(10)

f3 <- function(x, y) {
  rep(y, length.out = length(x))
}

f3(1:10, 3)

?rnorm()
?MASS::mvrnorm

rnorm(1:10)

MASS::mvrnorm(1:10)


# Simulate 1,000 values from N(5, 2)
set.seed(123)  # for reproducibility
x <- rnorm(n = 1000, mean = 5, sd = 2)

# Quick summary and plot
summary(x)
hist(x, breaks = 30, main = "Histogram of rnorm()", col = "skyblue", border = "white")


library(MASS)

# Set parameters
mu <- c(5, 10)
Sigma <- matrix(c(4, -5, -5, 3), nrow = 2)  # Covariance matrix
Sigma
# Simulate 500 samples
set.seed(456)
X <- mvrnorm(n = 500, mu = mu, Sigma = Sigma)

# Check structure and visualize
head(X)
plot(X[,1], X[,2], main = "Scatterplot of mvrnorm()", pch = 20, col = "darkgreen")


# Generate and plot
set.seed(1)
x <- rnorm(1000, mean = 64, sd = 2.5)
hist(x, main = "Univariate Normal Distribution", col = "lightblue")

library(MASS)
mu <- c(64, 140)  # Mean height and weight

Sigma <- matrix(c(6.25, 10, 10, 100), nrow = 2)  # Variance and correlation

set.seed(2)

xy <- mvrnorm(1000, mu = mu, Sigma = Sigma)

plot(xy[,1], xy[,2], xlab = "Height", ylab = "Weight", col = "darkgreen", pch = 20)

has_name <- function(x) {
  nms <- names(x)
  if (is.null(nms)) {
    rep(FALSE, length(x))
  } else {
    !is.na(nms) & nms != ""
  }
}

x <- c(a = 1, b = 2, c = "")


has_name(x)

if (c(TRUE, FALSE)) {}
#> Error in if (c(TRUE, FALSE)) {: the condition has length > 1

if (NA) {}
#> Error in if (NA) {: missing value where TRUE/FALSE needed

test <- function(x, y, op) 
{
  switch(op, 
         plus = x + y, 
         minus = x - y, 
         times = x * y, 
         divide = x/y, 
         stop("Unknown op!"))
}


test(4,5, "plus")


if (y < 0 && debug) {
  message("Y is negative")
}

if (y == 0) {
  log(x)
} else {
  y ^ x
}

x <- 2
y <- -1
debug <- TRUE

# Output:
# "Y is negative"
# Result: (-1)^2 = 1

smart_calc <- function(x, y, debug = FALSE) {
  if (y < 0 && debug) {
    message("Y is negative")
  }
  
  if (y == 0) {
    return(log(x))
  } else {
    return(y ^ x)
  }
}

smart_calc(2, -3, debug = FALSE)
# Message: "Y is negative"
# Output: 9  (since -3^2 = 9)


log(2)


greeting <- function(x) {
  if (x < HH:MM:SS(4:00:00))
}

lubridate::now()

library(lubridate)

greet <- function(time = lubridate::now()) {
  hour <- lubridate::hour(time)
  
  if (hour >= 5 && hour < 12) {
    return("Good morning")
  } else if (hour >= 12 && hour < 18) {
    return("Good afternoon")
  } else {
    return("Good evening")
  }
}

greet(lubridate::now())

fizzbuzz <- function(x) {
  divis_3 <- x %% 3 == 0
  divis_5 <- x %% 5 == 0
  
  if (divis_3 && divis_5) {
    return("fizzbuzz")
  } else if (divis_3) {
    return("fizz")
  } else if (divis_5) {
    return("buzz")
  } else {
    return(x)
  }
}


fizzbuzz(15)
fizzbuzz(3)

15 %% 3

16 %% 3



if (temp <= 0) {
  "freezing"
} else if (temp <= 10) {
  "cold"
} else if (temp <= 20) {
  "cool"
} else if (temp <= 30) {
  "warm"
} else {
  "hot"
}

describe_temp <- function(temp) {
  cut(
    temp,
    breaks = c(-Inf, 0, 10, 20, 30, Inf),
    labels = c("freezing", "cold", "cool", "warm", "hot"),
    right = TRUE
  )
}

describe_temp(32)




switch(x, 
       a = ,
       b = "ab",
       c = ,
       d = "cd"
)

log(1000, base = 10)

# Compute confidence interval around mean using normal approximation
mean_ci <- function(x, conf = 0.95) {
  se <- sd(x) / sqrt(length(x))
  alpha <- 1 - conf
  mean(x) + se * qnorm(c(alpha / 2, 1 - alpha / 2))
}

x <- runif(100)
mean_ci(x)
#> [1] 0.4976111 0.6099594
mean_ci(x, conf = 0.99)
#> [1] 0.4799599 0.6276105


wt_mean <- function(x, w) {
  sum(x * w) / sum(w)
}

wt_var <- function(x, w) {
  mu <- wt_mean(x, w)
  sum(w * (x - mu) ^ 2) / sum(w)
}

wt_sd <- function(x, w) {
  sqrt(wt_var(x, w))
}


wt_mean <- function(x, w) {
  if (length(x) != length(w)) {
    stop("`x` and `w` must be the same length", call. = FALSE)
  }
  sum(w * x) / sum(w)
}

wt_mean(1:6, 1:3)

# Your wt_mean function (with NA handling already defined)
wt_mean <- function(x, w, na.rm = FALSE) {
  if (!is.logical(na.rm)) stop("`na.rm` must be logical")
  if (length(na.rm) != 1) stop("`na.rm` must be length 1")
  if (length(x) != length(w)) stop("`x` and `w` must be the same length", call. = FALSE)
  
  if (na.rm) {
    miss <- is.na(x) | is.na(w)
    x <- x[!miss]
    w <- w[!miss]
  }
  
  sum(w * x) / sum(w)
}

# Sample data with missing values
x <- c(10, NA, 30, 40, NA)
w <- c(1, 2, NA, 3, 1)

X <-  c(10, 40)
Y <- c(1, 3)
# Using na.rm = TRUE
wt_mean(x, w, na.rm = TRUE)
# Returns weighted mean of only complete (non-missing) pairs:
# Calculation uses: x = c(10, 40), w = c(1, 3)


commas <- function(...) stringr::str_c(..., collapse = ", ")


commas(letters[1:10])
#> [1] "a, b, c, d, e, f, g, h, i, j"

rule <- function(..., pad = "-") {
  title <- paste0(...)
  width <- getOption("width") - nchar(title) - 5
  cat(title, " ", stringr::str_dup(pad, width), "\n", sep = "")
}

rule("Important output")

rule("Step 1: Importing Data")

data <- read.csv("my_data.csv")
head(data)

rule("Step 2: Cleaning Data")

# Remove missing values
clean_data <- na.omit(data)

rule("Step 3: Summary Statistics")

summary(clean_data)


# Important output --------------------------------------------------------


# Important Output --------------------------------------------------------


# Important OOutput -------------------------------------------------------



commas(letters, collapse = "-")


complicated_function <- function(X, y, z) {
  if (length(X) == 0 || length(y) == 0) {
    return("Empty Vector")
  }
  
  # Complicated code here
}

complicated_function(X, y, z)

X <-  c()
y <- 10
z <- 10


show_missings <- function(df) {
  n <- sum(is.na(df))
  cat("Missing values: ", n, "\n", sep = "")
}

library(tidyverse)
df <- data.frame(x = c(1, 2, 3, 4, 5, NA), 
                 y = c(5, NA, 9, NA, 6, 8))

view(df)

show_missings(df)


f <- function(x) {
  x + y
} 

f(5, 6)

`+` <- function(x, y) {
  if (runif(1) < 0.1) {
    sum(x, y)
  } else {
    sum(x, y) * 1.1
  }
}

table(replicate(1000, 1 + 2))
#> 
#>   3 3.3 
#> 100 900
rm(`+`)