rankhospital <- function(state, outcome, num = "best") {
        ## Read outcome data
        stored_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        try(if(state %in% stored_data$State == FALSE ) stop(" invalid state\n")) 
        try(if(outcome %in% c("heart attack","heart failure","pneumonia") == FALSE) stop("invalid outcome\n")) 
        
        
        ## Return hospital name in that state with the given rank 30-day death rate
        df <- data.frame()
        
        for(i in 1:length(stored_data$State)){
                if(stored_data$State[i] == state){
                        df <- rbind(df,stored_data[i,])
                }
                
        }
        
        if(outcome == "heart attack"){
                
                df[, 11] <- as.numeric(df[, 11])
                ordered11 <- df[order(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack, na.last = NA),]
                Rank <- c(1:length(ordered11$State))
                ordered11 <- cbind(ordered11,Rank)
                
                if(num == "best"){
                        index <- 1
                        ordered11 <- ordered11[order(ordered11[,11], ordered11[,2]),]
                        ordered11[index,2]
                }
                else if(num == "worst"){
                        index <- length(ordered11$State)
                        ordered11 <- ordered11[order(ordered11[,11], ordered11[,2]),]
                        ordered11[index,2]
                }
                else {
                        index <- which(ordered11[,47] == num )
                        ordered11 <- ordered11[order(ordered11[,11], ordered11[,2]),]
                        ordered11[index,2]
                }
                
       }
        else  if(outcome == "heart failure"){
                
                df[, 17] <- as.numeric(df[, 17])
                ordered17 <- df[order(df$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, na.last = NA),]
                Rank <- c(1:length(ordered17$State))
                ordered17 <- cbind(ordered17,Rank)
                
                if(num == "best"){
                        index <- 1
                        ordered17 <- ordered17[order(ordered17[,17], ordered17[,2]),]
                        ordered17[index,2]
                }
                else if(num == "worst"){
                        index <- length(ordered17$State)
                        ordered17 <- ordered17[order(ordered17[,17], ordered17[,2]),]
                        ordered17[index,2]
                }
                else {
                    
                        index <- which(ordered17[,47] == num )
                        ordered17 <- ordered17[order(ordered17[,17], ordered17[,2]),]
                        ordered17[index,2]
                }
                
        }
        else  {
                
                df[, 23] <- as.numeric(df[, 23])
                ordered23 <- df[order(df$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia, na.last = NA),]
                Rank <- c(1:length(ordered23$State))
                ordered23 <- cbind(ordered23,Rank)
                
                if(num == "best"){
                        index <- 1
                        ordered23 <- ordered23[order(ordered23[,23], ordered23[,2]),]
                        ordered23[index,2]
                }
                else if(num == "worst"){
                        index <- length(ordered23$State)
                        ordered23 <- ordered23[order(ordered23[,23], ordered23[,2]),]
                        ordered23[index,2]
                }
                else {
                        index <- which(ordered23[,47] == num )
                        ordered23 <- ordered23[order(ordered23[,23], ordered23[,2]),]
                        ordered23[index,2]
                }
                
        }
        
        
}

