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