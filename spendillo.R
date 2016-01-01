df <- read.csv('test_data.txt',sep=',',head=TRUE)
sub_totals <- aggregate(cbind(value)~category,data=df,FUN = sum)
print(sub_totals)
