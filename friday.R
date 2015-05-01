## Andrew 
## Friday notes
## 01 May 2015

## read in data
gapminder <- read.csv("gapminder-FiveYearData.csv")

country_list <- unique(gapminder$country)

country_list == "Peru"

1:7 * 2

1:7 ^ 2

x <- 1:7

x ^ 7

50 / x 

### the challenge went here

## a function to calculate the sum of some fractions
fraction_sum <- function(n){
  a <- 1:n
  answer <- sum(1/(a^2))
  return(answer)
}

fraction_sum(100000)

## try for different exponents
exponent <- 3
## a function to calculate the sum of some fractions
fraction_sum <- function(n){
  a <- 1:n
  answer <- sum(1/(a^exponent))
  return(answer)
}



fraction_sum(100)

source("myfunctions.R")

head(gapminder)

gapminder$totalGDP <- calc_GDP(gapminder)
head(gapminder)

## calculate GDP in canadian
gapminder$canGDP <- gdpCAD(gapminder)
head(gapminder)

x <- 1:7
## inequality
x >= 3
## equality
x == 3
x != 3

a <- x > 3
b <- x < 2
a
b
a & b
a | b

any(c(TRUE, TRUE, FALSE))

all(c(TRUE, TRUE, FALSE))

x <- 1:10
if(any(x > 3)){
  print("it is greater")
}

x <- -10
if(x>0){
  print("x is positive")
} else if(x == 0){
  print("x is 0")
} else {
  print("x is negative")
}


x <- -10
if (x>0){
  print("x is positive")
} else if(x == 0){
  print ("x is 0")
}else{
  print("x is negative")
}

if(x>0){
  print("x is positive")
}else if(x==0){       #  <------ first bracket is backwards
  print("x is 0")
}else{
  print("x is negative")
}
gapminder$year<1980

head(gapminder)
gapminder$time_period <- ifelse(test = gapminder$year<1980,
                                yes = "early",
                                no = "late")

ncountry <- length(country_list)
pop_country <- numeric(ncountry)
head(gapminder)
names(pop_country) <- country_list

pop_country["Canada"]

for(countryname in country_list){
  where_is_country <- gapminder$country==countryname
  just_those_rows <- gapminder[where_is_country, ]
  life <- mean(just_those_rows$lifeExp)
  pop_country[countryname] <- life
}
pop_country

for(i in 1:10){
  print(i)
}

