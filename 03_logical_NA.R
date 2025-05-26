# Индексирование векторов -------------------------------------------------


n <- c(4, 8, 15, 16, 23, 42)
n[1]
n[-1]
n[2:4]
n[-2:-4]
n[n < 10]
tail(head(n, -1), -1)
n[c(2, 5)]
#letters[seq(1, 25, by = 5)]


31 %/% 2 
31 %% 2

#1
seq(2, 20, by = 2)
#2
1:10 * 2
#3
rep(2, 10) * 1:10
#4
v <- 1:20
v[c(FALSE, TRUE)]
#5
(1:20)[c(FALSE, TRUE)]
#6
v <- 1:20
v[v %% 2 == 0]
#7
(1:20)[(1:20) %% 2 == 0]
#8
(4 * 1:10)/2
#9
c(2, 4, 8, 10, 12, 14, 16, 18, 20)

d <- 1:100
d[c(TRUE, FALSE, TRUE, FALSE, FALSE)]


# Работа с логическими векторами ------------------------------------------


eyes <- c("green", "blue", "blue", "brown", "green", "blue")

sum(eyes == "blue")
sum(eyes == "blue")/length(eyes == "blue")
mean(eyes == "blue")
paste(mean(eyes == "blue") * 100, "%")

all(eyes == "blue")
any(eyes == "blue")
all(!eyes == "blue")

seq_len(20)
which(eyes == "blue")
#seq_along(eyes == "blue")[eyes == "blue"]

eyes

eyes[eyes == "blue"]

eyes[eyes == "blue" | eyes == "green"]

eyes[eyes == c("green", "blue")]

eyes %in% c("green", "blue")

respondents_city  <- c("Москва", "Москва", "Казань", "Новосибирск", "Балашиха",
                       "Санкт-Петербург", "Тверь", "Сочи", "Москва", "Нижнекамск",
                       "Москва")
big_cities <- c("Москва", "Санкт-Петербург", "Новосибирск", "Казань", "Екатеринбург")

respondents_city[respondents_city %in% big_cities]


# NA ----------------------------------------------------------------------

missed <- NA
missed == "NA"
missed == ""
missed == 0
missed == NA
NA == NA

n
n[3] <- NA
n
mean(n)
n == NA
Mary <- NA
Joe <- NA
Mary == Joe
NA == 18
n == NA
n
is.na(n)

n[is.na(n)]
n[is.na(n) == FALSE]
n[!is.na(n)]
mean(n[!is.na(n)])
n
?mean
mean(n, na.rm = TRUE)

typeof(NA)
NA_integer_
typeof(n)
NA_real_
c("hey", NA, "hey")
NA_character_
as.character(n)

NULL
1 / 0 > 10000000000
-1 / 0
0 / 0
#NA = Not Available
#NaN = Not a Number

is.nan(0 / 0)
is.nan(NaN)
is.na(NaN)
is.nan(NA)
mean(c(NA, NA, NA), na.rm = TRUE)
