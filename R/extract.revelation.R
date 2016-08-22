#' @export

extract.revelation <- function(pdf){
    require(Rpoppler)
    # pdf <- "Data/E1/T0.pdf"
    writeLines(PDF_text(pdf),"temp_pdf.txt")
    obj2 <- readLines("temp_pdf.txt")
    temp <- obj2[grep("[A-H]{1} .",obj2)]
    temp <- temp[!temp%in%obj2[grep("[^\\S][A-H]{1} .",obj2)]]
    if(length(temp)==7){
        ns <- which(obj2==temp[1])
        temp <- c(obj2[c(44,ns-1)],obj2[grep("[A-H]{1} .",obj2)])
    }
    #temp[4] <- paste("A",temp[1],temp[2])
    #temp[4:11]
    writeLines(temp,"temp_pdf.txt")
    data.m <- read.table("temp_pdf.txt",col.names = c("","c1","c2","c3","c4","c5","c6","c7","c8","c9","c10","c11","c12"))[,2:13]
    data.m[data.m[,1]=="*****",] <- NA
    return(data.m)
}