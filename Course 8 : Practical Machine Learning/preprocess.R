## Preprocessing

library(caret);library(kernlab); data(spam)
inTrain <- createDataPartition(spam$type, p=0.75,list=F)
training <- spam[inTrain,]
testing <- spam[-inTrain,]
hist(training$capitalAve, main= "", xlab="ave.capital run length", ylab="Frequency")
mean(training$capitalAve)
sd(training$capitalAve)

#standardizing
#for train set
trainCapAve <- training$capitalAve
trainCapAveS <- (trainCapAve- mean(trainCapAve))/sd(trainCapAve)
mean(trainCapAveS)
sd(trainCapAveS)

#for test set
testCapAve <- testing$capitalAve
testCapAveS <- (testCapAve - mean(trainCapAve))/sd(trainCapAve) ## has to use training mean 
                                                                ## and sd to standardizing
mean(testCapAveS)

## Using standardizing
preObj <- preProcess(training[,-58], method = c("center","scale"))
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
mean(trainCapAveS)
sd(trainCapAveS)

testCapAveS <- predict(preObj, testing[,-58])$capitalAve
mean(testCapAveS)
sd(testCapAveS)

# Box- Cox transforms

preObj <- preProcess(training[,-58], method = c("BoxCox"))
trainCapAveS <- predict(preObj, training[,-58])$capitalAve
par(mfrow=c(1,2)); hist(trainCapAveS); qqnorm(trainCapAveS)

## Imputing  NA data using KNN Imput method

set.seed(13343)
# Make some NA values

training$capAve <- training$capitalAve
selectNA <- rbinom(dim(training)[1], size=1, prob=0.05)==1
training$capAve[selectNA] <-  NA

# Impute and standardize
library("RANN")
preObj <- preProcess(training[,-58], method="knnImpute")
capAve <- predict(preObj, training[,-58])$capAve
