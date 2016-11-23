pollutantmean <- function(directory, pollutant, id = 1: 332){
        setwd(directory)
        id_to_take <- paste(formatC(id, width = 3, flag = "0"))
        id_rename <- paste(id_to_take, ".csv" , sep = "")
        
        bind_test <- data.frame()
        
        for(i in id_rename){ 
                test <- data.frame(read.csv(i))
                bind_test <- rbind(bind_test, test)
        }
        
        if (pollutant == "sulfate"){
                col_to_get_mean <- bind_test$sulfate    
        }
    
        if (pollutant == "nitrate"){
                col_to_get_mean <- bind_test$nitrate    
        }
        
        not_an <- is.na(col_to_get_mean)
        col_to_get_mean_answer <- col_to_get_mean[!not_an]
        answer <- mean(col_to_get_mean_answer)
        print(answer)
        
}

