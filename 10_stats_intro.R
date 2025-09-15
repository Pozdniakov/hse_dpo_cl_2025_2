dnorm(0)
dnorm(1)
dnorm(-1)
dnorm(2)
dnorm(-2)
vec <- seq(-3, 3, 0.1)
vec
dnorm(vec)
plot(vec, dnorm(vec))

iq <- 50:150
plot(iq, dnorm(iq, mean = 100, sd = 15))

pnorm(100, mean = 100, sd = 15)
pnorm(70, mean = 100, sd = 15)
1 - pnorm(130, mean = 100, sd = 15)

punif(5, min = 0, max = 100)

plot(iq, pnorm(iq, mean = 100, sd = 15))

plot(seq(0,1, 0.01), qnorm(seq(0,1, 0.01), mean = 100, sd = 15))

set.seed(42)
samp <- rnorm(100, mean = 100, sd = 15)
samp
hist(samp, breaks = 15)
samp
mean(samp)

sqrt(sum((samp - mean(samp))^2)/(length(samp) - 1))
sd(samp)

#CI95%

many_means <- replicate(1000000, mean(rnorm(100, mean = 100, sd = 15)))
hist(many_means)
mean(many_means)
sd(many_means)
sd(samp)/sqrt(length(samp))
