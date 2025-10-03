
##########################

#1. Configuración e Introducción (Setup) 🛠️
#Comenzamos cargando los paquetes necesarios y el conjunto de datos de ejemplo. 
#Usaremos el popular dataset iris para la manipulación y mtcars para las uniones y el bucle.

#R
# TALLER DE R: MANIPULACIÓN, RESUMEN Y DOCUMENTOS DINÁMICOS

# 1. Cargar el paquete esencial para la manipulación de datos: 'dplyr'
# Si no está instalado, usar install.packages("dplyr")
library(dplyr)
# Cargar el paquete para la documentación dinámica (lo usaremos al final)

# Si no está instalado, usar install.packages("rmarkdown")
install.packages("rmarkdown")
library(rmarkdown)
##########################

#1. Configuración e Introducción (Setup) 🛠️
#Comenzamos cargando los paquetes necesarios y el conjunto de datos de ejemplo. 
#Usaremos el popular dataset iris para la manipulación y mtcars para las uniones y el bucle.

#R
# TALLER DE R: MANIPULACIÓN, RESUMEN Y DOCUMENTOS DINÁMICOS

# 1. Cargar el paquete esencial para la manipulación de datos: 'dplyr'
# Si no está instalado, usar install.packages("dplyr")
install.packages("dplyr")
library(dplyr)
# Cargar el paquete para la documentación dinámica (lo usaremos al final)

# Si no está instalado, usar install.packages("rmarkdown")
install.packages("rmarkdown")
library(rmarkdown)


# Usaremos los datos integrados de R: 'iris' para manipulación y 'mtcars' para joins.
data(iris)
data(mtcars)


# Usaremos los datos integrados de R: 'iris' para manipulación y 'mtcars' para joins.
data(iris)
data(mtcars)

# Convertir 'mtcars' a un data frame que se pueda unir fácilmente.
# Creamos una columna de 'nombre_modelo' para usarla en los joins
mtcars_df <- mtcars %>%
  tibble::rownames_to_column(var = "nombre_modelo")

# Crear una tabla de referencia simple para el join (información del motor)
info_motor_df <- data.frame(
  cyl = c(4, 6, 8),
  tipo_motor = c("Baja Potencia", "Potencia Media", "Alta Potencia")
)


# Mostrar la estructura inicial de los datos
cat("Estructura inicial del dataset 'iris':\n")
str(iris)

#2. Manipulación Básica de Datos con dplyr ⚙️
#Esta sección repasa las funciones básicas de dplyr para transformar y refinar los datos.
#R
# Usaremos el operador 'pipe' (%>%) para encadenar operaciones

# A. CREACIÓN DE SUBCONJUNTOS Y SELECCIÓN DE COLUMNAS
# Seleccionar solo las columnas de longitud y crear una nueva columna
datos_transformados <- iris %>%
  # 1. Seleccionar columnas específicas
  select(Sepal.Length, Petal.Length, Species) %>%
  # 2. Mutar/Crear una nueva columna (Mutate)
  mutate(
    Ratio_Longitud = Sepal.Length / Petal.Length,
    Es_Grande = ifelse(Sepal.Length > 6.0, "Sí", "No") # Creación de una variable categórica
  )

cat("\nDatos transformados (Select y Mutate):\n")
head(datos_transformados)

# B. FILTRADO Y REORDENAMIENTO
# Filtrar solo especies 'versicolor' que son 'grandes' (según el criterio anterior)
datos_filtrados <- datos_transformados %>%
  # 3. Filtrar filas (Filter)
  filter(Species == "versicolor" & Es_Grande == "Sí") %>%
  # 4. Reordenar (Arrange) por la columna Ratio_Longitud de forma descendente
  arrange(desc(Ratio_Longitud))

cat("\nDatos filtrados y ordenados (Filter y Arrange):\n")
print(datos_filtrados)

#3. Uniones de Datos (Joins) 🤝
#Aquí practicamos la combinación de dos data frames usando las funciones de unión de dplyr.
#R

cat("\n--- UNIONES (JOINS) ---\n")

# Pre-visualizar las tablas a unir
cat("Tabla Principal (mtcars_df):\n")
head(mtcars_df[, c("nombre_modelo", "cyl", "hp")])
cat("\nTabla de Referencia (info_motor_df):\n")
print(info_motor_df)

# Realizar un LEFT JOIN para añadir la columna 'tipo_motor' a mtcars_df
# La unión se realiza usando la columna común 'cyl'
mtcars_con_motor <- mtcars_df %>%
  left_join(info_motor_df, by = "cyl")

cat("\nResultado del LEFT JOIN (mtcars_con_motor):\n")
# Muestra las columnas clave para verificar la unión
mtcars_con_motor %>%
  select(nombre_modelo, cyl, tipo_motor, hp) %>%
  head(5)

######

######

#5. Control de Flujo: Bucle while (Opcional Avanzado) 🔄
#Aunque no es común en la manipulación de datos moderna 
#(donde se prefieren funciones vectorizadas como las de dplyr), 
#este es un buen ejemplo para mostrar el control de flujo y la lógica en R.
#R
cat("\n--- CONTROL DE FLUJO: BUCLE WHILE ---\n")

# Ejemplo: Calcular cuántas veces se puede dividir la potencia media por 2 hasta que sea menor que 50

potencia_inicial <- mean(mtcars$hp) # 146.6875
potencia_actual <- potencia_inicial
divisiones <- 0

cat(paste("Potencia inicial:", round(potencia_inicial, 2), "\n"))

# El bucle se ejecuta mientras la condición sea VERDADERA
while (potencia_actual >= 50) {
  potencia_actual <- potencia_actual / 2
  divisiones <- divisiones + 1
  cat(paste("  División", divisiones, ":", round(potencia_actual, 2), "\n"))
}

cat(paste("\nResultado: La potencia inicial se dividió", divisiones, "veces hasta ser menor que 50.\n"))