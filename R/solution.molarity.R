#' This function calculates the molar concentration of something
#'  please provide:
#'  1. volume of the used substance (microliters) of interest that was dissolved in
#'  2. volume of the medium in which the substance was dissolved
#'  3. molar weight of the substance of interest
#'  4. Percentage of the substance of interest expressed as a fraction (0.37 for a 37% acid)
#'  5. substance density - rho expressed in grams per 1000000 microliteres (1 liter)
#' You will get the value of molar concentration of the calculated medium expressed in mols per liter
#' @export solution.molarity

solution.molarity <- function(substance_vol,medium_vol,molar_weight,solution_percent,substance_rho){
    #acid_vol = 10 #this is how mach microliters I took into the broth
    sample_vol = substance_vol+medium_vol # this is how big is the sample plus acid
    # molar_weight = 74.07854 # this is the molar weight of the propionic acid
    # solution_percent = 0.5 # this is the solution I prepared in the beginning
    # acid_rho= 990/1000000# the grams per liter in microliter
    substance_grams = substance_vol*solution_percent*substance_rho # this is how much the pure acid weights in the final solution
    substance_mols = substance_grams/molar_weight # this is how many mols is in this weight
    solution_molar = (substance_mols*1000000)/sample_vol # this is how molar the broth solution is
    return(solution_molar)
}

