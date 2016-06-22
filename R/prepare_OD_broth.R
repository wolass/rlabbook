#' Calculate how to get a desired optical density
#'
#' This function will give a prescription for the correct OD of sample, using the
#' known OD of a bacterial broth, the volume of this brot which willl be the same a the newly aquired sample,
#' all values in microliters, for rho please use "grams/1000000" to get the correct value.
#'
#' @param is hive your measured OD here
#' @param desired the desired OD
#' @param is_vol the volum in which you curretly have the measured OD
#' @return a character string telling you what to do
#' @author Wojciech Francuzik
#' @details this function is helpfull while working in the lab
#' @export prepare_OD_broth


prepare_OD_broth <- function(is,desired,is_vol){
    take.volume <- is_vol*desired/is
    medium.vol <- is_vol-take.volume
    return(paste0("You should take ",round(take.volume,0), " microliters of bacterial suspension and add ", round(medium.vol,0), " microliters of medium to it to get ", round(is_vol,0), " microliters of broth with the OD of ", desired))
}
