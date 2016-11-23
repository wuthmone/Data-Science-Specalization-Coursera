complete <- function(directory, id = 1:332){
                setwd(directory)
                nods<-numeric()
        for (j in id ){
                
                id_to_take <- paste(formatC(j, width = 3, flag = "0"))
                id_rename <- paste(id_to_take, ".csv" , sep = "")
                data <- data.frame(read.csv(id_rename))
                data_length <- nrow(data)
                na_data <- is.na(data)
                nods[j]<-0
                for(i in 1: data_length){
                        if(na_data[i,2]==FALSE & na_data[i,3]==FALSE){
                                nods[j] <- nods[j] + 1
                        }   
                }
        }
        
        nods <- nods[!is.na(nods)]
        
        result_id <- matrix(id)
        result_nods <- matrix(nods)
       
        final_result <- cbind(result_id,result_nods)
        colnames(final_result)<- c("id", "nods")
        final_result
       ## print(final_result)
}
 
