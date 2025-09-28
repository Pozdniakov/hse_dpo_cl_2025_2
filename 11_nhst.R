library(tidyverse)
heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))
weight_publisher <- heroes %>% 
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  select(Height, Publisher) %>%
  drop_na()

weight_publisher
weight_publisher %>%
  group_by(Publisher) %>%
  summarise(mean(Height))

t.test(weight_publisher$Height ~ weight_publisher$Publisher)

many_means <- replicate(1000000, mean(rnorm(100, mean = 100, sd = 15)))
mean(many_means)
sd(many_means)
hist(many_means)

hist(rlnorm(10000), breaks = 1000)
many_means_log <- replicate(1000000, mean(rlnorm(100)))
hist(many_means_log, breaks = 100)


# Confidence interval ----------------------------------------------------

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
m <- mean(samp)
sd(samp)
se <- sd(samp)/sqrt(length(samp))
m - se * qnorm(0.975)
m + se * qnorm(0.975)


# NHST --------------------------------------------------------------------

z_emp <- (mean(samp) - 100)/(15/sqrt(length(samp)))
z_emp

(1 - pnorm(z_emp)) * 2

z_emp <- (mean(samp) - 95)/(15/sqrt(length(samp)))
z_emp

(1 - pnorm(z_emp)) * 2

t_emp <- (mean(samp) - 100)/(sd(samp)/sqrt(length(samp)))
t_emp
(1 - pt(t_emp, df = length(samp) - 1)) * 2
t.test(samp, mu = 100)

diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
diet1 <- diet %>%
  filter(Diet == 1)
options(scipen = 999)
t.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

t.test(heroes$Weight, mu = 100)
t.test(heroes$Height, mu = 185)
