#' @export plate96txt
#'
plate96txt <- function(ts,times,folder,file,sam.dat){
    dbs <- lapply(paste0(folder,ts,".txt"),extract.revelation.txt)
    df<- data.frame(dbs)
    data <- tidyr::gather(df,key = "T1",value = "OD")
    data$OD <- as.numeric(data$OD)
    data$time <- unlist(lapply(times,rep,96))
    data$time <- as.POSIXct(data$time,format="%H:%M")
    data$time <- (data$time - data$time[1])/3600
    data$time <- as.numeric(data$time)
    # data$time[(96*7+1):length(data$time)] <- data$time[(96*7+1):length(data$time)]+(60*60*24)
    data$sample <-rep(sapply(1:12,paste0,LETTERS[1:8]),length(dbs))
    data$row <- rep(LETTERS[1:8],length(dbs))
    data$column <- rep(sapply(1:12,rep,8),length(dbs))
    save(data,file = paste0(folder,file))
    return(data)
}
