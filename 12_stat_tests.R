library(tidyverse)
diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")
diet2 <- diet %>%
  filter(Diet == 2)
options(scipen = 999)
t.test(diet2$weight6weeks, diet2$pre.weight, paired = TRUE)

t.test(diet2$weight6weeks - diet2$pre.weight, mu = 0)
diet3 <- diet %>%
  filter(Diet == 3)

t.test(diet3$weight6weeks, diet3$pre.weight, paired = TRUE)

diet %>%
  group_by(Diet) %>%
  summarise(mean(pre.weight),mean(weight6weeks))

install.packages("apa")
library(apa)
t_apa(t.test(diet3$weight6weeks, diet3$pre.weight, paired = TRUE), format = "docx")


diet12 <- diet %>%
  filter(Diet %in% 1:2)
t.test(weight6weeks ~ Diet, data = diet12)
t.test(weight6weeks ~ Diet, data = diet12, var.equal = TRUE)

diet %>%
  group_by(Diet) %>%
  summarise(m = mean(weight6weeks), sd = sd(weight6weeks))

1:2
c(1,3)

diet23 <- diet %>%
  filter(Diet %in% 2:3)
t.test(weight6weeks ~ Diet, data = diet23)

diet13 <- diet %>%
  filter(Diet %in% c(1,3))

t.test(weight6weeks ~ Diet, data = diet13)

heroes <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/heroes_information.csv",
                   na = c("-", "-99", "NA", " "))
heroes_white_black <- heroes %>%
  filter(`Eye color` %in% c("black", "white")) %>%
  drop_na(Weight) %>%
  select(`Eye color`, Weight)

t.test(Weight ~ `Eye color`, data = heroes_white_black)

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
shapiro.test(samp)
hist(samp)

shapiro.test(diet2$weight6weeks)
hist(diet2$weight6weeks)
hist(rnorm(length(diet2$weight6weeks)))
qqnorm(diet2$weight6weeks)
qqnorm(rnorm(length(diet2$weight6weeks)))

diet1 <- diet %>%
  filter(Diet == 1)
t.test(diet1$weight6weeks, diet1$pre.weight, paired = TRUE)
wilcox.test(diet1$pre.weight, diet1$weight6weeks, paired = TRUE)

t.test(weight6weeks ~ Diet, data = diet12)
wilcox.test(weight6weeks ~ Diet, data = diet12)

t.test(weight6weeks ~ Diet, data = diet23)
wilcox.test(weight6weeks ~ Diet, data = diet23)

wilcox.test(diet2$weight6weeks, diet2$pre.weight, paired = TRUE)

gender_publisher <- heroes %>%
  select(Gender, Publisher) %>%
  filter(Publisher %in% c("Marvel Comics", "DC Comics")) %>%
  drop_na()

gender_publisher %>%
  count(Gender, Publisher)

table(heroes$Publisher)
table(gender_publisher)

153 + 252 #all males
61 + 111 #all females
61 + 153 # all dc
111 + 252 #all marvel

61 /(61 + 153) #ratio of femalws for DC
111/(111 + 252) #ratio of females for Marvel

summary(table(gender_publisher))
chisq.test(table(gender_publisher))
fisher.test(table(gender_publisher))

mosaicplot(table(gender_publisher), shade = TRUE, color = TRUE)
