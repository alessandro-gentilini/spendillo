df <- read.csv('data.txt',sep=';',head=TRUE,dec=',')

# remove last column
df$X <- NULL

# convert date time
df$date_time <- as.POSIXct(strptime(df$date_time,'%d/%m/%Y %H:%M:%S'))

library(xtable)

month <- function(df,date_begin,date_end,caption)
{
  month <- df[df$date_time >= as.POSIXct(strptime(date_begin,'%d/%m/%Y')) & df$date_time <= as.POSIXct(strptime(date_end,'%d/%m/%Y')),]
  month <- month[order(month$date_time),]
  sub_totals <- aggregate(cbind(value)~category,data=month,FUN = sum)
  print(xtable((sub_totals[order(-sub_totals$value),][seq(1,3),]),caption=caption))  
}

month(df,'01/01/2015','31/01/2015','Jan 2015')
month(df,'01/02/2015','28/02/2015','Feb 2015')
month(df,'01/03/2015','31/03/2015','Mar 2015')
month(df,'01/04/2015','30/04/2015','Apr 2015')
month(df,'01/05/2015','31/05/2015','May 2015')
month(df,'01/06/2015','30/06/2015','Jun 2015')
month(df,'01/07/2015','31/07/2015','Jul 2015')
month(df,'01/08/2015','31/08/2015','Aug 2015')
month(df,'01/09/2015','30/09/2015','Sep 2015')
month(df,'01/10/2015','31/10/2015','Oct 2015')
month(df,'01/11/2015','30/11/2015','Nov 2015')
month(df,'01/12/2015','31/12/2015','Dec 2015')
