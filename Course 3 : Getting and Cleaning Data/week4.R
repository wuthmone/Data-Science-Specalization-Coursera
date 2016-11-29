## Week 4 Lecture

if(!file.exists("camera.csv")){
        file.create("camera.csv")
}
url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(url, destfile = "camera.csv", method = "curl")
cameraData <- read.csv("camera.csv")
names(cameraData)<- tolower(names(cameraData))

names(cameraData)

splitNames <- strsplit(names(cameraData), "\\.")
splitNames[[6]][1]

gsub("_", "", string) # replace
grep("Alameda", cameraData$intersection, value = T) # match return
table(grepl("Alameda", cameraData$intersection) ) ## resturn ture or fasle value

firstElement <- function(x){x[1]}
sapply(splitNames,firstElement)

#working with string
library(stringr)
nchar()
subst()
paste("","") #with space
paste0("","") #without space

## Regular Expressions

#^i think match with  start
#moringin$  #match the line
        
        
#[Bb][Uu][Ss][Hh] -> match all cap or lower letter
#^[Ii] #
#^[0-9][a-aA-Z] -> match the line starting with 0 to 9 follow by letter
# [^?.]$
#9.11 -> used to refer to any character
#flood|fire ->matach fire or flood
#^([Gg]ood|[Bb]ad)

# (.*) -> any number, including none eg. (24,m,germany)
# .+ -> at least one of them


## Working with Date

d1 = date()
d1
class(d1)
d2 = Sys.Date()
d2
class(d2)

format(d2, "%a %b %d") #-> "Fri Nov 25"
format(d2, "%d %B %Y") #-> "25 November 2016
format(d2, "%A %m %y") #-> "Friday 11 16"

x <- c("1jan1960","2jan1960"); z = as.Date(x,"%d%b%Y")
z
z[1]-z[2]

weekdays(d2)
months(d2)
julian(d2)

install.packages("lubridate")
library(lubridate); ymd("20140108")
mdy("08/04/2013")
dmy("03-04-2013")
wday() == weekdays()


?Sys.timezone

