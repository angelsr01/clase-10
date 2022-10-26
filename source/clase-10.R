#===========================================#
# author: Eduard Fernando Martínez González
# update: 11-11-2021
# R version 4.1.1 (2021-08-10)
#===========================================#

## **[0.] Configuración inicial**

#### **☑ entorno**
rm(list=ls()) # limpiar entorno
set.seed(12345) # fijar semilla

#### **☑ Librerias:**

## llamar&instalr librerias de la clase
require(pacman)
p_load(tidyverse , rio , data.table)

## **[1.] Funciones**
browseURL("https://fhernanb.github.io/Manual-de-R/creafun.html")
browseURL("https://es.r4ds.hadley.nz/funciones.html") 
browseURL("https://www.r-bloggers.com/2016/02/functions-exercises/")
browseURL("https://adv-r.hadley.nz/conditions.html")

### **1.1 Estructura de una función**

## message, warnings & errors indican diferentes niveles de mensajes:
  
## **message:** informa resultados... etc. 
## **warnings:** informa algun tipo de error o anuncio importante que no impide el funcionamiento del programa.
## **error:** indicador sobre el fua = ncionamiento correcto de la funcion.

## Ejemplo
unir <- function(x, y){
        palabra = paste0(x," - ",y) %>% toupper()
        message(paste("message: las combinacion de las palabras producen:", palabra))
}
unir(x = "hola", y = "clase")

## Veamos otro ejemplo (...)
remove_na <- function(x) x = ifelse(is.na(x)==T,0,x)

vector <- c(1:5,rep(NA,5),11:15)

vector_2 = ifelse(is.na(vector)==T,0,vector)

vector_3 <- remove_na(x = vector)
vector

## Veamos otro ejemplo (...)
storms %>% head()

df <- storms %>% select(name,year,tropicalstorm_force_diameter) 

## 6509 NA
summary(df$tropicalstorm_force_diameter)

## replace NA por 0
df <- df %>% 
      mutate(tropicalstorm_force_diameter = remove_na(tropicalstorm_force_diameter))

summary(df$tropicalstorm_force_diameter)

## Veamos otro ejemplo: funcion que regresa el producto de un numero por si mismo
num_2 <- function(x){
         c = x*x
         return(c)
}
num_2(x = 4)
num_2(x = "A")

## incluir controles de flujo
num_2 <- function(numero){
        
         # si es un numero
         if (is.numeric(numero)){
             c = numero*numero
         return(c)
         }
        
         # si no es un numero
         if (is.numeric(numero)==F){
         warning(paste0(numero," no es un número"))
         }
}
num_2(numero = 10)
num_2(numero = "hola")
num_2(numero = "10")

###Ejemplo raíz cuadrada
num_3 <- function(x){
  c = x^(1/2)
  return(c)
}
num_3(x=4)
## #añadir condicional
num_3 <- function(x){
  if (is.numeric(x) & x>0){
    c = x^(1/2)
    return(c)
  }
  else {warning("No se puede obtener raíz")}
} 
num_3(x=0)  

## **[2.] Apply, Lapply & Sappl**

### **2.1 Apply**

####  Operaciones por columnas
mtcars
apply(X = mtcars, MARGIN = 2, FUN = min)
apply(mtcars , 2 , function(columna) min(...=columna , na.rm=T)) 

####  Operaciones por filas
apply(X = mtcars, MARGIN = 1, function(x) sum(x))

### **2.2 Lapply**

## aplicar sobre dataframe
lapply(mtcars, function(x) summary(x))
lap <- lapply(mtcars, function(x) summary(x))
lap

storms
table(is.na(storms$hu_diameter))
table(is.na(storms$ts_diameter))
lapply(storms ,function(x)  table(is.na(x)))

### **2.3 Sapply**
sap <- sapply(mtcars, summary)
sap

## **[3.] Aplicación: chip**

## limpiar entorno
rm(list=ls()) 

## Chip
browseURL("https://www.chip.gov.co/schip_rt/index.jsf")

ejemplo <- import("input/chip/2019/11767600044K212410-1220191625694914330.xls", skip = 7) %>% as_tibble()
ejemplo

## 1. Obtener rutas de los datos
list.files("input/chip",full.names=T, recursive = T) 

paths <- list.files("input/chip",full.names=T, recursive = TRUE) %>% unlist()

## 2. Hacer ejemplo para una observacion

## 2.1. leer archivo


## 2.2. obtener codigo-DANE 


## 2.3. obtener tipo de inversion


## 2.4. obtener valor


## 2.5. consolidar informacion


#----------------------#
## 3. Generalizar ejemplo en una función
f_extrac <- function(path,tipo_rubro){
  
            ## 3.1. leer archivo
            
            
            ## 3.2. obtener codigo-DANE 
            
            
            ## 3.3. obtener tipo de inversion
            
            
            ## 3.4. obtener valor
            
            
            ## 3.5. consolidar informacion 
            
            
            ## 3.6 Retornar output
  
}


