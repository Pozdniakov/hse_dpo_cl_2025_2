library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))

pub_good <- heroes %>%
  filter(Alignment %in% c("good", "bad")) %>%
  select(Alignment, Gender) %>%
  drop_na()

pub_good
summary(table(pub_good))
chisq.test(table(pub_good))
fisher.test(table(pub_good))
mosaicplot(table(pub_good), shade = TRUE, color = TRUE)

install.packages("Stat2Data")
library(Stat2Data)
data(Backpack)

back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.45359237,
         body_kg = BodyWeight * 0.45359237)

back %>% 
  select(body_kg, backpack_kg) %>%
  cov()

back %>% 
  select(body_kg, backpack_kg) %>%
  var()

back$body_kg - mean(back$body_kg)

back %>% 
  select(BodyWeight, BackpackWeight) %>%
  cov()

back %>% 
  select(body_kg, backpack_kg) %>%
  cor()

cor.test(back$body_kg, back$backpack_kg)

cor.test(back$body_kg, back$BodyWeight)
cor.test(back$body_kg, back$backpack_kg, method = "spearman")
cor.test(back$body_kg, back$backpack_kg, method = "kendall")

cor.test(back$BodyWeight, back$BackpackWeight)

heroes %>%
  select(Weight, Height) %>%
  cor(use = "complete.obs")

cor.test(heroes$Weight, heroes$Height)
cor.test(heroes$Weight, heroes$Height, method = "spearman")
cor.test(heroes$Weight, heroes$Height, method = "kendall")
plot(heroes$Weight, heroes$Height)

heroes %>%
  filter(Height > 600)

heroes_clean <- heroes %>%
  mutate(Weight = if_else(Height > 600, NA_real_, Weight)) 
plot(heroes_clean$Weight, heroes_clean$Height)
cor.test(heroes_clean$Weight, heroes_clean$Height, method = "kendall")

t.test(back$backpack_kg ~ back$BackProblems, var.equal = TRUE)
cor.test(back$BackProblems, back$backpack_kg)

back %>%
  select(Units, Year, backpack_kg, body_kg) %>%
  cor()

back %>%
  select(Units, Year, backpack_kg, body_kg) %>%
  psych::corr.test()

#install.packages("psych")

as.data.frame(matrix(rnorm(20 * 100), nrow = 100)) %>%
  psych::corr.test(adjust = "bonferroni")

(20^2 - 20)/2 * 0.05

back %>%
  select(Units, Year, backpack_kg, body_kg) %>%
  psych::corr.test(adjust = "bonferroni")

back %>%
  select(Units, Year, backpack_kg, body_kg) %>%
  psych::corr.test()

back %>%
  select(Units, Year, backpack_kg, body_kg) %>%
  psych::corr.test(adjust = "BH")

install.packages("corrplot")
library(corrplot)
corrplot(cor(mtcars), method = "color", order = "hclust")
