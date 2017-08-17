#' Calculate the concentration of a substrate from a known OPTICAL DENSITY
#'
#' This function will give a calculated concentration of a subsance in 96 well 
#' plate given the optical density from a plate reader.
#' 
#' @param OD Optical density of the STANDARD DILUTION [numeric vector]
#' @param conc KNOWN concentrations of the standard dilution [numeric vector]
#' @param OD_sample Optical densities of samples [named vector]
#' @return A data frame with OD, log fitted values and calculated concentrations
#'  of the samples and a plot with a standard curve standard and blue samples
#' @author Wojciech Francuzik
#' @details This function is useful when working with old plate readers. It uses 
#' the FOUR PARAMETER CURVE to fit the model to your standards. 
#' @export elisa4ll

elisa4ll <- function(OD,conc,OD_sample){
    require(drc)
logconc <-log10(conc)# log10 from conc
stdcrvdata <- data.frame(OD,conc,logconc)
fit<-drm(formula = OD ~ conc , data = stdcrvdata, fct = LL.4())
samples <- data.frame(OD=OD_sample)# data from mesurments
samples$loganswer<- fit$coefficients[4]*
    (((-1* fit$coefficients[3]+samples$OD)/
          (fit$coefficients[2]-samples$OD))^(1/ fit$coefficients[1]))
samples$conc <- 10^samples$loganswer
plot(fit)
lines(samples$loganswer,samples$OD, type="points", col="blue") 
return(samples)
}