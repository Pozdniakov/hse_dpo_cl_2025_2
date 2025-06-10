install.packages("tidyverse")
library(tidyverse)
read_csv("heroes_information.csv")
getwd()

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("", "NA", "-", "-99"))


# data.table example ------------------------------------------------------

install.packages("data.table")
library(data.table)

heroes_dt <- fread("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
      na = c("", "NA", "-", "-99"))

class(heroes_dt)
methods(print)
heroes_dt[Alignment == "good",
          .(mean_height = mean(Height, na.rm = TRUE)),
          by = Gender][order(-mean_height),]


# tidyverse example -------------------------------------------------------
library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("", "NA", "-", "-99"))
class(heroes)
heroes %>%
  filter(Alignment == "good") %>%
  group_by(Gender) %>%
  summarise(height_mean = mean(Height, na.rm = TRUE)) %>%
  arrange(desc(height_mean))

sum(log(abs(sin(1:22))))
1:22 %>% 
  sin() %>% 
  abs() %>% 
  log(x = 2, base = .) %>% 
  sum()
# magrittr

1:22 |>
  sin() |>
  abs() |>
  log(x = 2, base = _) |>
  sum()
2 %>%
 c("Корень из", ., "равен", sqrt(.))

B <- matrix(10:39, nrow = 5)
B
rowSums(B)
rowMeans(B)
colSums(B)
colMeans(B)

apply(B, 1, mean)
lapply(heroes, typeof)
sum(is.na(n))
na_n <- function(x) {
  sum(is.na(x))
}
na_n(n)
na_n(heroes$`Skin color`)
na_n(heroes$Publisher)
lapply(heroes, na_n)
map(heroes, na_n)
lapply(heroes, function(x) sum(is.na(x)) )
map(heroes, function(x) sum(is.na(x)) )

map_chr(heroes, na_n)
heroes %>%
  map(na_n)

B <- matrix(10:39, nrow = 5)
apply(B, 1, mean)
apply(B, 2, mean)
10:39 %>%
  matrix(nrow = 5) %>%
  apply(1, mean)

