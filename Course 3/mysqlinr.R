library("RMySQL")
con <- dbConnect(MySQL(), user = "root", password="thidarMoe@20", dbname = "wut", host="127.0.0.1")

result <- dbGetQuery(con, "show databases;")
allTable <- dbListTables(con)

rs <- dbSendQuery(con, "select CUSTNO from CUSTOMER ;")

data <- fetch(rs, n=5)

dbClearResult(rs)
dbDisconnect(con)