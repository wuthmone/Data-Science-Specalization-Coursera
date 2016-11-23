corr <- function(directory, threshold = 0){
        
        d_df <- data.frame(complete(directory))
        d_nod <- d_df$nods
        d_id <- d_df$id
       answers<- numeric()
       test_df <- data.frame()
        corr_result <- vector(mode = "integer")
        
        met <-numeric()
        req_met <- vector(mode = "integer")
        for(i in 1:length(d_id)){
                
                if( d_nod[i] > threshold){
                        met <- d_id[i]
                        req_met <- c(req_met,met) 
                }
        }
        
        for (i in req_met) {
                id_to_take <- paste(formatC(i, width = 3, flag = "0"))
                id_rename <- paste(id_to_take, ".csv" , sep = "")
                test <- data.frame(read.csv(id_rename))
                na_data <- is.na(test)
                total <- length(test[,1])
                
                for(j in 1: total){
                        if(na_data[j,2]==FALSE & na_data[j,3]==FALSE){
                                test_df <- rbind(test_df, c(test[j,2],test[j,3]))
                        } 
                }
                colnames(test_df) <- c("sul","nit")
                answers <- cor(test_df$sul,test_df$nit)
                corr_result <- c(corr_result, answers)
        }
        
        return(corr_result)
}