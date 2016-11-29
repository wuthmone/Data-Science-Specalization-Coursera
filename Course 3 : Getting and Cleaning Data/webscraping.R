## Reading from the Web
## Reading from the Web
con <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ")
htmlCode <- readLines(con)
close(con)
htmlCode
## using XML
require("XML")
url<-"https://scholar.google.com/citations?user=HI-I6C0AAAAJ"
html <- htmlTreeParse(url,useInternalNodes = T)
xpathSApply(html,"//title", xmlValue)

## using httr
require("httr")
html2<- GET(url)
content2 <- content(html2, as="text")
parseHtml <- htmlParse(content2, asText = T)
xpathSApply(parseHtml,"//title",xmlValue)

## Accessing websites with Passwords
pg2 <- GET("http://httphin.org/basic-auth/user/passwd", 
           authenticate("user","passwd"), method = "curl")
pg2

## using handles
google <- handle("http://google.com")
pg1 <- GET(handle = google, path="/")
pg2 <- GET(handle = googel, path="search")
