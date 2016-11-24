##Question 1

library(httr)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("github",
                   key = "228a956ecbbe179a81d6",
                   secret = "1e820dca49ec2d33170e10e9be6c5e357ceb5272")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
try <- content(req)

# OR:
req <- with_config(gtoken, GET("https://api.github.com/rate_limit"))
stop_for_status(req)
content(req)

for(i in 1:length(try)){
        if(try[[i]]$name=="datasharing"){
                ans <- try[[i]]$created_at
        }
}
ans

##Question 2
library("sqldf")
acs <- read.csv("quiz2q2.csv")
acs <- data.frame(acs)
ans <- sqldf("select pwgtp1 from acs where AGEP < 50")

install.packages("sqldf")
library(sqldf)
acs <- read.csv("getdata_data_ss06pid.csv", header=T, sep=",")
head(acs)
sqldf("select pwgtp1 from acs where AGEP < 50")
 
## Question 4
require("httr")
hurl <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(hurl)
htmlCode <- readLines(con)
close(con)
sapply(htmlCode[c(10, 20, 30, 100)], nchar)

##Question 5
data <- read.csv("q5data.for", header=T)
head(data)
dim(data)
file_name <- "q5data.for"
df <- read.fwf(file=file_name,widths=c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4), skip=4)
head(df)
sum(df[, 4])
