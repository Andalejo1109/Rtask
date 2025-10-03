#asgnacion de variables
c <- "helllo world!"


#insstallacion de paquetes
install.packages("tidyverse")
library("tidyverse")


#operacion matematica
54+60
#operacion matematica
54+60

6=="6a"

#crear un vector
listOfNumbers <- c(1,5,91,42.8,100008.41)
listOfNumbers


listOfNumbers + 1
edades <- c(22, 25, 30, 21) # Vector numérico
nombres <- c("Ana", "Pedro", "Luis") # Vector de caracteres#Vectores: Colecciones de elementos del mismo tipo.
#R
edades <- c(22, 25, 30, 21) 
#Vectores: Colecciones de elementos del mismo tipo.
#R
edades <- c(22, 25, 30, 21) # Vector numérico
nombres <- c("Ana", "Pedro", "Luis") # Vector de caracteres

#Explica cómo acceder a elementos individuales usando corchetes, por ejemplo, edades[1].
#Matrices: Tablas con filas y columnas de elementos del mismo tipo.

matriz <- matrix(1:9, nrow = 3)

#Data Frames (Marcos de Datos): La estructura más importante para el análisis de datos. Son como hojas de cálculo, con filas y columnas, donde cada columna puede #ser de un tipo de dato diferente.

data_alumnos <- data.frame(
  nombre = c("Ana", "Pedro", "Luis"),
  edad = c(22, 25, 30),
  nota = c(4.5, 3.8, 5.0)
) 
matriz

 data () 
 mpg
?mpg
 
 
 ####################################
 ###################################
 #insstallacion de paquetes
 install.packages("tidyverse")
 library("tidyverse")
 
 data()
 
 ?mpg
 
 str(mpg)
 
 require(ggplot2)
 
 str(mpg)
 
 nrow(mpg)
 
 colnames(mpg)
 
 #Manufacturers
 
 table(mpg$manufacturer)
 
 qplot(manufacturer, data=mpg, geom="bar", fill=manufacturer)
 
 #Year of manufacturing
 
 table(mpg$year)
 qplot(factor(year), data=mpg, geom="bar", fill=factor(year))
 
 
 #Displacement
 
 summary(mpg$displ)
 
 qplot(displ, data=mpg, geom="histogram", bins=30)
 
 boxplot(mpg$displ)
 
 #Transmission types
 
 table(mpg$trans)
 
 qplot(trans, data=mpg, geom="bar", fill=factor(trans))
 
 
 #Mileage in city
 summary(mpg$cty)
 
 qplot(cty, data=mpg, geom="histogram", bins=20)
 
 qplot(cty, data=mpg, geom="histogram", bins=30)
 
 #Vehicle Class
 table(mpg$class)
 
 qplot(class, data=mpg, geom="bar", fill=class)
 
 #Displacement vs highway efficiency
 ggplot(data = mpg) + 
   geom_point(mapping = aes(x = displ, y = hwy), color='blue')
 
 #Looking at this data separately for each class
 qplot(displ, hwy, data=mpg, geom="point", color=class)
 
 #Separate graphs for each vehicle class:
 
 ggplot(data = mpg) + 
   geom_point(mapping = aes(x = displ, y = hwy, color=class)) +
   facet_wrap(~ class, nrow = 2)
 #  Fuel types
 table(mpg$fl)
 
 qplot(fl, data=mpg, geom="bar", fill=fl)