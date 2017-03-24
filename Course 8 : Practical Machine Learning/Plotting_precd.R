## Plotting predictiors 
# example data: wages

library(ISLR)
library(ggplot2)
library(caret)
data(Wage)
summary(Wage)

# Slice into train and test data

inTrain <- createDataPartition(y=Wage$wage, p=0.7, list= F)
training <- Wage[inTrain,]
testing <- Wage[-inTrain,]

dim(testing)
dim(training)

#Plotting

featurePlot(x=training[,c("age", "education", "jobclass")],
            y= training$wage, plot="pairs")
qplot(age,wage, data=training)
qplot(age,wage, colour= jobclass, data=training) # ggplot2 package
qq <- qplot(age, wage, colour = education, data = training)
qq+ geom_smooth(method = 'lm', formula = y ~ x)


library(Hmisc)
cutWage <- cut2(training$wage, g= 3) #g = group
table(cutWage)

p1 <- qplot(cutWage, age, data=training, fill=cutWage,geom = c("boxplot"))
p2 <- qplot(cutWage, age, data= training, fill=cutWage, geom=c("boxplot","jitter"))
library(gridExtra)
grid.arrange(p1,p2,ncol=2)
        
# Tables
t1 <- table(cutWage, training$jobclass)
t1
prop.table(t1,1) # probablity

#density plots
qplot(wage,colour=education, data=training, geom = "density")
