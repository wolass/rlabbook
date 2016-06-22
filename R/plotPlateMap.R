#' Ploting the graphical map of a designed template for experimental plan.
#'
#' This function will let you make a map of a 96 well plate for planning your experiments
#'
#' @param platemap is an dataframe with following variables: Column, Row, medium, strain
#' @return a ggplot
#' @author Wojciech Francuzik
#' @details this was modified from the work by Brian D. Connelly
#' @import ggplot2
#' @export plotPlateMap

plotPlateMap <- function(platemap){
    platemap$medium <- factor(platemap$medium,levels= platemap$medium[1:8])
    p<- ggplot(data=platemap, aes(x=Column, y=Row)) +
        geom_point(data=expand.grid(seq(1, 12), seq(1, 8)), aes(x=Var1, y=Var2),
                   color="grey90", fill="white", shape=21, size=6) +
        geom_point(aes(shape=strain, colour=medium), size=10) +
        #scale_color_manual(values=c("A"="blue", "B"="red", "C"="black")) +
        coord_fixed(ratio=(13/12)/(9/8), xlim=c(0.5, 12.5), ylim=c(0.5, 8.5)) +
        scale_y_reverse(breaks=seq(1, 8), labels=LETTERS[1:8]) +
        scale_x_continuous(breaks=seq(1, 12)) +
        labs(title="Plate Layout for My Experiment") +theme_bw()
    #scale_shape_manual(values=1:8)
    return(p)
}
