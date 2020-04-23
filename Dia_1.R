# Cargar data.table
library(data.table)

# Cargar data.table
library(nycflights13)
dim(flights)

head(flights, n = 5)


DT_flights <- data.table(flights)

aggregate(flights$dep_delay, flights[1], mean, na.rm= TRUE)
system.time(aggregate(flights$dep_delay, flights[1], mean, na.rm= TRUE))

DT_flights[,mean(dep_delay, na.rm = TRUE),by=year]
system.time(DT_flights[,mean(dep_delay, na.rm = TRUE),by=year])


aggregate(flights$dep_delay, flights[ c(1,2)], sum, na.rm= TRUE)
system.time(aggregate(flights$dep_delay, flights[ c(1,2)], sum, na.rm= TRUE))

DT_flights[,sum(dep_delay,na.rm= TRUE),by= .(year,month)]
system.time(DT_flights[,sum(dep_delay,na.rm= TRUE),by= .(year,month)])




# Crear un data.frame 
DF_1  <- data.frame( ABC= c(LETTERS[1:5], 'B', 'C'), 
                     Num = seq(10,70,10), 
                     abc_f= factor(c(letters[1:4], 'c', 'd', 'c')), 
                     Logic= 1:7>3 & 1:7<7  )


# Crear un data.table
DT_1  <- data.table( ABC= c(LETTERS[1:5], 'B', 'C'), 
                     Num = seq(10,70,10), 
                     abc_f= factor(c(letters[1:4], 'c', 'd', 'c')), 
                     Logic= 1:7>3 & 1:7<7  )


DF_1
DT_1

# Transformar data.frame a data.table
DT_2  <- data.table( DF_1 )
# Mostrar DT_2
DT_2

class(DF_1)
class(DT_1)
class(DT_2)

str(DF_1)
str(DT_1)
str(DT_2)

# DF1
mapply(identical, DF_1, DT_1)

mapply(identical, DF_1, DT_2)



rownames(DF_1) <- paste('r', 1:7, sep='')
DF_1


DF_1[ c('r1', 'r5'), ]


rownames(DT_2) <- paste('r', 1:7, sep='')
DT_2

# setkey ordena el DT_1 
setkey(DT_2, abc_f)
DT_2

rownames(DT_2)

# Crear un data.table
DT_2  <- data.table( DF_1, keep.rownames = TRUE)
# Mostrar DT_2
DT_2



# Crear un data.frame 
DF_1  <- data.frame( ABC= c(LETTERS[1:5], 'B', 'C'), 
                     Num = seq(10,70,10), 
                     abc_f= factor(c(letters[1:4], 'c', 'd', 'c')), 
                     Logic= 1:7>3 & 1:7<7  )
# Convertir a data.table
DT_1  <- data.table( DF_1  )
DT_1

mapply(identical, DF_1, DT_1)

DT_1

DT_1[ Logic== FALSE]


DT_1[ Logic== FALSE , 
      .( Var_1= sum(Num), 
         Var_2= length(ABC) )
      ]

DT_1[ Logic== FALSE , 
      .( Var_1= sum(Num), 
        Var_2= length(ABC) ), 
      by= abc_f]


# Según condición
DT_1[ Num > 40 ]


# Según posición
DT_1[ 2:4 ]



# Según condición
DF_1[ DF_1$Num > 40, ]
DF_1[ with(DF_1, Num > 40), ]
subset(DF_1, Num > 40, )

DF_1[ DF_1$Num > 40]


# Según condición
# (fijarse en la coma)
DT_1[ Num > 40 ]


DT_1[c('r5','r6', 'r7'), ] #ERROR


# Según vector lógico
DF_1[ c(T, F, T, F, T, F, T), ]


# Según vector lógico
DT_1[ c(T, F, T, F, T, F, T) ]


DF_1[ DF_1$Logic, ]

DT_1[ (Logic), ]

# ordenar filas
DF_1[order(DF_1$abc_f), ]


# ordenar filas
DT_1[ order(abc_f)]


# Por nombre de columna
DT_1[ , list(ABC)]
DT_1[ , .(ABC)]


# Según posición
DT_1[ , 1 , with= FALSE]




# En todos estos casos el resultado se simplifica a un vector
DF_1$ABC
DF_1[ , 'ABC'] 
DF_1[ , c('ABC')]
DF_1[ , 1]


# Data.table regresa un data.table por default
DT_1[ , list(ABC)]
DT_1[ , .(ABC)]
DT_1[ , 1 , with= FALSE]


DT_1[ , 'ABC'] 


# No - Trata de 'operar en j'
DT_1[ , c('ABC')]

# No - Trata de 'operar en j'
DT_1[ , 1]


DT_1[ , .(ABC, Num)]

# Según posición
DT_1[ , c(1,2) , with= FALSE]



