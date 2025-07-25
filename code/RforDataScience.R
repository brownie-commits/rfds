##### R for Data Science #####

##### Chapter 1: Data Visualization with R #####

library(tidyverse)

# MPG data frame # 

ggplot2::mpg

# Learn more about mpg dataset # 

?mpg
  
  # Plotting mpg # 

ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, color = class)) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(data = mpg) +
  geom_point(mapping = aes (x = cyl, y = hwy))

ggplot(data = mpg) +
  geom_point(mapping = aes (x = class, y = drv))

# Plotting mpg with color aesthetic

ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, color = class))

# Plotting mpg with size aesthetic

ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy, size = class))

ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy), color = "blue")


?geom_point

ggplot(mtcars, aes(wt, mpg)) +
  geom_point(shape = 21, colour = "black", fill = "white", size = 5, stroke = 5)


ggplot(data = mpg) +
  geom_point(mapping = aes (x = displ, y = hwy), color = displ < 5)
    
# Using Facets # 
         
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(~ class, nrow = 2)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(drv ~ .)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ cyl)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(. ~ cyl, space = "free_y", shrink = TRUE)

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ .)

 # Faceting on a continuous variable # 

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_wrap(~ cty, nrow = 5)

ggplot(data = mpg)+
  geom_point(mapping = aes(x = displ, y = hwy))+
  facet_grid(drv ~ cty)

?facet_wrap

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))
  

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy))


ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))

ggplot(data = mpg) +
  geom_smooth(mapping = aes(x = displ, y = hwy, color = drv),
              show.legend = FALSE)

ggplot(data = mpg, mapping = aes(x= displ, y = hwy)) +
  geom_point() +
  geom_smooth()
 
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
       geom_point(mapping = aes(color = class)) +
       geom_smooth(
         data = filter(mpg, class == "suv"),
         se = FALSE
       )

mpg %>% 
  filter(class =="suv") %>%  
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(se = FALSE)
  

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = reorder(cut, stat(prop)), y = stat(prop), group = 1))



mpg %>% 
  ggplot(aes(x = displ, y = hwy)) +
  geom_point(aes(color = class)) +
  geom_smooth(aes(color = class))

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = class)) +
  geom_smooth(
    data = filter(mpg, class == "suv"),
    se = FALSE
  )



?geom_line                   
?geom_histogram                   
?geom_boxplot                   


ggplot(
  data = mpg, 
  mapping = aes (x = displ, y = hwy, color = drv)
) + 
  geom_point() +
  geom_smooth(se = FALSE, 
  show.legend = FALSE)

ggplot(
  data = mpg, 
  mapping = aes (x = displ, y = hwy, color = drv)
 ) + 
   geom_point() +
   geom_smooth(se = TRUE)

?se

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes(color = drv), size = 9) +
  geom_smooth(mapping = aes(line = drv, color = drv, size = 3), se = FALSE)


  
##### Extra Geom_point practice #####

ls("package:ggplot2")

grep(pattern = "^geom", x = ls("package:ggplot2"),
     value = TRUE)

theme_set(new = theme_light())

ggplot(data = iris, 
       mapping = aes(x = Petal.Width, 
                     y = Petal.Length)) +
  geom_point()

iris %>% 
  ggplot(aes(x= Petal.Width, y = Petal.Length,
         color = Species)) +
  geom_point()

iris %>% 
  ggplot(aes(x= Petal.Width, y = Petal.Length,
             color = Species)) +
  geom_point(size = 3, alpha = 0.4)

iris %>% 
  ggplot(aes(x= Petal.Width, y = Petal.Length,
             color = Species)) +
  geom_jitter(size = 3, alpha = 0.4)

iris %>% 
  ggplot(aes(x= Petal.Width, y = Petal.Length,
             color = Species)) +
  geom_point(size = 3, alpha = 0.4)

iris %>% 
  ggplot(aes(x= Petal.Width, y = Petal.Length,
             color = Species)) +
  geom_boxplot() +
  geom_point()

iris %>% 
  ggplot(aes(x= Petal.Width, y = Petal.Length,
             color = Species)) +
  geom_jitter() +
  geom_boxplot()

iris %>% 
  ggplot(aes(x= Petal.Width, y = Petal.Length,
             color = Species)) +
  geom_jitter() +
  geom_boxplot(alpha = 0.4)

iris %>% 
  ggplot(aes(x = Petal.Width, y = Petal.Length, 
             color = Species, 
             fill = Species)) +
  geom_boxplot(alpha = 0.2, outlier.shape = NA) + 
  geom_jitter()

iris %>% 
  ggplot(aes(x = Petal.Width, y = Petal.Length, 
             color = Species, 
             fill = Species)) +
  geom_boxplot(alpha = 0.2) +
  geom_point()

iris %>% ggplot(aes(x = Petal.Width, y = Petal.Length, 
             color = Species, 
             fill = Species)) +
  geom_violin(alpha = 0.2) +
  geom_jitter()

p1 <- iris %>% ggplot(aes(x = Species, y = Petal.Length, 
                          color = Species)) + geom_boxplot()

p2 <- iris %>% ggplot(aes(x = Species, y = Petal.Length, 
                          color = Species)) + geom_violin()


install.packages("gridExtra")

library(gridExtra)

grid.arrange(p1,p2)



iris %>% ggplot(aes(x = Species,
                    y = Petal.Length, 
                    fill = Species)) +
  geom_dotplot(binaxis = "y", 
               stackdir = "center", 
               dotsize = 0.5)


table(mpg$class)

mpg$class

mpg %>% count(class)

view(mpg)

mpg %>% ggplot(aes(x = class)) + 
  geom_bar()

mpg %>% count(class) %>% 
  ggplot(aes(x = class, 
             y = n)) +
  geom_bar(stat = "identity")

mpg %>% count(class) %>% 
  ggplot(aes(x = class, 
             y = n, 
             fill = class)) +
  geom_col(col = "black")


dim(diamonds); str(diamonds)

ggplot(data = diamonds, aes(x = price))+
  geom_histogram(bins = 50, 
                  color = "black", 
                  fill = "lightgrey")

ggplot(diamonds, aes(x = price, 
                     fill = cut)) +
  geom_histogram(bins = 50, 
                  color = "black") +
  xlim(c(0, 8000))


ggplot(diamonds, aes(x = price, 
                     fill = cut)) +
  geom_histogram( bins = 50, 
                  color = "black", 
                  position = "dodge") +
  xlim(c(0, 8000))


ggplot(diamonds, aes(x = price, 
                     fill = cut)) +
  geom_histogram(bins = 50, 
                  color = "black") +
  xlim(c(0, 8000)) +
  facet_wrap(~cut, nrow = 3)

ggplot(diamonds, aes(x = price, 
                     fill = cut)) +
  geom_histogram( bins = 50, 
                  color = "black") +
  xlim(c(0, 8000)) +
  facet_wrap(~cut, nrow = 5, scales = "free_y")

?ggplot:free_y


ggplot(diamonds, aes(x = price, 
                     color = cut)) +
  geom_freqpoly(binwidth = 200, size = 1.5) +
  xlim(c(0, 8000))


ggplot(diamonds, aes(x = price, 
                     color = cut)) +
  geom_density(size = 1.5) +
  xlim(c(0, 8000))

p3 <- iris %>% ggplot(aes(x = Petal.Width, 
                          fill = Species)) +
  geom_density(alpha = 0.5)

p4 <- iris %>% ggplot(aes(Sepal.Width, 
                          fill = Species))+
  geom_density(alpha = 0.5)

grid.arrange(p3,p4)

line_df <- data.frame(
  x = c(1, 4, 3, 5, 2, 6), 
  y = c(2, 4, 1, 2, 3, 3))

ggplot(mapping = aes(x = x,
                     y = y), 
       data = line_df) + 
  geom_line() +
  geom_point()


ggplot(data = line_df, mapping = aes(x = x,
                     y = y)) + 
            geom_line() +
            geom_point()

ggplot(data = line_df, mapping = aes(x = x,
                                     y = y)) + 
  geom_step() +
  geom_point()



ggplot(data = line_df, mapping = aes(x = x,
                                     y = y)) + 
  geom_path() +
  geom_point()

install.packages("gapminder") 

library(gapminder)

gapminder_subset <- gapminder %>% 
  filter(country %in%
           c("China", "India", "United States"))

View(gapminder_subset)

gapminder_subset %>%
  ggplot (aes(x = year, y = lifeExp)) +
  geom_line(aes(group = country))
 
gapminder_subset %>%
  ggplot (aes(x = year, y = lifeExp)) +
  geom_line(aes(color = country), size = 1.5)

gapminder_subset %>%
  ggplot (aes(x = year, y = lifeExp, color = country, shape = country)) +
  geom_line() +
  geom_point(size = 2)

set.seed(3)
data <- data.frame(x = 1:20, 
                   y = abs(cumsum(rnorm(20))))

ggplot(data, aes (x = x, y = y)) +
  geom_area(fill = "#69b3a2", alpha = 0.4)


set.seed(1)
time <- as.numeric(rep(seq(1,5), each = 5))
value <- runif(n = 25, min = 10, max = 100)
group <- rep(LETTERS[1:5], times = 5)
data <- data.frame(time, value, group)


ggplot(data, aes(x = time, y = value, fill = group)) +
  geom_area(color = "black")

mtcars %>% 
  ggplot(aes(x = wt, y = mpg)) +
  geom_point(aes(color = mpg > 17.5 & mpg < 22.5), 
             show.legend = TRUE, size = 3) +
  geom_hline(yintercept = 17.5, linetype = "dashed") +
  geom_hline(yintercept = 22.5, linetype = "dashed") +
  labs(title = "Milage vs Weight Scatterplot", 
       subtitle = "Data source; mtcars dataset", 
       x = "Weight (in tonnes)", 
       y = "Miles per Gallon", 
       color = "Cars between\n17.5 and 22.5\nmilage", 
       caption = "Example")

 mtcars %>% 
  ggplot(aes(wt, mpg, 
             color = as.factor(cyl))) +
  geom_segment(x = 2.62, xend = 3.46, 
               y = 19.7, yend = 19.7, 
               color = "lightgreen", 
               size = 1.5) +
  geom_point()

?as.factor

mtcars %>% 
  ggplot(aes(x = wt, y= mpg, 
             color = as.factor(cyl))) +
  geom_rect(xmin = 2.62, xmax = 3.46, 
               ymin = 17.8, ymax = 21.4, 
               color = "lightgreen", 
               size = 1.5) +
  geom_point()

mtcars %>% ggplot(aes(wt,mpg)) +
  geom_point()

lm(mpg ~ wt, data = mtcars)

mtcars %>% 
  ggplot(aes(wt, mpg)) + 
  geom_point(size = 2.5) +
  geom_abline(intercept = 37.285, 
              slope = -5.344, 
              color = "orange", 
              size = 1.5)

mtcars %>% 
  ggplot(aes(wt, mpg)) +
  geom_point() + 
  geom_smooth(method = "lm", color = "red")

mtcars %>% 
  ggplot(aes(wt, mpg)) +
  geom_point() +
  geom_smooth()


mtcars %>% 
  ggplot(aes(wt, mpg, color = as.factor(cyl))) +
  geom_point() +
  geom_smooth(method = "lm")

mtcars$model <- row.names(mtcars)

mtcars %>% 
  ggplot(aes(wt, mpg, color = as.factor(cyl), label = model)) +
  geom_point() +
  geom_text(vjust = -1, hjust = 0.5)
  
mtcars %>% 
  ggplot(aes(wt, mpg)) +
  geom_point() +
  geom_rug()

mtcars %>% 
  ggplot(aes(wt, mpg, color = as.factor(cyl))) +
  geom_point() +
  geom_rug(sides = "" )

b <- ggplot(mtcars, aes(wt, mpg)) +
  geom_point()


df <- data.frame(x1 = 2.62, x2 = 3.57, 
                y1 = 21.0, y2 = 15.0)

b + 
  geom_curve(aes(x = x1, y = y1, 
                  xend = x2, yend = y2, 
                  color = "curve"), data = df) +
  geom_segment(aes(x = x1, y = y1, xend = x2, yend = y2, 
                   color = "segment"), data = df)

b +
  geom_curve(aes(x = x1, y = y2, xend = x2, yend = y2), 
             data = df, 
             arrow = arrow(length = unit(0.5, "npc")))


##### Statistical Transformation ##### 

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut))


ggplot(data = diamonds) +
  stat_count(mapping = aes(x = cut))


demo <- tribble(
  ~a,       ~b, 
  "bar_1",   20, 
  "bar_2",   30, 
  "bar_3",   40, 
  )

?tribble


ggplot(data = demo) +
  geom_bar(
    mapping = aes(x = a, y = b), stat = "identity"
  )

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))


ggplot(data = diamonds) +
  stat_summary( 
    mapping = aes(x = cut, y = depth), 
    fun.ymin = min, 
    fun.ymax = max, 
    fun.y = median)


diamonds %>% ggplot(aes(cut, depth)) +
    geom_pointrange(aes(ymin = lower, ymax = upper))

ggplot(data = diamonds) + 
  geom_pointrange(mapping = aes(x = cut, y = depth),
    ymin = lower, 
    ymax = upper)

?geom_pointrange


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, color = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = cut))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))
 
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) +
  geom_bar(alpha = 1/5, position = "identity")

ggplot(data = diamonds, mapping = aes(x = cut, color = clarity)) +
    geom_bar(fill = NA, position = "identity")


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), 
            position = "fill")

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity), 
           position = "dodge")

?stat_summary
?geom_bar
?geom_line

ggplot(data = diamonds) +
  geom_col(mapping = aes(x = cut, y = depth))

?stat_smooth

ggplot(data = diamonds) +
  stat_smooth(mapping = aes(x = cut))


ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = color, y = ..prop.., group = 1))


?ggplot2::group

ggplot(data = mpg) +
  geom_boxplot(mapping = aes(x = class, y = hwy, ))

bar <- ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

bar + coord_polar()

ggplot(data = diamonds) +
  geom_bar(mapping = aes(x = cut, fill = clarity))

bar + coord_flip()

bar + coord_map()

?ggplot2::coord_map()

`ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point() + 
  geom_abline() +
  coord_fixed()


?ggplot2::geom_abline


ggplot(data = diamonds) + 
  stat_summary(
    mapping = aes(x = cut, y = depth),
    fun.min = min,
    fun.max = max,
    fun = median
  )


  

##### Chapter 2: Workflow Basics #####

1 / 200 * 30

(59 + 73 + 2)/3

sin(pi / 2)

x <- 3 * 4
 
x

this_is_a_really_long_name <- 2.5

this_is_a_really_long_name

r_rocks <- 2 ^ 3

r_rock  

seq(1, 10)

x <- "hello world"

this_is_a_really_long_name

y <- seq(1, 10, length.out = 5)
  

filter(diamonds, carat > 3)

install.packages("nycflights13")

library(nycflights13)

library(tidyverse)

?flights

nycflights13::flights

view(flights)

flights %>%  
  filter(month == 1, day == 1)

filter(flights, month == 1, day == 1)

jan1 <- filter(flights, month == 1, day == 1)

(dec25 <- filter(flights, month == 12, day == 25))

near(sqrt(2) ^ 2, 2)


filter(flights, month == 11 | month == 12)

nov_dec <- filter(flights, month %in% c(11, 12))


filter(flights, !(arr_delay > 120 | dep_delay > 120))

filter(flights, arr_delay <= 120, dep_delay <= 120)

df <- tibble(x = c(1, NA, 3))

filter(df, x > 1)

filter(df, is.na(x) | x > 1)

filter(flights, !(arr_delay >= 120))

filter(flights, dest == "IAH" | dest == "HOU")

# OR

filter(flights, dest %in% c("IAH", "HOU"))

filter(flights, carrier %in% c("UA", "AA", "DL"))

ua_aa_dl <- filter(flights, carrier %in% c("UA", "AA", "DL"))

airlines

View(ua_aa_dl)


filter(flights, month %in% c(7,8,9))

filter(flights, month %in% c(7:9))

filter(flights, arr_delay > 120, dep_delay <= 0)

e <- filter(flights, arr_delay >= 120, dep_delay <= 0)

View(e)

filter(flights, dep_delay >= 60, dep_delay - arr_delay > 30)

filter(flights, dep_time >= 0, dep_time <= 600)

filter(flights, dep_time <= 600 | dep_time == 2400)

# OR Modulo operator

filter(flights, dep_time %% 2400 <= 600)
filter(flights, dep_time <= 600)

sum
mary(flights$dep_time)

?between()

filter(flights, is.na(dep_time))

summary(flights)

NA ^ 0

NA | TRUE
NA | FALSE
NA & FALSE
NA & TRUE
NA * 0

arrange(flights, year, month, day)

arrange(flights, desc(arr_delay))

df <- tibble(x = c(5, 2, NA))

arrange(df, x)

arrange(df, desc(x))

arrange(flights, desc(is.na(dep_time)), dep_time)

arrange(flights, desc(is.na(dep_time)))

arrange(flights, dep_time) %>% tail()

arrange(flights, desc(dep_delay))

arrange(flights, air_time)

arrange(flights, (air_time))

?arrange

head(arrange(flights, air_time))

tail(arrange(flights, air_time))

head(arrange(flights, desc(distance / air_time)))

flights %>% 
  arrange(desc(distance / air_time)) %>% 
  head()


arrange(flights, distance)

arrange(flights, desc(distance))

select(flights, year, month, day)

select(flights, year:day)

select(flights, -(year:day))

?select

select(flights, starts_with("arr"))

rename(flights, tail_num = tailnum)

# If you have a handful of variables you'd like to move to the start of your data frame

select(flights, time_hour, air_time, everything())

select(flights, year, year)

select(flights, year)

select(flights, dep_time, dep_delay, arr_time, arr_delay)

select(flights, "dep_time", "dep_delay", "arr_time", "arr_delay")

select(flights, 4, 6, 7, 9)

select(flights, any_of(c("dep_time", "dep_delay", "arr_time", "arr_delay")))

select(flights, all_of(c("dep_time", "dep_delay", "arr_time", "arr_delay")))

select(flights, matches("^(dep|arr)_(time|delay)$"))

select(flights, matches("^(dep|arr)_(time|delay)$"))


# Specify the names of the variables with a character vector and use the bang-bang operator (!!).

variables <- c("dep_time", "dep_delay", "arr_time", "arr_delay")

select(flights, !!variables)

vars <-  c("year", "month", "day", "dep_delay", "arr_delay")

select(flights, one_of(vars))

select(flights, contains("TIME"))


?contains

1504 %/% 100

1504 %% 100

1504 %/% 1440  1504 %% 100 

flights_times <- mutate(flights,
                        dep_time_mins = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
                        sched_dep_time_mins = (sched_dep_time %/% 100 * 60 +
                                                 sched_dep_time %% 100) %% 1440
)
# view only relevant columns
select(
  flights_times, dep_time, dep_time_mins, sched_dep_time,
  sched_dep_time_mins
)
#> # A tibble: 336,776 x 4
#>   dep_time dep_time_mins sched_dep_time sched_dep_time_mins
#>      <int>         <dbl>          <int>               <dbl>
#> 1      517           317            515                 315
#> 2      533           333            529                 329
#> 3      542           342            540                 340
#> 4      544           344            545                 345
#> 5      554           354            600                 360
#> 6      554           354            558                 358
#> # … with 336,770 more rows

flights_sml <- select(flights, 
                      year:day, 
                      ends_with("delay"), 
                      distance, 
                      air_time)

mutate(flights_sml, 
       gain = arr_delay - dep_delay, 
       speed = distance / air_time * 60)

mutate(flights_sml, 
       gain = arr_delay - dep_delay, 
       hours = air_time / 60, 
       gain_per_hour = gain / hours)

transmute(flights, 
          gain = arr_delay - dep_delay, 
          hours = air_time / 60, 
          gain_per_hour = gain / hours)

transmute(flights, 
          dep_time, 
          hour = dep_time %/% 100, 
          minute = dep_time %% 100)


flights_times <- mutate(flights,
                        dep_time_mins = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440,
                        sched_dep_time_mins = (sched_dep_time %/% 100 * 60 +
                                                 sched_dep_time %% 100) %% 1440
)
# view only relevant columns
select(
  flights_times, dep_time, dep_time_mins, sched_dep_time,
  sched_dep_time_mins
)
#> # A tibble: 336,776 x 4
#>   dep_time dep_time_mins sched_dep_time sched_dep_time_mins
#>      <int>         <dbl>          <int>               <dbl>
#> 1      517           317            515                 315
#> 2      533           333            529                 329
#> 3      542           342            540                 340
#> 4      544           344            545                 345
#> 5      554           354            600                 360
#> 6      554           354            558                 358
#> # … with 336,770 more rows

(x <- 1:10)

lag(x)
lead(x)

x

cumsum(x)

cummean(x)

min_rank(x)

y <- c(1, 2, 2, NA, 3, 4)

min_rank(y)

min_rank(desc(y))

row_number(y)

dense_rank(y)

percent_rank(y)

 cume_dist(y)

transmute(flights, 
          dep_time, 
          hour = dep_time %/% 100, 
          minutes = dep_time %% 100, 
          sched_dep_time, 
          hour = sched_dep_time %/% 100, 
          minutes = sched_dep_time %% 100)

flight_times <- mutate(flights, 
                       dep_time_mins = (dep_time %/% 100 * 60 + dep_time %% 100) %% 1440, 
                       sched_dep_time_mins = (dep_time %/% 100 * 60 + 
                                                sched_dep_time %% 100) %% 1440)


# quick note on modular arithmetic

# The modulus (%%) operator finds the remainder after division. Here's how it works for 517 %% 100:
# 1. Perform integer division- 517 ÷ 100 = 5.17 → The whole number part is 5.
# 2. Multiply back to find the nearest multiple of 100- 5 × 100 = 500.
# 3. Find the remainder- 517 - 500 = 17.
# 4. So, 517 %% 100 gives the remainder 17.


library(lubridate)


as_date(365 * 10)

d1 <- mdy("January 1, 2020")
d2 <- dmy("06-Jun-17")

d2 <- as.date()


year(d2)
month(d2)
day(d2)
wday(d2, label = TRUE, week_start = 1)
wday(d2, label = FALSE, week_start = 1)

view(flights)

flights_dt <- flights %>% 
  filter(!is.na(dep_time), !is.na(arr_time)) %>% 
  mutate(
    dep_time = make_datetime_100(year, month, day, dep_time),
    arr_time = make_datetime_100(year, month, day, arr_time), 
    sched_dep_time = make_datetime_100(year, month, day, sched_dep_time), 
    sched_arr_time = make_datetime_100(year, month, day, sched_arr_time)) %>% 
  select(origin,dest, ends_with("delay"), ends_with("time"))

glimpse(flights_dt)
rounded_flights_dt <- flights_dt %>% count(week = floor_date(dep_time, "week"))

view(rounded_flights_dt)


view(flights_dt
     )





select(flights, air_time, arr_time, dep_time, everything())

flights_airtime <- mutate(flights, 
                          arr_time = (arr_time %/% 100 * 
                                        
                                        60 + arr_time %% 100) %% 1440, 
                          dep_time = (dep_time %/% 100 * 60 + dep_time) %% 1440, 
                          air_time_diff = air_time - arr_time + dep_time)


flights_dt_update <- flights_dt %>%  
  mutate(dep_hour = update(dep_time, yday = 1))

flights_dt %>%  
  mutate(dep_hour = update(dep_time, yday = 1)) %>%  
  ggplot(aes(dep_hour)) +
  geom_freqpoly(binwidth = 300)

tomorrow <- today() + dhours(48)

tomorrow <- today() + days(1)

tomorrow

flights_dt %>%  
  filter(arr_time < dep_time)

flights_dt_overnight <-  flights_dt %>%
  mutate(overnight = arr_time < dep_time, 
          arr_time = arr_time + days(overnight * 1), 
          sched_arr_time = sched_arr_time + days(overnight * 1))
  
next_year <- today() + years(1)

(today() %--% next_year) / ddays(1)



make_datetime_100 <- function(year, month, day, time) {
  make_datetime(year, month, day, time %/% 100, time %% 100)
}

# Delete below
flights_airtime

nrow(filter(flights_airtime, air_time_diff !=0))

ggplot(flights_airtime, aes(x = air_time_diff)) +
         geom_histogram(binwidth = 1)





filter(flights, desc(dep_delay))

min_rank(flight, dep_delay)

nrow(flights)

ncol(flights)

view(flights)

summary(flights)

View(flights$carrier)

glimpse(flights$carrier)

count(flights, carrier)

flights %>% 
  count(carrier, dep_delay) %>%  
  ggplot(aes(x = carrier, y = dep_delay)) +
  geom_tile(mapping = aes(fill = n))

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class))

mpg

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(aes(colour = drv))

ggplot(mpg, aes(x = displ, y = hwy), color = drv) +
  geom_point( size = 4, color = "white")

diamonds

ggplot(data = diamonds) + 
  geom_bar(aes(x = cut, y = ..prop.., fill = color, group = 1))

ggplot(data = diamonds) + 
  geom_bar(aes(x = cut, y = ..count.. / sum(..count..), fill = color))

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) +
  geom_point(position = "jitter")

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

ggplot(mpg, aes(x = factor(1), fill = drv)) +
  geom_bar() +
  coord_polar(theta = "y")

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) +
  geom_boxplot() +
  coord_flip() +
  labs(y = "Highway MPG",
       x = "Class",
       title = "Highway MPG by car class",
       subtitle = "1999-2008",
       caption = "Source: http://fueleconomy.gov")

log(10, base = 10)

log(100)

house_prices <- c(100000, 150000, 250000, 500000) # An example vector of house prices
log_house_prices <- log(house_prices)
print(log_house_prices)


log10(0)

log10(10)


not_cancelled %>% 
  group_by(year, month, day) %>% 
  summarise(
    avg_delay1 = mean(arr_delay),
    avg_delay2 = mean(arr_delay[arr_delay > 0]) # the average positive delay
  )

library(nycflights13)

view(flights)

daily <- group_by(flights, year, month, day)

per_day   <- summarise(daily, flights = n())

per_month <- summarise(per_day, flights = sum(flights))

per_year  <- summarise(per_month, flights = sum(flights))

daily %>% 
  ungroup() %>%             # no longer grouped by date
  summarise(flights = n())  # all flights



test <- flights %>% 
  group_by(year, month, day) %>%
  filter(rank(desc(arr_delay)) < 10)


popular_dests <- flights %>% 
  group_by(dest) %>% 
  filter(n() > 365)


pop <- popular_dests %>% 
  filter(arr_delay > 0) %>% 
  mutate(prop_delay = arr_delay / sum(arr_delay)) %>% 
  select(year:day, dest, arr_delay, prop_delay)

smaller <- diamonds %>% 
  filter(carat < 3)

ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.1)))



ggplot(data = smaller, mapping = aes(x = carat, y = price)) + 
  geom_boxplot()

getwd()

# Get today's date in yyyymmdd format
prefix_date <- format(Sys.Date(), "%Y%m%d")

# Generate the hex plot and save as PDF with the date-prefixed filename
ggplot(diamonds, aes(carat, price)) +
  geom_hex()
ggsave(paste0(prefix_date, "_diamonds.pdf"))

# Save the diamonds dataset as a CSV file with the date-prefixed filename
write_csv(diamonds, paste0(prefix_date, "_diamonds.csv"))



tribble(
  ~x, ~y, ~z,
  "a", 2, 3.6,
  "b", 1, 8.5
)

nycflights13::flights %>% 
  print(n = 10, width = Inf)



df <- tibble(
  x = runif(5),
  y = rnorm(5)
)

# Extract by name
df$x
#> [1] 0.73296674 0.23436542 0.66035540 0.03285612 0.46049161
df[["x"]]
#> [1] 0.73296674 0.23436542 0.66035540 0.03285612 0.46049161

# Extract by position
df[[1]]
#> [1] 0.73296674 0.23436542 0.66035540 0.03285612 0.46049161

df %>% 
  ggplot(aes(x = x)) +
  

str(parse_logical(c("TRUE", "FALSE", "NA")))

str(parse_integer(c("1", "2", "3")))

str(parse_date(c("2010-01-01", "1979-10-14", "TRUE")))
 
parse_integer(c("1", "231", ".", "456"), na = ".")
#> [1]   1 231  NA 456


parse_double("1.23")
#> [1] 1.23
parse_double("1,23", locale = locale(decimal_mark = ","))
#> [1] 1.23


fruit <- c("apple", "banana")
parse_factor(c("apple", "banana", "bananana"), levels = fruit)



parse_datetime("2010-10-01T2010")


parse_date("20101001")
#> [1] "2010-10-01"

parse_date("01/02/15", "%m/%d/%y")


#> [1] "2015-01-02"
parse_date("01/02/15", "%d/%m/%y")
#> [1] "2015-02-01"
parse_date("01/02/15", "%y/%m/%d")
 #> [1] "2001-02-15"


guess_parser("2010-10-01")
#> [1] "date"
guess_parser("15:01")
#> [1] "time"
guess_parser(c("TRUE", "FALSE"))
#> [1] "logical"
guess_parser(c("1", "5", "9"))
#> [1] "double"
guess_parser(c("12,352,561"))
#> [1] "number"

str(parse_guess("2010-10-10"))
#>  Date[1:1], format: "2010-10-10"


my_variable <- c(TRUE, FALSE, TRUE)

# Check if all elements in the variable are logical
all_logical <- all(sapply(my_variable, is.logical))

# Print the result
all_logical

problems(my_variable)

table1

table1 %>% 
  count(year, wt = cases)

table4a

table4a %>% 
  pivot_longer(
    cols = c(`1999`, `2000`), 
    names_to = "year", 
    values_to = "cases"
  )

tidy4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")

tidy4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
left_join(tidy4a, tidy4b)

view(tidy4b)

table2

table2 %>%
  pivot_wider(names_from = type, values_from = count)

sep_table3 <- table3 %>% 
  separate(
    rate, into = c("cases", "population"), sep = "/"
  )

view(sep_table3)
 

table5

table5 %>% 
  unite(new, century, year, sep = "")

stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)

view(stocks)

stocks %>% 
  pivot_wider(names_from = year, values_from = return)

stocks %>% 
  pivot_wider(names_from = year, values_from = return) %>% 
  pivot_longer(
    cols = c(`2015`, `2016`), 
    names_to = "year", 
    values_to = "return", 
    values_drop_na = TRUE
  )


stocks_complete <- stocks %>% 
  complete(year, qtr)
view(stocks_complete)


treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)

who_rfds

who1 <- who %>% 
  pivot_longer(
    cols = new_sp_m014:newrel_f65, 
    names_to = "key", 
    values_to = "cases", 
    values_drop_na = TRUE
  )

who1

planes %>% 
  count(tailnum) %>% 
  filter(n > 1)

airlines

flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)

flights2 %>%
  select(-origin, -dest) %>% 
  left_join(airlines, by = "carrier")


x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)

x %>% 
  inner_join(y, by = "key")

x %>% 
  full_join(y, by = "key")


x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  1, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2"
)

test <- left_join(x, y, by = "key")

library(nycflights13)

weather
flights

flights2 %>% left_join(weather)

flights2


top_dest <- flights %>%
  count(dest, sort = TRUE) %>%
  head(10)

top_dest

flights %>% 
  filter(dest %in% top_dest$dest)


flights %>%
  anti_join(planes, by = "tailnum") %>%
  count(tailnum, sort = TRUE)


df1 <- tribble(
  ~x, ~y,
  1,  1,
  2,  1
)
df2 <- tribble(
  ~x, ~y,
  1,  1,
  1,  2
)

intersect(df1, df2)

union(df1, df2)

setdiff(df1, df2)

x <- c("abc", NA)

str_c("|-", x, "-|")

x <- c("Apple", "Banana", "Pear")

str_to_lower(x)

x <- c("apple", "banana", "pear")

str_view(x, "an")

str_view(x, ".a.")


dot <- as.data.frame(x = c(".", "a", "b", "c"), 
                     y = c(1, 2, 3, 4))
view(dot)

writeLines(dot$x)

str_view(c("abc", "a.c", "a*c", "a c"), "a[.]c")


x <- "a\\b"

str_view(x, "\\\\")


x <- "1888 is the longest year in Roman numerals: MDCCCLXXXVIII"
str_view(x, "CC?")
#> [1] │ 1888 is the longest year in Roman numerals: MD<CC><C>LXXXVIII

str_view(x, "CC+")
#> [1] │ 1888 is the longest year in Roman numerals: MD<CCC>LXXXVIII
str_view(x, 'C[LX]+')
#> [1] │ 1888 is the longest year in Roman numerals: MDCC<CLXXX>VIII

view(words)

df <- tibble(
  word = words, 
  i = seq_along(word)
)

df %>% 
  filter(str_count(word, "x$"))

df %>% 
  mutate(
    vowels = str_count(word, "[aeiou]"),
    consonants = str_count(word, "[^aeiou]")
  )

colours <- c("red", "orange", "yellow", "green", "blue", "purple")
colour_match <- str_c(colours, collapse = "|")
colour_match

has_colour <- str_subset(sentences, colour_match)
matches <- str_extract(has_colour, colour_match)
head(matches)


x <- c("apple", "pear", "banana")

str_replace(x, "[aeiou]", "-")

str_replace_all(x, "[aeiou]", "-")


x <- c("1 house", "2 cars", "3 people")

str_replace_all(x, c("1" = "one", "2" = "two", "3" = "three"))


sentences %>%
  head(5) %>% 
  str_split(" ")

view(fruit)

str_view(fruit, "nana")

x <- "Line 1\nLine 2\nLine 3"
str_extract_all(x, "^Line")[[1]]


# Factors 

x1 <- c("Dec", "Apr", "Jan", "Mar")

x2 <- c("Dec", "Apr", "Jam", "Mar")

month_levels <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun", 
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)

y1 <- factor(x1, levels = month_levels)

y1 

<<<<<<< HEAD
gss_cat %>%
  ggplot(aes(race)) +
  geom_bar() +
  scale_x_discrete(drop = FALSE)

relig_summary <- gss_cat %>% 
  group_by(relig) %>% 
  summarise(
    age = mean(age, na.rm = TRUE), 
    tvhours = mean(tvhours, na.rm = TRUE), 
    n = n()
  )

relig_summary %>% 
  ggplot(aes(x = tvhours, y = relig)) + 
  geom_point()



view(gss_cat)

relig_summary %>% 
  ggplot(aes(tvhours, fct_reorder(relig, tvhours))) +
  geom_point()

relig_summary %>%
  mutate(tvhours = factor(tvhours, levels = sort(unique(tvhours)))) %>%
  ggplot(aes(x = tvhours, y = relig)) +
  geom_point()

relig_summary %>%
  mutate(relig = fct_reorder(relig, tvhours)) %>%
  ggplot(aes(tvhours, relig)) +
  geom_point()


rincome_summary <- gss_cat %>% 
  group_by(rincome) %>% 
  summarise(
    age = mean(age , na.rm = TRUE),
    tv_hours = mean(tvhours, na.rm = TRUE), 
    n = n()
  )

rincome_summary %>% 
  ggplot(aes(age, fct_reorder(rincome, age))) +
  geom_point()

rincome_summary %>% 
  ggplot(aes(age, rincome)) +
  geom_point()


rincome_summary %>%
  ggplot(aes(age, fct_relevel(rincome, "Not applicable"))) + 
  geom_point()

by_age <- gss_cat %>% 
  filter(!is.na(age)) %>% 
  count(age, marital) %>% 
  group_by(age) %>% 
  mutate(prop = n / sum(n))

by_age %>% 
  ggplot(aes(age, prop, color = marital)) +
  geom_line(na.rm = TRUE)


by_age %>% 
  ggplot(aes(age, prop, color = fct_reorder2(marital, age, prop))) +
  geom_line() +
  labs(color = "marital")

# functions

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

df$a <- (df$a - min(df$a, na.rm = TRUE)) / 
  (max(df$a, na.rm = TRUE) - min(df$a, na.rm = TRUE))

df$a_percentile <- rank(df$a, na.last = "keep") / sum(!is.na(df$a))


df$b <- (df$b - min(df$b, na.rm = TRUE)) / 
  (max(df$b, na.rm = TRUE) - min(df$a, na.rm = TRUE))
df$c <- (df$c - min(df$c, na.rm = TRUE)) / 
  (max(df$c, na.rm = TRUE) - min(df$c, na.rm = TRUE))
df$d <- (df$d - min(df$d, na.rm = TRUE)) / 
  (max(df$d, na.rm = TRUE) - min(df$d, na.rm = TRUE))

x <- df$a

(x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))

rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}
rescale01(c(0, 5, 10))

rng <- range(x, na.rm = TRUE)

rng

df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)

df

stats <- function(x, na.rm = TRUE) {
  mean <- (is.na(x))
  sum <- sum(x, na.rm = TRUE)
  sd <- (x, na.rm = TRUE)
  cv <- sd/mean
}



cv <- function(x, na.rm = TRUE) {
  mu <- mean(x, na.rm = na.rm)
  sigma <- sd(x, na.rm = na.rm)
  if (mu == 0) return(NA_real_)
  sigma / mu
}


variance <- function(x, na.rm = TRUE) {
  n <- length(x)
  m <- mean(x, na.rm = TRUE)
  sq_err <- (x - m)^2
  sum(sq_err)/(n - 1)
}

my_var <- function(x) {
  n <- length(x)
  x_bar <- sum(x) / n
  sum((x - x_bar)^2) / (n - 1)
}

var(1:10)

variance()

x <- c(3, 7, 9, 15, 21)

variance(x)
var(x)


library(stats)

help(package = stats)


both_na <- function(x, y) {
  x_count <- sum(is.na(x))
  y_count <- sum(is.na(y))
  sum_count <- x_count + y_count
  return(sum_count)
}


both_na <- function(x, y) {
  sum(is.na(x) & is.na(y))
}

x <- c(1, NA, 3, NA, 5)
y <- c(NA, NA, 3, NA, NA)

both_na(x, y)


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


