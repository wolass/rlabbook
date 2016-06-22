#' plate map function to make a quick plate map out of given conditions
#' @export plateMap
#'
plateMap <- function(rows_var_name="medium",cols_var_name="strain",rows,cols){
    db <- data.frame(well=rep(sapply(1:12,paste0,LETTERS[1:8])))
    db$medium <- rep(rows,12)
    db$strain <- unlist(lapply(cols,rep,8))
    db$Row <- rep(1:8,12)
    db$Column <- unlist(lapply(1:12,rep,8))
    names(db)<- c("well",rows_var_name,cols_var_name,"Row","Column")
    return(db)
}


