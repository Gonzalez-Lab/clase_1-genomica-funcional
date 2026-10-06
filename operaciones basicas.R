#operaciones basicas

tabla <- read.csv("tabla.csv")  #probar las dos
tabla <- read.csv2("tabla.csv")  # sube la tabla como un data frame

class(tabla)   # inspecciono clase de objeto

dim(tabla)

tabla$edad    # inspecciono columnas

table( tabla$fumador ) # cuenta frecuencias absolutas

#creo una columna y le asigno datos
tabla$ciudad <- c("caba","caba","caba","cordoba","cordoba","cordoba")

#otra manera de hacer lo mismo
tabla$ciudad <- c( rep("caba",3) , rep("cordoba",3) )

#exporto la tabla
write.csv2(tabla, "tabla modificada.csv")

#operaciones basicas de graficos

plot( tabla$edad ~ tabla$peso )

boxplot( tabla$edad ~ tabla$fumador )