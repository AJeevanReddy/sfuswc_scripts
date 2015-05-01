theargs <- commandArgs(trailingOnly = TRUE)
countryname <- theargs[1]
gapminder <- read.csv("gapminder-FiveYearData.csv")
## plot some data
pdf("myplot.pdf")
gapminder2 <- gapminder[gapminder$country == countryname, ]
plot(x = gapminder2$pop, y = gapminder2$lifeExp)
dev.off()