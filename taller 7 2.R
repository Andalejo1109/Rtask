library("dplyr")
iris
summary(iris)
#pregunta 1

setosa <- filter(iris, Species=="setosa")

#pregunta 1

setosa <- filter(iris, Species=="setosa")

setosa1 <- select(setosa, Sepal.Length, Petal.Length, Species)

print(setosa1)

#2

virginica <- filter(iris, Species=="virginica" & Petal.Width>2.0 & Sepal.Length <6.5)

print(virginica)
versicolor <- iris %>% 
  filter(Species == "versicolor") %>%
  select(Sepal.Length, Petal.Length, Species)
ggplot(data = versicolor, aes(x = Sepal.Length, y = Petal.Length)) + geom_point(color = "blue", size = 3) + 
  labs(title = "Relación entre Ancho del Sépalo y Ancho del Pétalo en Versicolor", 
       x = "Ancho del Sépalo (cm)", y = "Ancho del Pétalo (cm)") + 
  theme_minimal()