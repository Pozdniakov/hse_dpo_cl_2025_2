c(10, TRUE, "three")


# Matrix ------------------------------------------------------------------


matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE)
A <- matrix(1:12, nrow = 4)
A[2, 3]
A[1:2, 2:3]
A[c(TRUE, FALSE, TRUE, FALSE), c(TRUE, FALSE, TRUE)]
A[A > 10]

A[1:4, 2:3]
A[, 2:3]
A[c(1, 3), 1:3]
A[1:3, ]
A[-4, -1]
A[c(1, 3, 4), ]
v_i <- c(1, 2, 4)
A[v_i, 1:2]
A[1:2, 1:2] <- 100
A
attributes(A)
attr(A, "dim") <- NULL
A
attr(A, "dim") <- c(2, 6)
A
chr_vec <- c("welcome", "to", "the", "matrix", "Neo", "!")
attr(chr_vec, "dim") <- c(2, 3)
chr_vec
A[2:5]
attr(A, "dim") <- c(2, 2, 3)
A
class(A)

rep(1:9, rep(9, 9))
rep(1:9, each = 9)

matrix(rep(1:9, 9) * rep(1:9, each = 9), nrow = 9)
outer(1:9, 1:9)
1:9 %o% 1:9

# List --------------------------------------------------------------------

simple_list <- list(42, "hi", TRUE)
simple_list

complex_list <- list(simple_list, 1:10, letters, A, list, `+`)
complex_list
str(complex_list)
is.vector(1:20)
is.vector(complex_list)
is.atomic(1:20)
is.atomic(complex_list)
is.recursive(1:20)
is.recursive(complex_list)

named_list <- list(name = "Veronika", age = 26, student = TRUE)
named_list$name
named_list$age
named_list[1]

class(named_list$name)
class(named_list[1])
named_list[[1]]
named_list[1]
named_list[[1]]
complex_list[1]
complex_list[[1]][[2]]

# data.frame --------------------------------------------------------------

df <- data.frame(
           name = c("Veronika", "John Snow", "Tolik", "Brunhilda", "Thomas"),
           age = c(96, 4, 29, 40, 102),
           student = c(TRUE, TRUE, FALSE, TRUE, FALSE)
           )
df[1:2, 1:2]
df$name[1:2]
df[1:3, c(1, 3)]
df[c(TRUE, FALSE, TRUE, FALSE, TRUE), c("name", "student")]
df$age
df$lovesR <- TRUE
df$lovesR <- NULL
df[df$student, ]
df$age > mean(df$age)
df[df$age > mean(df$age), "name"]
df
df$name[df$age > mean(df$age)]

mtcars
?mtcars
sum(mtcars$carb <= 2)
mean(mtcars$carb <= 2)

# Пакеты ------------------------------------------------------------------

#install.packages("beepr")
library(beepr)
beep(11)

beep()
beepr::beep()

installed.packages(priority = "base")

install.packages("devtools")
devtools::install_github("brooke-watson/BRRR")

library(BRRR)
skrrrahh(2)
