## TIDY DATA GOALS
## Each variables forms a column
## Each observation forms a row
## Each table/file stores data about one kind of obersvation

# Melting data Frames
library("reshape2")
data(mtcars)
mtcars$carname <- rownames(mtcars)
calMelt <- melt(mtcars,id=c("carname","gear","cyl"),
                measure.vars=c("mpg","hp"))
head(calMelt,n=3)
tail(calMelt,n=3)

#Casting data frames

cylData <- dcast(calMelt, cyl ~ variable)
cylData
cylData <- dcast(calMelt, cyl ~ variable, mean)
cylData

## Averaing values
data("InsectSprays")
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

spIns <- split(InsectSprays$count,InsectSprays$spray)
spIns
sprCount <- lapply(spIns, sum)
sprCount

unlist(sprCount)
sapply(spIns, sum)

#using plyr

spraySums <-ddply(InsectSprays,.(spray),summarize,sum=sum(count))
dim(spraySums)
spraySums <-ddply(InsectSprays,.(spray),summarize,
                  sum=ave(count, FUN =sum))
head((spraySums))

acast() # for multidimensional arrays
arrange() # reording
mutate() # adding new variables


