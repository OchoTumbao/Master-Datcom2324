1

class(1)

class(1.5)

class(-3.78)

TRUE

class(TRUE)

class(FALSE)

4 + 1.2i

class(4 + 1.2i)

"a"

class("a")

class("hola")

class("adios") # Recomendado

class('adios') # No recomendado

"hola" y "adios" # Error

""hola" y "adios"" # Error

'"hola" y "adios"' # Para este tipo de cosas se usan las comillas simples

1 / 0

1 / Inf

0 / 0

NULL

?NULL

NA

?NA

1 + 5

5 - 4

3 * 2.1

7 / (-4.3)

2 ^ 3

2 ** (-1/2) # Igual que ^

# Modulo

4 %% 3

# Division entera

3 %/% 2

# Division usando numero complejo

1i / 2

## Operadores Logicos

1 < 9.5

2.7 <= -5.3

4.9 > 2

4.9 >= 3

5 == 5

5 != 5

!(5 == 5)

# || Y && Existe para hacer O LUEGO , Y LUEGO, pero no estan pensados para vectores
(5 == 5) | (5 != 5)

(5 == 5) & (5 != 5)


1 == TRUE

0 == FALSE

7 == TRUE

7 == FALSE

## VECTORES

# En R Todo es un vector

# Funcion para crear un vector, Ya veremos la creación de funciones, pero pueden tener un numero indeterminado o determinado de parametros

c(1,5,8)

# Como en R todo es un vector un vector de numeros sigue siendo un numerico, porque un numero ES un vector de un elemento

class(c(1,5,8))

print(c(1,5,8))

# Si un solo elemento del vector es de punto flotante el resto de elementos tambien seran interpretados como flotantes

print(c(-1,5.5,8))

# Idem para complejos

print(c(1.5,5,-8.5,5i))

# Por tanto el vector pasa a ser de tipo complejo

class(c(1.5,5,-8.5,5i))

print(c("hola", "adios"))

# OJO LIADA VECTOR DE DOS TIPOS DE ELEMENTOS

print(c("hola", 7))

# Es de tipo character

class(c("hola", 7))

print(c(TRUE, FALSE, TRUE))

print(c(T, F, T))

# OJO LIADA, AQUI LOS VA A CONVERTIR TODOS A NUMEROS
print(c(TRUE, 0, TRUE))

# HAY QUE INDICAR QUE QUEREMOS QUE VAYA TODO A NUMERICO

print(as.logical(c(TRUE, 0, TRUE)))

# IDEM SI QUEREMOS QUE TODOS LOS ELEMENTOS DEL VECTOR SE CONVIERTAN EN CARACTERES

print(as.character(c(3,4,5)))

is.character(as.character(c(3,4,5)))

is.character(c(3,4,5))

print(1:4)

print(4:1)

print(1.1:6.9)

print(-1:5)

print(vector("numeric", length = 10))

print(vector("logical", length = 10))

print(1:3 + 4:6)

print(1:3 + 4:7) # Warning! Recycling Rule

print(1:3 * 4:6)

print(1:3 - 4:6)

print(1:3 / 4:6)

1:3 == 4:6

1:3 != 4:6

1:3 < 4:6

1:3 >= 4:6

!(0:3)

.1 == (.3 / 3)

unique(c(.3, .4 - .1, .5 - .2, .6 - .3, .7 - .4))

1:5-1

1:(5-1)

10^2:6

?Syntax

x <- 1 # A la variable x le asigno 1

print(x)

x = 5 # A la variable x le asigno 1 

print(x)

# Do not run!
foo(93, a = 47)
foo(93, a <- 47)

# Do not run!
system.time(result <- foo(100))

v <- c(2,6,8,10,-2,4.3)
print(v)

print(v + 1) # Recycling Rule

print(v * v)

print(v == v)

all(v == v)

identical(v,v)

# %in% Comprueba si el operando de la izquierda esta contenido en el operando de la derecha. En este caso elemento a elemento

print(c(3,2) %in% v)

# Intersección entre dos vectores

intersect(c(3,2), v)

# Union de vectores
print(union(c(3,2), v))

# No es conmutativo

print(union(v, c(3,2)))

# Diferencia de vectores, (No restar uno a uno, sino los elementos del vector de la izquierda fuera de la intersección)
print(setdiff(c(3,2), v))

print(setdiff(v, c(3,2)))

print(setdiff(abs(v), c(3,2)))

# Algun elemento de V es mayor a 2

any(v > 2)

# Todos los elementos de v son mayor que 2
all(v > 2)

print(v)

# R EMPIEZA A CONTAR DESDE EL 1
v[1]

v[0] # Nada

# OJITO, QUE ESTO ES TODOS LOS ELEMENTOS MENOS EL PRIMER ELEMENTO

print(v[-1])

# ESTO ES TODOS MENOS EL PRIMERO Y EL SEGUNDO

print(v[-1:-2])

# Longitud del vector
length(v)

length(4)

# OJO CON VECTORES DE CARACTERES, NO CUENTA CARACTER A CARACTER, SINO CADENA A CADENA. LA LONGITUD DE UNA CADENA DE CARACTERES ES nchar()
length("hola")

nchar("hola") # Más sobre cadenas de caracteres más adelante

# Elemento a elemento (recycling rule)
v >= 0

# UY, le estoy dando un vector de valores logicos, por tanto cogera todas las posiciones con valor true 
print(v[v >= 0])

# Aqui cogemos solo los negativos
print(v[v < 0])

# Y aqui los que esten dentro de un rango especifico
print(v[v >= 0 & v <= 5])

# Sumamos todos los elementos del vector
sum(v)
#Calculamos el producto de todos los elementos del vector
prod(v)
# El minimo
min(v)
# El maximo
max(v)

w <- c(NULL, 3, NA, 7, NaN)
w

length(w)

class(w)

sum(w)

sum(w, na.rm = TRUE)

prod(w)

prod(w, na.rm = TRUE)

min(w)

min(w, na.rm = TRUE)

max(w)

max(w, na.rm = TRUE)

seq(12, 30, 3) # seq(from=12, to=30, by=3)

seq(-12, 30, 3.4)

print(seq(-12, 30, 3.4))

seq(1.1, 7, 10)

seq(1.1, 7, length=10)

?seq

seq()

rep(8,4)

rep(8,4.1) # Redondeo

rep("a",4)

rep(1:3, 5)

length(rep(1:3, 5))

?rep

rep(c(5,12,13), 2)

rep(c(5,12,13), each=2)

letters

LETTERS

month.abb

month.name

x == NA

class(x == NA)

NA == NA

3 == c(3, 1, 3, NA)

is.na(x)

xnull <- NULL
xnull == NULL

xnotnull <- 42
xnotnull == NULL

print(xnull == NULL)
print(xnotnull == NULL)

is.null(xnull)

x1 <- 10:1
print(x1)
x1 == c(4, 6)

x1 %in% c(4, 6)

x1 == 4 | 6

x1 == (4 | 6)

x1 == 4 | x1 == 6

50 < "7"

length(x != 1)

length(x) != 1

xna <- c(1, NA, 3, 2, 4, 2)
xna[xna == 2]

xna[!is.na(xna) & xna == 2]

which(xna == 2)

xna[which(xna == 2)]

x4 <- c(a=1, b=2, a=3)
print(x4)

x4["a"]

x4[names(x4) %in% "a"]

print(c("missing value"=NA, "real string"="NA"))

list_data <- list("Red", "Green", c(21,32,11), TRUE, 51.23, 119.1i)
print(list_data)

class(list_data)

list_data[[5]]

class(list_data[[6]])

names(list_data) <- c("Colors", "Age", "Time")
print(list_data)

names(list_data) <- c("A", "B", "C", "E", "F", "A")
print(list_data)

attributes(list_data)

list_data[[1]]

list_data$A

list_data[["A"]]

print(list_data[1])

class(list_data[1])

print(list_data[1:3])

print(list_data[c("A","E")])

print(unlist(list_data))

class(unlist(list_data))

num_list <- list(1,2,3,4,5)
day_list <- list("Mon","Tue","Wed", "Thurs", "Fri")
new_list <- c(num_list, day_list)
print(new_list)

new_list[[5]] <- NULL # Opcion 1
print(new_list)

print(new_list[-5]) # Opcion 2

x <- 1:20
dim(x) <- c(5,4)
x

matrix(nrow = 2, ncol = 3)

matrix(0, nrow = 2, ncol = 3)

matrix("a", nrow = 2, ncol = 3)

matrix(1:12, nrow = 3, ncol = 4)

matrix(1:12, nrow = 3)

matrix(1:12, ncol=3)

matrix(1:12, nrow=3, byrow=TRUE)

matrix(1:12, nrow=3, byrow=FALSE)

m <- matrix(1.1:12.1, nrow=3, byrow=FALSE)
rownames(m) <- c("A","B","C")
colnames(m) <- c("1","2","x","y")
m

dim(m)

length(m)

rbind(1:5,11:15)

cbind(1:5,11:15)

m[1,1]

print(m[1,])

print(m[,1])

m[1:2,1:3]

m[,c("1", "x")]

m[,c(-1,-4)]

m[,-"x"] # Error!

c('x') %in% colnames(m) 

colnames(m) %in% c('x')

m <- m[,!colnames(m) %in% c('x')]
m

class(m)

class(m[1,])

m[1,,drop=FALSE]

class(m[1,,drop=FALSE])

mx <- matrix(1:12, nrow=3, byrow=TRUE)
mx

mx[3, 2] <- 4
mx

mx[2, ] <- c(1,3) # Recycle!
mx

mx[1:2, 3:4] <- c(8,4,2,1)
mx

ncol(mx)

nrow(mx)

t(mx)

diag(mx)

m * m

m %*% m

attributes(m)

class(attributes(m))

x <- 1:20
dim(x) <- c(2,5,2)
print(x)

a <- array(1:24, dim=c(3,4,2))
print(a) # Una matriz de 3 dimensiones

a <- array(1:24, dim=c(3,4,2), 
           dimnames = list(c("ROW1","ROW2","ROW3"), 
                           c("COL1","COL2","COL3","Col4"), 
                           c("Matrix1","Matrix2")))
print(a)

a[1,3,1]

print(a[3,,2])

print(a[,,2])

Pain <- c(0,3,2,2,1)
Pain

SevPain <- factor(c(0,3,2,2,1), levels=c(0,1,2,3), labels=c("none","mild","medium","severe"))
SevPain

directions <- c("North", "East", "South", "South")
factor(directions)

factor(directions, levels=c("North", "East", "South", "West"), labels=c("N","E","S","W"))

table(directions)

status <- c("Lo", "Hi", "Med", "Med", "Hi")
ordered.status <- factor(status, levels=c("Lo", "Med", "Hi"), ordered=TRUE)
print(ordered.status)

table(status)

table(ordered.status)

f <- factor(c(101,6,8,9,6,103))
is.numeric(f)

as.numeric(f)

as.numeric(as.character(f))

as.numeric(levels(f))

as.numeric(levels(f))[f]

ff <- factor(c("AA", "BA", "CA"))
ff

ff[1:2]

ff[1:2, drop=TRUE] # Opcion 1

factor(ff[1:2]) # Opcion 2

f1 <- factor(c("AA", "BA", NA, "NA"))
f1

f1 <- factor(c("AA", "BA", NA, "NA"), exclude=NULL)
f1

S <- as.factor(c("F","M","M","F"))
Patients <- data.frame(age=c(31,32,40,50), sex=S)
Patients

m <- matrix(1:12, ncol=4, byrow=TRUE)
as.data.frame(m)

employee <- c("John Doe","Peter Gynn","Jolie Hope")
salary <- c(21000, 23400, 26800)
startdate <- as.Date(c("2010-11-1","2008-3-25","2007-3-14"))

employ.data <- data.frame(employee, salary, startdate)
employ.data

str(employ.data)

employ.data <- data.frame(employee, salary, startdate, stringsAsFactors=TRUE)
employ.data

ncol(employ.data)

nrow(employ.data)

length(employ.data) # ¡Cuidado!

summary(employ.data)

employ.data[1,1]

employ.data[1,]

employ.data[,1]

employ.data$employee

rbind(employ.data, c("John Doe", 50000, "1990-11-1"))

rbind(employ.data, c("Rocio Romero", 50000, "1990-11-1")) # Error

rbind(employ.data, c("John Doe", 50000)) # Error

# Crear los datos para el dataframe
year <- c(2000, 2020, 2021, 2021, 2022, 2022, 2023, 2023, 2024, 2024)
country <- c("Argentina", "Brasil", "Chile", "Colombia", "Ecuador", "Perú", "México", "Uruguay", "Paraguay", "Bolivia")
valor1 <- c(100, 120, 90, 110, 80, 105, 115, 95, 125, 75)

# Crear el dataframe
data1 <- data.frame(year, country, valor1)
data1

# Crear los datos para el dataframe
country <- rep(c("Argentina", "Brasil", "Chile"), each = 1, times = 5)
year <- c(rep(seq(2000, 2006, by = 1), each = 2), 2020)
valor2 <- runif(15, min = 1, max = 100) # Valores aleatorios entre 1 y 100

# Crear el dataframe
data2 <- data.frame(country, year, valor2)
data2

?merge

merge(data1, data2, by = c("country", "year")) # conserva sólo las observaciones coincidentes

merge(data1, data2, by = c("country", "year"), all.x = TRUE)

merge(data1, data2, by = c("country", "year"), all.y = TRUE)

merge(data1, data2, by = c("country", "year"), all = TRUE)
