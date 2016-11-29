#Question 1

## Load the data
if(!file.exists("ansuv.csv")){
        file.create("ansuv.csv")
}

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url, destfile = "ansuv.csv", method = "curl")
data <- read.csv("ansuv.csv")

library("dplyr")
data <- tbl_df(data)
req <- select(data, AGS, ACR)
agricultureLogical <- req$AGS == 6 & req$ACR == 3
result <- which(agricultureLogical)
head(result, n=3)
#ans : 125 238 262

#Question 2

install.packages("jpeg")
require("jpeg")
if(!file.exists("Fjeff.jpg")){
        file.create("Fjeff.jpg")
}

url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(url, destfile = "Fjeff.jpg", method = "curl")
result2 <- readJPEG("Fjeff.jpg",native = T)
quantile(result2,0.3)
quantile(result2,0.8)

## ans: -15259150 -10575416

## Question 3
if(!file.exists("gdp.csv")){
        file.create("gdp.csv")
}
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(url, destfile = "gdp.csv", method = "curl")
gdp <- read.csv("gdp.csv", header = T)
gdp <- tbl_df(gdp)

# Cleaning to get tidy data
gdp <- rename(gdp, CountryCode = X , Ranking = Gross.domestic.product.2012, Economy = X.2 , USD = X.3 )
gdp <- select(gdp, CountryCode, Ranking, Economy)
gdp <- gdp[-(1:4),]



if(!file.exists("edu.csv")){
        file.create("edu.csv")
}
url <-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv" 
download.file(url, destfile = "edu.csv", method = "curl")
edu <- read.csv("edu.csv")
edu <- tbl_df(edu)

## Matching the data


newdf$Ranking <- gsub(",", "", newdf$Ranking)
newdf[,"Ranking"] <- as.numeric(newdf[,"Ranking"])
nrow(newdf[!is.na(newdf$Ranking),])
newdf <- arrange(newdf, desc(Ranking))
newdf[13,3]

# Question 4 

 HO <- filter(newdf, Income.Group == "High income: OECD")
 HNO <- filter(newdf, Income.Group == "High income: nonOECD")
 HoR <- select(HO, Ranking)
 HnoR <- select(HNO, Ranking)
 mean(HoR$Ranking); mean(HnoR$Ranking, na.rm = T)
 
## Question 5
 
 breaks <- quantile(newdf$Ranking, probs= seq(0,1,0.2), na.rm = T)
 newdf$quantileGDP <- cut(newdf$Ranking, breaks = breaks)
 
 newdf[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
 
  new <- select(newdf, Ranking, quantilDP, Income.Group)
  new <- filter(new, Income.Group == "Lower middle income")
  
  

