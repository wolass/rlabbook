# This function takes the samples vector and return a data frame
# according to the number of required timepoints

time_tied_database <- function(samples,reps,measurement="measurment"){
    sample <- rep(samples,reps)
    # timepoint <- rep("T",length(samples)*reps)
    timepoint <- as.vector(sapply(1:reps,function(x){
        rep(paste0("T",x),length(samples))
    }))
    df <- data.frame(sample,timepoint,rep(NA,length(sample)))
    colnames(df) <- c(colnames(df)[-3],measurement)
    return(df)
}
