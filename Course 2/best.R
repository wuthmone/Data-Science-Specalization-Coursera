best <- function(state, outcome) {
        ## Read outcome data
        stored_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        ## Check that state and outcome are valid
        try(if(state %in% stored_data$State == FALSE ) stop(" invalid state\n")) 
        try(if(outcome %in% c("heart attack","heart failure","pneumonia") == FALSE) stop("invalid outcome\n")) 
        
        df <- data.frame()
        
        for(i in 1:length(stored_data$State)){
                if(stored_data$State[i] == state){
                        df <- rbind(df,stored_data[i,])
                }
                
        }
        
         ## Return hospital name in that state with lowest 30-day death rate
        if(outcome == "heart attack"){
                
                df[, 11] <- as.numeric(df[, 11])
                min_value <- min(df[,11], na.rm = TRUE)
                index <- which(df[,11] == min_value )
                df[index,2]
        }
        else if ( outcome == "heart failure") {
                df[, 17] <- as.numeric(df[, 17])
                min_value <- min(df[,17], na.rm = TRUE)
                index <- which(df[,17] == min_value )
                df[index,2]
        }
        
        else {
                df[, 23] <- as.numeric(df[, 23])
                min_value <- min(df[,23], na.rm = TRUE)
                index <- which(df[,23] == min_value )
                df[index,2]
        }
               
}

