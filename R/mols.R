#values in microliters
#' @export prop.acid.molarity
prop.acid.molarity <- function(acid_vol){
#acid_vol = 10 #this is how mach microliters I took into the broth
broth_vol = 3000 # this is the broth volume
sample_vol = acid_vol+broth_vol # this is how big is the sample plus acid
molar_weight = 74.07854 # this is the molar weight of the propionic acid
solution_percent = 0.5 # this is the solution I prepared in the beginning
acid_rho= 990/1000000# the grams per liter in microliter
acid_grams = acid_vol*solution_percent*acid_rho # this is how much the pure acid weights in the final solution
acid_mols = acid_grams/molar_weight # this is how many mols is in this weight
broth_acid_molar = (acid_mols*1000000)/3100 # this is how molar the broth solution is
return(broth_acid_molar)
}
#concentrations <- c(1,5,10,50,100,)
