gapminder <- read.csv("gapminder-FiveYearData.csv", stringsAsFactors = FALSE)

country_list <- unique(gapminder$country)

country_list[country_list == "Canada"]

1:8 * 1:2

number_machine <- function(n, talk = TRUE){
  out <- runif(n)
  if(talk){
    print("i made you a number")
  }
  return(out)
}

number_machine(2, talk = FALSE)

tryme <- function(well){
  if(well) stop("fuck")
}


fib <- numeric(12)
fib
fib[1] <- 0
fib[2] <- 1

for (i in 3:12){
  fib[i] <- fib[i-1] + fib[i-2]
}


gm <- unique(gapminder$country)

for (i in gm){
  dat <- gapminder[gapminder$country == i, ]
  name <- paste0("countries/", i, ".csv")
  write.csv(dat, name)
}
