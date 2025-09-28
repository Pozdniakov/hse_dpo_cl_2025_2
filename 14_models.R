library(tidyverse)
library(Stat2Data)
data(Backpack)
back <- Backpack %>%
  mutate(backpack_kg = BackpackWeight * 0.45359237,
         body_kg = BodyWeight * 0.45359237)

cor.test(back$body_kg, back$backpack_kg)
class(y ~ x)
model <- lm(backpack_kg ~ body_kg, data = back)
model
class(model)
str(model)
model$coefficients

ggplot(data = back, aes(x = body_kg, y = backpack_kg)) +
  geom_point() +
  geom_abline(slope = model$coefficients[2],
              intercept = model$coefficients[1])

predict(model, newdata = data.frame(body_kg = 100))
predict(model, newdata = data.frame(body_kg = 1000))
predict(model, newdata = data.frame(body_kg = 0))

summary(model)

model$residuals
residuals(model)
options(scipen = 999)
mean(residuals(model))

hist(residuals(model))
plot(model)

rss <- sum(residuals(model) ^ 2)
tss <- sum((back$backpack_kg - mean(back$backpack_kg))^2)
1 - rss/tss

cor.test(back$body_kg, back$backpack_kg)$estimate ^ 2

model_mult <- lm(backpack_kg ~ body_kg + Units, data = back)
summary(model_mult)
summary(model)

model_mult2 <- lm(backpack_kg ~ body_kg + Units + Year + BackProblems, data = back)
summary(model_mult2)

install.packages("car")
car::vif(model_mult2)
diet <- read_csv("https://raw.githubusercontent.com/Pozdniakov/tidy_stats/master/data/stcp-Rdataset-Diet.csv")

diet <- diet %>%
  mutate(weight.loss = weight6weeks - pre.weight,
         Dietf = factor(Diet, labels = LETTERS[1:3]),
         Person = factor(Person))

summary(aov(weight.loss ~ Dietf, diet))

summary(lm(weight.loss ~ Dietf, diet))

?aov

aov_model <- aov(weight.loss ~ Dietf, diet)
pairwise.t.test(diet$weight.loss,
                diet$Dietf,
                p.adjust.method = "bonferroni",
                pool.sd = FALSE,
                paired = FALSE)

TukeyHSD(aov_model)

install.packages("ez")
library(ez)
ezANOVA(data = diet,
        dv = weight.loss,
        wid = Person,
        between = .(Dietf, gender))

install.packages("lme4")
library(lme4)
data("sleepstudy")
?sleepstudy

sleepstudy %>%
  ggplot(aes(x = Days, y = Reaction)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()

sleep_lme0 <- lmer(Reaction ~ Days + (1|Subject), sleepstudy)
sleep_lme1 <- lmer(Reaction ~ Days + (Days|Subject), sleepstudy)

sleepstudy$predicted_by_lme0 <- predict(sleep_lme0)
sleepstudy$predicted_by_lme1 <- predict(sleep_lme1)

sleepstudy %>%
  rename(observed_reaction_time = Reaction) %>%
  pivot_longer(cols = c(observed_reaction_time,
                        predicted_by_lme0,
                        predicted_by_lme1),
               names_to = "model",
               values_to = "Reaction") %>%
  ggplot(aes(x = Days, y = Reaction, colour = model)) +
  geom_line() +
  geom_point() +
  scale_x_continuous(breaks = 0:9) +
  facet_wrap(~Subject) +
  theme_minimal()

anova(sleep_lme0, sleep_lme1)
