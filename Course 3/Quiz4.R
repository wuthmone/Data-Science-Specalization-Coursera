#Question 1


if (!file.exists("survey1.csv")) {
        file.create("survey1.csv")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile="survey1.csv", method="curl")

surveyData <- read.csv("survey1.csv")
names(surveyData)<- tolower(names(surveyData))

splitList <- strsplit(names(surveyData), "wgtp")
splitList[[123]] # "" "15"

# Question 2
        
downloadDir <- './data'
if (!file.exists(downloadDir)) {
        dir.create(downloadDir)
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv "
dataFile <- file.path(paste(downloadDir, "getdata_data_GDP.csv", sep="/"))
download.file(fileUrl, destfile=dataFile, method="curl")

gdpData <- read.csv(dataFile, stringsAsFactors = FALSE, skip=4, nrows=215, col.names=c("CountryCode", "Rank", "Empty1", "Fullname", "GDP", "Empty3", "Empty4", "Empty5", "Empty6", "Empty7"))
gdpData$GDP <- gsub(x=gdpData$GDP, pattern = ",", replacement = "")
gdpData$GDP <- as.numeric(gdpData$GDP)
mean(gdpData$GDP, na.rm = TRUE) # 377652.4

#Question 3
length(grep(pattern = "^United", gdpData$Fullname))

#Question 4
edu <- read.csv("edu.csv")
edu <- tbl_df(edu)
gdp <- read.csv("gdp.csv", header = T)
gdp <- tbl_df(gdp)

# Cleaning to get tidy data
gdp <- rename(gdp, CountryCode = X , Ranking = Gross.domestic.product.2012, Economy = X.2 , USD = X.3 )
gdp <- select(gdp, CountryCode, Ranking, Economy)
gdp <- gdp[-(1:4),]


mergedData <- merge(gdp, edu, by.x="CountryCode", by.y="CountryCode", all=FALSE)

length(mergedData$Special.Notes[grep("Fiscal year end: June", mergedData$Special.Notes)])

# Question 5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 
years <- format(sampleTimes, "%Y")
sampleTimes <-sampleTimes[years==2012]
length(sampleTimes)
length(weekdays(sampleTimes)[weekdays(sampleTimes)=="Monday"])

