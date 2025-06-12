
# Создание векторов -------------------------------------------------------

c(1, 2, 3, 4)
c(1, 2, 3, 4)
1:10
5.5:10
10:-20
10:10:100
seq(10, 100, by = 10)
seq(1, 13, length.out = 4)
seq(1, 13, length.out = 7)
rep(1:3, c(10, 2, 5))
rep(1:3, each = 5)
rep(1:3, 5)
rep("hey", 20)
rep("la", 10)
c(1:10, 100, seq(10, 100, by = 10))
sum(1:100)
mean(1:100)

c(1:20, 19:1)
rep(1:9, 1:9)

# Приведение типов --------------------------------------------------------

c(FALSE, 2)
2 + TRUE
c(TRUE, 2, "три")
c(c(TRUE, 2), "три")
as.integer(c(FALSE, TRUE, TRUE))
as.logical(c(1, 0, 1))
as.logical(c(2, 0, -2))
as.numeric(c("1", "2", "fkf"))

n <- 1:4
m <- seq(10, 40, by = 10)
n
m
n + m
n * m
n - m
n / m
m / n
m ^ n
n + m ^ n / (m + n)
n < m
sqrt(n)
log(m)
log(10, m)
k <- c(10, 100)
n * k
n + k
n * 100
n + 100
l <- c(10, 100, 1000)
n * l

(1:10) ^ 2
1:20 * 0:1
sum(1/2 ^ (0:50))
n <- c(0, 1, 1, 2, 3, 5, 8, 13, 21, 34)
n[1]
n[10]
length(n)
n[length(n)]
head(n, 1)
tail(n, 1)
n[3] <- 20
n

n[4:7]
n[10:1]
n
rev(n)
n[4:6] <- 0
n
n[-1]
n[c(-2, -4, -9)]
n
n[c(2, 4, 9)]
n[2,4,9] #не работает

n[c(TRUE, FALSE, TRUE, FALSE, TRUE, 
    FALSE, TRUE, FALSE, TRUE, FALSE)]
n[c(TRUE, FALSE)]
n[n > 10]
mean(n)
n[n > mean(n)]
n[n >= 18 & n <= 30]
?c
named_vector <- c(first = 1, second = 2, third = 3)
named_vector
named_vector["first"]
named_vector[c("first", "third")]
attributes(named_vector)
names(named_vector)
names(named_vector) <- letters[1:3]
named_vector
named_vector[c("a", "c")]
