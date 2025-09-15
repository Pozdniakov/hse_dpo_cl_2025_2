library(tidyverse)
penguins <- read_csv("https://raw.githubusercontent.com/Pozdniakov/repo_for_sharing_data/refs/heads/main/penguins_clean.csv")
penguins
boxplot(body_mass_g ~ species, data = penguins)

gg <- ggplot()

# penguins %>%
#   select(bill_length_mm:body_mass_g) %>%
#   plot()
gg <- ggplot() +
  geom_point(data = penguins, 
             aes(x = bill_length_mm, 
                 y = bill_depth_mm), 
             colour = "#40AA70",
             size = 5,
             alpha = 0.8, 
             shape = "🐧")

ggsave("penguins.png", scale = 2.3)

penguins %>%
  ggplot(aes(x = bill_length_mm, 
                     y = bill_depth_mm)) +
  geom_point(size = 4,
             alpha = 0.8, aes(colour = body_mass_g)) +
  geom_smooth(method = "lm", colour = "#602999") +
  #scale_y_log10() +
  scale_colour_viridis_c(option = "C") +
  facet_wrap(sex ~ species,scales = "free") +
  guides(colour = "none") +
  labs(title = "Penguins' bills") +
  hrbrthemes::theme_ipsum()

penguins_species <- penguins %>%
  count(species)

ggplot() +
  geom_col(data = penguins_species, aes(x = species, y = n, fill = species)) +
  coord_flip() +
  ggsci::scale_fill_aaas() +
  hrbrthemes::theme_ipsum()

  ggplot() +
  geom_bar(data = penguins, aes(x = species, fill = sex),
           position = "dodge") +
  theme_minimal()

ggplot() +
  geom_bar(data = penguins, aes(x = "", fill = species)) +
  coord_polar(theta = "y") +
  theme_void()

ggplot() +
  geom_boxplot(data = penguins, aes(x = species, y = body_mass_g))

ggplot() + 
  geom_density(data = penguins, aes(x = body_mass_g, fill = species),
                 alpha = 0.4, position = "identity", adjust = 0.4)

ggplot() +
  geom_point(data = penguins, aes(x = species, y = body_mass_g),
             alpha = .5, position = position_jitter(width = .2, height = 0))

penguins %>%
  ggplot(aes(x = species, y = body_mass_g)) +
  geom_violin(aes(fill = species), adjust = .5) +
  geom_point(alpha = .5, position = position_jitter(width = .2, height = 0)) +
  geom_boxplot(alpha = .75, width = .2, outlier.shape = NA) +
  scale_fill_brewer(palette = "Set1") +
  facet_wrap(~sex) +
  labs(title = "Penguins weight distribution",
       subtitle = "Gentoo are heavier (both male and female)",
       caption = "НИУ ВШЭ, 2025",
       x = "Penguins species",
       y = "Body mass, g",
       fill = "Species") +
  hrbrthemes::theme_ipsum()
  


# "https://raw.githubusercontent.com/Pozdniakov/repo_for_sharing_data/refs/heads/main/penguins_clean.csv" %>%
#   read_csv() %>%
#   filter(year == 2007) %>%
#   ggplot() +
#   geom_point(aes(x = bill_length_mm, y = bill_depth_mm))
