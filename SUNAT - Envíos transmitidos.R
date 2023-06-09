#IMPORTANDO LIBRERIA
library(readxl)

#IMPORTANTO ACRHIVO DE ENVÍOS TRANSMITIDOS
MCDETA <- read_excel("C:/Users/asus/Desktop/POSTAL.xlsx")

#VISUALIZANDO EL DATA FRAME
head(MCDETA)

#COLUMNAS NECESARIAS
MCDETA1 <- MCDETA[, c("FEC_TRANSMISION", "TIPO_GUIA", "NUMCON", "NUMCONM", "FOB_CONO")]

#VISUALIZANDO EL DATA FRAME MCDETA
head(MCDETA1)

#AÑADIENDO LA COLUMNA DE MES
MCDETA1$MES <- format(MCDETA$FEC_TRANSMISION, "%y-%m")
head(MCDETA1)

#AÑADIENDO LA COLUMNA DE DIA
MCDETA1$DIA <- format(MCDETA$FEC_TRANSMISION, "%y-%m-%d")
head(MCDETA1)

#VERIFICANDO VALORES NULOS
sum(is.na(MCDETA1))

#VERIFICANDO TIPO DE DATOS
str(MCDETA1)

#SOLO 2022
MCDETA1_2022 <- subset(MCDETA1, 
                  MCDETA1$DIA>="22-01-01" &
                  MCDETA1$DIA<"23-01-01")

head(MCDETA1_2022)

#Limpiando la data quitando los DPO's que terminaron en XX que fueron error de manifiesto
MCDETA_XX <- MCDETA1[endsWith(MCDETA1$NUMCONM, "XX"),]
head(MCDETA_XX)

MCDETA1_2022 <- MCDETA1_2022[!endsWith(MCDETA1_2022$NUMCONM, "XX"),]
