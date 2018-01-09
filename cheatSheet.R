#workspace
library()
require()
detach("package:quantmod",unload=TRUE)
attach()
suppressMessages(library())
suppressWarnings(library())
search()
sessionInfo()
save()
load()
save.image()
serialize()
dput()
dget()
dump()
source()
history(30)
history(pattern="xyz")
saveHistory("abc.Rhistory")
loadHistory("abc.Rhistory")
help(package=dplyr)
ls(package:data.table)
ls.str("package:data.table")
data()
data(package="data.table")
options(scipen="999")

#vectors
sample()
seq()
rep()
c()

#data checks/handle
complete.cases()
is.na()
na.rm()
unclass(x)
class(x)
str(x)

#date
as.Date("15-01-2018")
Sys.time()
as.POSIXct()
as.POSIXt()
as.POSIXlt()
strptime()
strftime()
as.character(Date)
format()
difftime(a,b,units="weeks")
lubridate,fCalendar (packages)

#reading
read.csv
read.table
read_csv (readr package)
read_table (readr package)
readLines()
fread() (#fastest, data.table package)

#recoding
recode() #package - car
recodevar() #package - doBy
cut()

#dataframes
data.frame(a,b,c, stringAsFactors=False)
transform()
within()
with()
cbind(df1,df2)
rbind(df1,df2)
df[order(a,b..),]
merge(df1,df2,by="colname")
subset(df,condition)
subset(df,select=c(col1,col2...),subset=(where_cond))
subset(df,select= -colname)
which()
mtcars[, -which(names(mtcars) == "carb")] #only works on single column
mtcars[, names(mtcars) != "carb"] #only works on single column
mtcars[, !names(mtcars) %in% c("carb", "mpg")]
mtcars[, -match(c("carb", "mpg"), names(mtcars))]
rownames(mtcars)
colnames(mtcars)
summary(mtcars)
dim(mtcars)
nrow(mtcars)
ncol(mtcars)
mtcars[,mtcars$colname %like% "string"]
unlist(lapply(df,function(x) any(is.na(x)))) #get col names of DF where na values exist

dplyr(select,filter,arrange, rename, mutate, transmute, group_by, summarise, %>%, join operations)
sample()

#profiling
system.time()
Rprof()
summaryRprof()
#packages profr, proftools

#plotting
pairs(df)
hist()
plot()
identify()

#strings
paste()
paste0()
length()
stringi::stri_reverse("string")

#tutorials
#kd nuggets segmentation example
#customer profiling


#check
#SAC functions (eapply,apply,rapply,sapply,tapply,vapply,lapply,mapply)
#replicate
#simplify2array

#dnorm,pnorm,qnorm,rnorm,runif
