library(datasets)
hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
airquality <- transform(airquality, Month = factor(Month))
boxplot(Ozone~Month, airquality, xlab = "Month", ylab = "Ozone(ppl)")

## Base Plote with Annotation
with(airquality, plot(Wind, Ozone))
title(main = "Ozone and Wind in New York City") # add title
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City"))
with(subset(airquality, Month == 5), points(Wind, Ozone , col ="blue" ))
with(subset(airquality, Month != 5), points(Wind, Ozone , col ="red" ))
legend("topright", pch = 1, col = c("blue","red"), legend = c("May", "Other Months"))

## Base Plote with Regression line
with(airquality, plot(Wind, Ozone, main = "Ozone and Wind in New York City", pch = 20))
model <- lm(Ozone ~ Wind, airquality)
abline(model, lwd = 2)

## Multiple base plots

par(mfrow = c(1,2)) # two colum
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar.R")
})


par(mfrow = c(1,3), mar = c(4,4,2,1), oma = c( 0,0,2,0))
with(airquality, {
        plot(Wind, Ozone, main = "Ozone and Wind")
        plot(Solar.R, Ozone, main = "Ozone and Solar.R")
        plot(Temp, Ozone, main = "Ozone and Temp")
        mtext("Ozone and Weather in New York", outer = T)
})







