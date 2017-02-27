df <- read.csv2("mc.txt",sep=";",head=TRUE)
#str(df)
df$Importo <- gsub('\\.','',df$Importo)
df$Importo <- gsub(',','.',df$Importo)
df$Importo <- as.numeric(df$Importo)
e <- df[df$Importo>0,]
u <- df[df$Importo<0,]

cdc <- u[grepl("ducato",u$Causale),]
bollette <- u[grepl("hera",u$Causale),]
bonifici_fatti <- u[grepl("vostra",u$Causale),]
ricariche <- u[grepl("ricarica carta conto youweb",u$Causale),]
prelievi <- u[grepl("prelevamento",u$Causale),]
assegni <- u[grepl("assegno",u$Causale),]
f24 <- u[grepl("f24",u$Causale),]
commissioni_bonifici <- u[grepl("su bonifici",u$Causale),]
youweb <- u[grepl("canone youweb",u$Causale),]
bollo <- u[grepl("bollo",u$Causale),]
estere <- u[grepl("estere",u$Causale),]
spese_banca <- u[grepl("int\\.comp\\.\\(c\\.c\\. dep\\.\\)",u$Causale),]

misc <- u[
            !grepl("ducato",u$Causale) &
            !grepl("hera",u$Causale) &
            !grepl("vostra",u$Causale) &
            !grepl("ricarica carta conto youweb",u$Causale) &
            !grepl("prelevamento",u$Causale) &
            !grepl("assegno",u$Causale) &
            !grepl("f24",u$Causale) &
            !grepl("su bonifici",u$Causale) &
            !grepl("canone youweb",u$Causale) &
            !grepl("bollo",u$Causale) &
            !grepl("estere",u$Causale) &
            !grepl("int\\.comp\\.\\(c\\.c\\. dep\\.\\)",u$Causale)
            ,
]

spese <- data.frame(description=c("carta di credito",
                           "bollette HERA",
                           "bonifici fatti",
                           "carta di credito ricaricabile",
                           "prelievi di contante",
                           "assegni",
                           "imu",
                           "commissioni bonifici",
                           "youweb",
                           "bolli bancari",
                           "divise estere",
                           "miscellanea",
                           "spese banca"
                           ),
                    value=c(sum(cdc$Importo),
                            sum(bollette$Importo),
                            sum(bonifici_fatti$Importo),
                            sum(ricariche$Importo),
                            sum(prelievi$Importo),
                            sum(assegni$Importo),
                            sum(f24$Importo),
                            sum(commissioni_bonifici$Importo),
                            sum(youweb$Importo),
                            sum(bollo$Importo),
                            sum(estere$Importo),
                            sum(misc$Importo),
                            sum(spese_banca$Importo)
                            ))

spese_ordinate <- spese[with(spese, order(value)), ]







