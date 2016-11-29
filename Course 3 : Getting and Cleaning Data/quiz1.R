
## Downlading and reading CSV file
if(!file.exists("quiz1.csv")){
      file.create("quiz1.csv")
}


housing <- read.csv("quiz1.csv")

## reading EXCEL file
library("xlsx")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx",
              destfile = "try.xlsx", method = "curl")
excel <- read.xlsx("try.xlsx",1)
data <- data.frame(excel)
dat <- data[c(18:23), c(7:15)]
sum(dat$Zip*dat$Ext,na.rm=T)

## reading XML file
library("XML")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", 
              destfile = "try.xml", method = "curl")

data <- xmlTreeParse("try.xml")
rootnode <- xmlRoot(data)



direccion4 <-  "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv" 
archivo3 <- "datos3.csv"
download.file(direccion4, archivo3, method="curl")
library("data.table")
DT <- fread(input="survey.csv", sep=",")

system.time(mean(DT$pwgtp15,by=DT$SEX))

system.time(rowMeans(DT)[DT$SEX==1])
system.time(rowMeans(DT)[DT$SEX==2])

system.time(mean(datos3[datos3$SEX==1,]$pwgtp15))
system.time(mean(datos3[datos3$SEX==2,]$pwgtp15))

system.time(sapply(split(datos3$pwgtp15,datos3$SEX),mean))

system.time(mean(datos3$pwgtp15,by=datos3$SEX))

system.time(datos3[,mean(pwgtp15),by=SEX])

system.time(tapply(datos3$pwgtp15,datos3$SEX,mean))
