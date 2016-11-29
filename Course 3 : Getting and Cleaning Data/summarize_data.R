## File creating and downloading 

if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl,destfile = "./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")

## Basic data summary functions

head(restData)
tail(restData)
summary(restData)
str(restData)
quantile(restData$councilDistrict) #Quantitative
quantile(restData$councilDistrict, probs = c(0.5,0.75,0.9))
table(restData$zipCode, useNA = "ifany")
table(restData$councilDistrict,restData$zipCode) ## 2 -D table with two columns

## Check NA values

sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

## Find specific value in dataset

table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212","21213"))
restData[restData$zipCode %in% c("21211","21213"),]

## Cross tabs

data("UCBAdmissions")
DF = as.data.frame(UCBAdmissions)
summary(DF)
xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

## Flat tables

data("warpbreaks")
warpbreaks$replicate <- rep(1:9, len = 54)
xt <- xtabs(breaks ~., data = warpbreaks)
xt
ftable(xt)

## Size of data set

fakeData = rnorm(1e5)
object.size(fakeData)
print(object.size(fakeData),units="Mb")

## Creating sequences for indexing

s1 <- seq(1,10, by=2); s1
s2 <- seq(1,10, length=3);s2
x <- c(1,3,8,25,100); seq(along=x) # index for x

## Subseting variables

restData$nearMe = restData$neighborhood %in% c("Roland Park","Homeland")
table(restData$nearMe)

## Create binary variables

restData$zipWrong = ifelse(restData$zipCode < 0, T, F)
table(restData$zipWrong, restData$zipCode < 0)

## Create categorical variables

restData$zipGroups = cut(restData$zipCode,
                         breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups,restData$zipCode)

require("Hmisc") ## easier way
restData$zipGroups = cut2(restData$zipCode, g=4)
table(restData$zipGroups)

## Create factor variables

restData$zcf <- factor(restData$zipCode)
restData$zcf[1:10]

yesno<- sample(c("yes","no"), size = 10, replace = T)
yesnofac = factor(yesno, levels = c("yes","no"))
relevel(yesnofac,ref = "yes")

as.numeric(yesnofac) ## change to numeric values

require("plyr")
restData2 <- mutate(restData, zipGroups=cut2(zipCode,g=4))
table(restData2$zipGroups)

## Common transforms

abs(x) # absolute value
sqrt(x) # square root
ceiling(x) # celing(3.475) is 4
floor(x) # floor(3.475) is 3
round(x,digits = n) # round(3.474, digits = 2) is 3.48
signif(x,digits = n) # signif(3.475,digits =2) is 3.5 significant digit 
cos(x) 
sin(x)
log(x) # natural logrithm
log2(x)
log10(x)
exp(x) # exponentiating x


