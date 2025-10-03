install.packages("tidyverse")
install.packages("nycflights13")
library(dplyr)
library(tidyverse)
library(nycflights13)
airlines


install.packages("tidyverse")
install.packages("nycflights13")

library(dplyr)
library(tidyverse)
library(nycflights13)

airlines
airports
airports

planes
weather
planes |>
  count(tailnum) |>
  filter(n > 1)
airports |>
  count(faa) |>
  filter(n > 1)


weather |>
  count(time_hour, origin) |>
  filter(n > 1)
flights2 <- flights |>
  mutate(id = row_number(), .before = 1)
flights2
flights2 |>
  left_join(airlines)
#left join
#agregar datos de aerolinea

flights2 |>
  left_join(airlines)
#agregar detalles de avion en vuelo
flights2 |> 
  left_join(planes |> select(tailnum, type, engines, seats))
flights2 |> 
  left_join(weather |> select(origin, time_hour, temp, wind_speed))
flights2 |> 
  left_join(airports, join_by(dest == faa))
#RIGHT
flights2 |> 
  right_join(weather |> select(origin, time_hour, temp, wind_speed))
flights2 |> 
  right_join(airports, join_by(dest == faa))