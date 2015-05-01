## Andrew
## 01 may
## these are functions
## they all work

## here is a fraction sum calculator
fraction_sum <- function(n){
  a <- 1:n
  answer <- sum(1/(a^2))
  return(answer)
}

## calculate GDP
calc_GDP <- function(dataframeoftheworld){
  gdp <- dataframeoftheworld$pop * dataframeoftheworld$gdpPercap
  return(gdp)
}

USD_to_CAD <- function(money){
  cad <- money * 1.21
  return(cad)
}

gdpCAD <- function(gm){
  gdp <- calc_GDP(gm)
  cad <- USD_to_CAD(gdp)
  return(cad)
}

