library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))

heroes_nested <- heroes %>%
  nest(data = !Gender)

heroes %>%
  group_by(Gender) %>%
  nest()

heroes_nested %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest(dim)

heroes_nested %>%
  mutate(dim = map(data, dim)) %>%
  select(!data) %>%
  unnest_wider(dim, names_sep = "_")

films <- tribble(
  ~film, ~genre,
  "Большая перемена", "комедия, драма",
  "Смешарики", "анимация, комедия, детский",
  "Наша Раша: яйца судьбы", "комедия",
  "Начало", "sci-fi, триллер",
  "Солнцестояние", "ужасы, исторический, мюзикл"
)

films %>%
  filter(str_detect(genre, "комедия"))

str_split(films$genre, pattern = ", ")

films %>%
  mutate(genre = str_split(genre, pattern = ", ")) %>%
  unnest(genre) %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genre, values_from = value, values_fill = FALSE)

films %>%
  separate_rows(genre, sep = ", ") %>%
  mutate(value = TRUE) %>%
  pivot_wider(names_from = genre, values_from = value, values_fill = FALSE)

# Описательная статистика -------------------------------------------------

weight <- heroes %>%
  drop_na(Weight) %>%
  pull(Weight)

mean(weight)
mean(c(weight, 100500))
median(weight)
median(c(weight, 100500))
sort(weight)

?mean
mean(weight, trim = 0.1)
mean(c(weight, 100500), trim = 0.1)
mean(weight, trim = 0.5)

diff(range(weight))

median(abs(weight - median(weight))) * 1.4826
mad(weight)
options(scipen = 999)
sum((weight - mean(weight)) ^ 2)/(length(weight) - 1)
var(weight)

sqrt(sum((weight - mean(weight)) ^ 2)/(length(weight) - 1))
sd(weight)
IQR(weight)
sd(c(weight, 100500))
IQR(c(weight, 100500))

install.packages("psych")
psych::skew(weight)
psych::kurtosi(weight)

summary(weight)
summary(heroes)

psych::describe(weight)

heroes %>%
  group_by(Gender, Alignment) %>%
  summarise(psych::describe(Weight))

install.packages("skimr")
skimr::skim(weight)

heroes %>%
  group_by(Gender) %>%
  skimr::skim(Height, Weight)

xxx <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/d.csv")

psych::skew(xxx$x)
psych::skew(xxx$y)

mean(xxx$x)
mean(xxx$y)
median(xxx$x)
median(xxx$y)
diff(range(xxx$x))
diff(range(xxx$y))
var(xxx$x)
var(xxx$y)
sd(xxx$x)
sd(xxx$y)
psych::kurtosi(xxx$x)
psych::kurtosi(xxx$y)
table(xxx$x)
xxx %>%
  count(x, sort = TRUE)

xxx %>%
  count(y, sort = TRUE)

xxx %>%
  skimr::skim()

psych::describe(xxx)

plot(xxx)


# Визуализация данных в базовом К -----------------------------------------


class(xxx)

plot(weight)
iris %>%
  select(!Species) %>%
  plot()

hist(weight)
hist(weight, breaks = 30)
hist(weight, breaks = 100)
