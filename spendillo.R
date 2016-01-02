df <- read.csv('data.txt',sep=';',head=TRUE,dec=',')

# remove last column
df$X <- NULL

# convert date time
df$date_time <- as.POSIXct(strptime(df$date_time,'%d/%m/%Y %H:%M:%S'))

# compute sub totals
sub_totals <- aggregate(cbind(value)~category,data=df,FUN = sum)

print(sub_totals[order(sub_totals$category),])
print(sub_totals[order(-sub_totals$value),])

