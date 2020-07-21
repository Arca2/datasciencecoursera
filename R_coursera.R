library("swirl")
swirl() #esto es lo que hay que poner en consola para retomar las lecciones

x <- 1
print(x) ## esto es un comentario
y <- 1:20 ## esto es un vector o secuencia de numeros
## R se basa en classes de objetos
#un vector solo contiene caracteres de un tipo (no mezclas)
#vector() crea un vector
f <- c(0.4,0.5) ##numerico
f <- c(TRUE,FALSE) ##logico
f <- c(T,F) ##logico
f <- c("a","b", "c") ##character
class(f) ## nos entrega el tipo de variable
x <- 0:6
as.numeric(x)
as.logical(x)
as.character(x) 
x<-c("a","b","c")
as.numeric(x)

x<- list(1,"a",T,1+4i)

##matrices

m <- matrix(nrow=3,ncol = 3)
dim(m)
attributes(m)

mm <- matrix(1:9, nrow=3,ncol = 3)
##de otra forma
m <- 1:10
dim(m)<-c(2,5)
#otra otra forma
x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

##data types  factors
##Factors representa datos categoricos
x<- factor(c("yes","no","yes","no","no"))
table(x)
unclass(x)

x<- factor(c("yes","no","yes","no","no"), levels = c("yes","no"))
#en esta ultima se puede especificar el orden de los niveles

##missing values
x <- c(1,2,NA,10,3)
is.na(x) # retornan un vector logico informando donde esta valor perdido
x <- c(1,NaN,NA,10,3)
is.nan(x)  # retornan un vector logico informando donde esta valor perdido

##Dataframe: se usa para almacenar datos tabulares estructurados
x<- data.frame(foo=1:4, bar = c(T,T,F,F))

##names
x<- 1:3
names(x)
names(x)<- c("foo","bar","norf")
names(x)
x<-list(a=1,b=2,c=3) #listas tambien pueden tiener nombres
m<-matrix(1:4,nrow = 2,ncol = 2)
dimnames(m)<-list(c("a","b"),c("c","d"))
dimnames(m)

##reading tabular data (like .csv)
##writing data
data <- read.table("foo.txt")
data <- read.csv("info.csv")


##reading large data
# es importante calcular si tenemos la suficiente ram para hacerlo
# pues si el dataset es muy grande no podremos cargarlo en memoria
initial <- read.table("datatable.txt",nrows = 100)#nrows quita velocidad 
#pero evita que se sobrecargue la memoria
classes <- sapply(initial, class)
tabAll <- read.table("datatable.txt", colClasses = classes)

##como calcular la memoria requerida:
#si el dataframe tiene 1,500,000 filas y 120 columnas
# c=1,500,000*120*¨8 [bytes/numeric]
#c/2^(20) [bytes/Mb]

y<-data.frame(a=1,b=2)
dput(y)
dput(y,file="y.R")
new.y<-dget("y.R")
new.y
x<-"foo"
y<-data.frame(a=1,b="a")
dump(c("x,y"),file="data.R")
rm(x,y)
source("data.R")
y

## leer archivos
con<- file("foo.txt","r")
data <- read.csv("nombre.txt")

#leer website
con <- url("http://www.jhsph.edu","r")
x<-readLines(con)
head(x)

x<- c("a","b","c","d")
x[1]
x[1:3]
x[x>"a"]
u<- x>"a"
x[u] #idices logicos ,Wow

x<-matrix(1:6,2,3)
x[1,2]
x[2,1]
x[1,]
x[1,2,drop=FALSE]
x[1,,drop=FALSE]

x<-list(aardvark = 1:5)
x$a
x[["a",exact = FALSE]]

#remover NaN values

x<- c(1,2,NA,4,NA,5)
bad <- is.na
x[!bad]

x<- c(1,2,NA,4,NA,5)
y<- c("a","b",NA,"d",NA,"f")
good <- complete.cases(x,y)
good
x[good]
y[good]


#operaciones vectorizadas
x<-1:4 ; y<-6:9
x+y
x>2
x>=2 
y==8
x*y
x/y

x<-matrix(1:4,2,2); y<- matrix(rep(10,4),2,2)
x*y #element-wise multiplication
x/y
x%*%y  #true matrix multiplication



##Quiz 1
data <-read.csv( "hw1_data.csv")
data[1:2,]
nrow(data)
sum(is.na(data$Ozone)) #missing values over column
mean(data$Ozone, na.rm = TRUE)
mean(data$Ozone)
m <- subset(data, Ozone >10 , select = c("State","Minor.Population","Education.Expenditures"))

newdata <- data[ which(data$Ozone > 31 & data$Temp > 90), ]
mean(newdata$Solar.R , na.rm = TRUE)

newdata <- data[ which(data$Month == 6), ]
mean(newdata$Temp, na.rm = TRUE)

newdata <- data[ which(data$Month == 5), ]
max(newdata$Ozone, na.rm = TRUE)
#install.packages("swirl")
#library(swirl) #load swirl #help.start()
?c #nos esntrega ayuda sobre la funcion, sin parentesis


##workspace and files 
list.files() #listar todos los archivos en el directorio de trabajo
?list.files #help for list.files function
args(list.files) # para listar los argumentos de la funcion
old.dir <- getwd() # se le asigna el antiguo directorio a old.dir
dir.create("testdir") # se crea el nuevo directorio de nombre "testdir"
setwd("packageFiles") #set working directory to "testdir
file.create("mytest.R") #crear el nuevo archivo "mytest.R"
file.exists("mytest.R") # preguntar si existe el argumento en el directorio
file.info("mytest.R") # informacion sobre el argumento
file.info("mytest.R")$mode
file.rename("mytest.R","mytest2.R")
file.remove('mytest.R') # eliminar el argumento del workspace
file.copy("mytest2.R","mytest3.R") #copia del primero archivo al segund( nuevo archivo)
file.path("mytest3.R") #el nuevo file path es el argumento
file.path('folder1','folder2') # directorios independientes
dir.create(file.path("testdir2", "testdir3"),recursive = TRUE) # crear directorio y subdirectorio
setwd(old.dir) #volver al antiguom direcdorio

##Secuencias de numeros
1:20
pi:10
15:1
?`:`
seq(1,20) # tambien nos crea una secuencia, es lo mismo que usar 1:20
seq(0, 10, by=0.5) #aqui le indicamos de cuanto es incremento
my_seq <- seq(5, 10, length=30)
length(my_seq)
1:length(my_seq) # para dar un n cualquiera de largo
seq(along.with = my_seq) # lo mismo que lo anterior
seq_along(my_seq) # lo correcto segun R es usar esto
rep(0, times = 40) # replica el primer argumento las veces del segundo
rep(c(0, 1, 2), times = 10) # diez veces el vector (0 1 2)
rep(c(0, 1, 2), each = 10) # en este caso la cantidad de numeros del vector se distribube en orden creciente

## Vectores
num_vect <- c(0.5, 55, -10,6)
tf <- num_vect < 1 # se le asigna segun el valor logico de la comparacion
my_char <- c("My", "name", "is")
paste(my_char, collapse = " ") # es como aplicar un join de python
my_name <- c(my_char, "Rolando")
paste("Hello", "world!", sep = " ") # para unir dos palabras simples
paste(1:3, c("X","Y", "Z"), sep = "") #unir vectores numericos  y char sin espacios
paste(LETTERS, 1:4, sep = "-") # LETTERS  es el abecedario de R

## missing values
x <- c(44, NA, 5, NA)
y <- rnorm(1000) # vector de 1000 con distribucion normal estandar
z <- rep(NA, 1000) # se crea un vector con 1000 NA's
my_data <- sample(c(y, z), 100) # seleccion ramdom de los dos anteriores vectores
my_na <- is.na(my_data)
# NaN = not a number
Inf - Inf