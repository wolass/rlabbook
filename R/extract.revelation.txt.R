#' @export extract.revelation.txt

extract.revelation.txt <- function(pdf){
    data.m <- read.table(pdf,col.names = c("","c1","c2","c3","c4","c5","c6","c7","c8","c9","c10","c11","c12"),sep="")[,2:13]
    data.m[data.m[,1]=="*****",] <- NA
    return(data.m)
}
