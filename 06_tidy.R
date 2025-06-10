library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/refs/heads/master/data/heroes_information.csv",
                   na = c("", "NA", "-", "-99"))
class(heroes)
heroes

# Работа с колонками ------------------------------------------------------

heroes %>%
  select(2, 4, 8)

heroes_selected_columns <- heroes %>%
  select(name, Race, `Hair color`)

heroes_selected_columns

heroes %>%
  select(name:Publisher)

heroes %>%
  select(name:`Eye color`, Publisher:Weight)

heroes %>%
  select(!...1)

heroes %>%
  select(!Gender:Height)

heroes %>%
  select(name:last_col())

heroes %>%
  select(everything())

heroes %>%
  select(name, Publisher, everything())

heroes %>%
  select(ends_with("color"))

heroes %>%
  select(starts_with("H"))

heroes %>%
  select(starts_with("H") & ends_with("color"))

heroes %>%
  select(starts_with("H") | ends_with("color"))

heroes %>%
  select(contains("eigh"))

heroes %>%
  select(matches("[HW]eight"))

heroes %>%
  select(where(is.numeric))

heroes %>%
  select(where(is.character))

heroes %>%
  select(where(function(x) !any(is.na(x)) ))

heroes %>%
  select(where(function(x) mean(is.na(x)) < 0.3 ))

is.character(heroes$Weight)

heroes %>%
  select(id = ...1)

heroes %>%
  rename(id = ...1)

#names(heroes) <- str_to_lower(names(heroes))
str_to_upper(names(heroes))
make.names(names(heroes))

heroes %>%
  rename_with(make.names)

heroes %>% 
  rename_with(str_to_upper) %>% 
  rename_with(make.names)

#rename_with(rename_with(heroes, str_to_upper), make.names)

heroes %>%
  relocate(Universe = Publisher)

heroes %>%
  relocate(Publisher, .after = name)

heroes %>%
  relocate(Publisher, .before = Race)
heroes %>%
  relocate(Universe = Publisher, where(is.numeric), ends_with("color"),
           .after = name)

heroes %>%
  select(name) %>%
  pull()

heroes %>%
  pull(name)
heroes %>%
  pull(Weight, name)


powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")


# Работа со строками ------------------------------------------------------

heroes %>%
  slice(1, 100, 300)

heroes %>%
  slice(1:5)

heroes %>%
  filter(Publisher == "DC Comics")

heroes %>%
  filter(Height <= 100)

heroes %>%
  filter(Height <= 100 | Height >= 300)

heroes %>%
  filter(Height <= 100, Publisher == "DC Comics")

heroes %>%
  filter(Height <= 100 & Publisher == "DC Comics")
heroes %>%
  filter(Height <= 100) %>%
  filter(Publisher == "DC Comics")

heroes %>%
  drop_na()

heroes %>%
  drop_na(Height, Weight)

heroes %>%
  drop_na(ends_with("color"))


# Сортировка строк --------------------------------------------------------

heroes %>%
  arrange(Height)

heroes %>%
  arrange(desc(Height))

heroes %>%
  arrange(desc(`Eye color`), Height)

heroes %>%
  select(name, Publisher, Weight) %>%
  arrange(Weight)

# Создание колонок --------------------------------------------------------

#heroes$imt <- heroes$Weight/(heroes$Height/100)^2

heroes %>%
  mutate(imt = Weight/(Height/100)^2, .after = Height)

n <- -2:2
n
# if (n > 0) {
#   "Positive number"
# } else if (n == 0) {
#   "Zero"
# } else {
#   "Negative number"
# }

if_else(n > 0, "Positive number", "Negative number or zero")
if_else(n > 0, 
        "Positive number", 
        if_else(n < 0, "Negative number", "Zero"))

case_when(n > 0 ~ "Positive number", #if
          n < 0 ~ "Negative number", #else if
          .default = "Zero") #else

heroes %>%
  mutate(imt = Weight/(Height/100)^2, 
         imt_group = case_when(is.na(imt) ~ NA_character_, #if
                               imt > 30 ~ "Very overweight", #else if
                               imt > 25 ~ "Overweight", #else if
                               imt < 16 ~ "Underweight", #else if
                               .default = "Normal Weight"), #else
         .after = Height)

heroes %>%
  transmute(imt = Weight/(Height/100)^2, 
         imt_group = case_when(is.na(imt) ~ NA_character_, #if
                               imt > 30 ~ "Very overweight", #else if
                               imt > 25 ~ "Overweight", #else if
                               imt < 16 ~ "Underweight", #else if
                               .default = "Normal Weight") #else
         ) 

heroes %>%
  mutate(mean_weight = mean(Weight, na.rm = TRUE))

heroes %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            min_weight = min(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE))
range(1:10)

heroes %>%
  reframe(range(Weight, na.rm = TRUE))

heroes %>%
  group_by(Gender)

heroes %>%
  group_by(Gender, Alignment) %>%
  summarise(mean_weight = mean(Weight, na.rm = TRUE),
            min_weight = min(Weight, na.rm = TRUE),
            max_weight = max(Weight, na.rm = TRUE))

heroes %>%
  summarise(mean(Weight, na.rm = TRUE), .by = Gender)

heroes %>%
  group_by(Gender) %>%
  summarise(n = n())

heroes %>%
  count(Gender)

heroes %>%
  count(Race, sort = TRUE) %>% View()

heroes %>%
  group_by(Race) %>%
  filter(n() >= 10)

heroes %>%
  group_by(Race) %>%
  filter(n() == 1)

heroes %>%
  group_by(Gender) %>%
  mutate(mean_weight_by_gender = mean(Weight, na.rm = TRUE)) %>%
  ungroup() %>%
  select(name, Gender, Weight, mean_weight_by_gender) %>%
  mutate(weight_gender_diff = Weight - mean_weight_by_gender)
  
