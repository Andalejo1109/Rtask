install.packages("sqldf")
install.packages("gapminder")
install.packages("Hmisc")
install.packages("dslabs")

library(sqldf)
library(tidyverse)
library(gapminder)
library(Hmisc)
library(dplyr)
library(ggplot2)
library(dslabs)
data(gapminder)

gapminder
#Life expectancy vs fertility - part 2 - coloring your plot
gapminder %>%
  filter(continent == "Africa", year == 2012) %>%
  ggplot(aes(fertility, life_expectancy, color = region )) +
  geom_point()

# Life expectancy and the Vietnam War - part 1
countries <- c("Vietnam", "United States")
tab <- gapminder %>%
  filter(country %in% countries, year >= 1960 & year <= 2010) 
tab
# Life expectancy and the Vietnam War - part 1
countries <- c("Vietnam", "United States")
tab <- gapminder %>%
  filter(country %in% countries, year >= 1960 & year <= 2010) 
tab
#Life expectancy vs fertility - part 2 - coloring your plot
gapminder %>%
  filter(continent == "Africa", year == 2012) %>%
  ggplot(aes(fertility, life_expectancy, color = region )) +
  geom_point()
p <- tab %>%
  ggplot(aes(year, life_expectancy, color = country)) +
  geom_line()
#Dollars per day
data(gapminder)
daydollars <- gapminder %>%
  filter(continent == "Africa", year %in% c(1970, 2010), !is.na(gdp)) %>%
  mutate(dollars_per_day = gdp/population/365)

p <- daydollars %>%
  ggplot(aes(dollars_per_day, y = ..count.., fill=region)) +
  geom_density(bw = 0.5, position = "stack") +
  scale_x_continuous(trans = "log2") +
  facet_grid(year ~ .)
p

##########

###uniones

#
# LEFT TABLE
vab_pc <- gapminder %>%
  filter(year == 2007) %>%
  filter(country %in% c("Spain", "Peru", "India", "Australia", "Japan", "Canada")) %>%
  select(country, continent, gdp)

vab_pc

# RIGHT TABLE 
life_exp <- gapminder %>%
  filter(year == 2007) %>%
  filter(country %in% c("Spain", "Australia", "Singapore", "Canada", "Japan", "Mongolia", "Brazil")) %>%
  select(country, continent, life_expectancy)

life_exp

##inner join
sqldf('SELECT *
      FROM vab_pc 
      INNER JOIN life_exp 
      ON vab_pc.country = life_exp.country')