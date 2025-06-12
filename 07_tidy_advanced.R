
# Соединение датафреймов --------------------------------------------------



library(tidyverse)
#cbind(), rbind(), merge()
band_members
band_instruments

bind_rows(band_members, band_instruments)
list_of_tibbles <- list(band = band_members, instruments = band_instruments)
bind_rows(list_of_tibbles, .id = "from_tibble")

bind_cols(list_of_tibbles)

left_join(band_members, band_instruments)
names(band_members)
names(band_instruments)
intersect(names(band_members), names(band_instruments))
left_join(band_members, band_instruments, by = c("name"))
band_instruments2
left_join(band_members, band_instruments2, by = c("name" = "artist"))
band_members %>%
  left_join(band_instruments)

band_members %>%
  right_join(band_instruments)
band_instruments %>%
  left_join(band_members)

band_members %>%
  full_join(band_instruments)

band_members %>%
  inner_join(band_instruments)

# band_members %>%
#   filter(name %in% band_instruments$name)

band_members %>%
  semi_join(band_instruments)

band_instruments %>%
  semi_join(band_members)


band_members %>%
  filter(!name %in% band_instruments$name)

band_members %>%
  anti_join(band_instruments)

band_instruments %>%
  anti_join(band_members)

library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))
powers <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/super_hero_powers.csv")

heroes %>%
  pull(`Eye color`)



heroes %>%
  semi_join(powers %>% filter(`Web Creation`), by = c("name" = "hero_names"))

heroes %>%
  anti_join(powers, by = c("name" = "hero_names")) %>%
  pull(name)


# Широкие и длинные данные ------------------------------------------------

new_diet <- tibble(
  student = c("Маша", "Рома", "Антонина"),
  before_r_course = c(70, 80, 86),
  after_r_course = c(63, 74, 71)
)
new_diet %>%
  pivot_longer(cols = before_r_course:after_r_course,
               names_to = "time", values_to = "weight") %>%
  pivot_wider(names_from = "time", values_from = "weight")

heroes %>%
  drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(mean_height = mean(Height),
            mean_weight = mean(Weight))

heroes %>%
  drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), mean))

heroes %>%
  # drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), mean, na.rm = TRUE))

heroes %>%
  # drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(across(c(Height, Weight), function(x) mean(x, na.rm = TRUE)))

heroes %>%
  # drop_na(Weight, Height) %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric), function(x) mean(x, na.rm = TRUE)))

heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.character), 
                   function(x) mean(nchar(x), na.rm = TRUE)))

heroes %>%
  group_by(Gender) %>%
  summarise(across(where(is.numeric), function(x) mean(x, na.rm = TRUE)),
            across(where(is.character), 
                   function(x) mean(nchar(x), na.rm = TRUE)))


nchar(c("Welcome", "to", "vector", "Neo!"))

heroes %>%
  drop_na(Height, Weight) %>%
  group_by(Gender, Alignment) %>%
  summarise(across(c(Height, Weight), list(minumum = min,
                                           average = mean,
                                           maximum = max)))

heroes %>%
  mutate(across(where(is.character), as.factor))

heroes %>%
  mutate(across(where(is.numeric), as.character))

iris %>%
  mutate(across(where(is.numeric), function(x) x/max(x) * 100 ))
