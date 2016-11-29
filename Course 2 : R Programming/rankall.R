rankall <- function(outcome, num = "best") {
        ## Read outcome data
       stored_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
        
        df <- data.frame()
        size <- unique(stored_data$State)
        hospital <- vector()
        state <- unique(stored_data$State)
      
        for (i in size){
                each <- rankhospital(i,outcome, num)
                print(i)
                print(each)
                
        }
     
        ## For each state, find the hospital of the given rank
        ## Return a data frame with the hospital names and the
        ## (abbreviated) state name
}
