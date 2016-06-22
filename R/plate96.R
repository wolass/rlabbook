# this function makes a matrix with colnames and rownames well prepared for the experiments with 96 well plates
# this function is taking either vector of length 96 or a matrix
# it returns a matrix with colnames and rownames and prints it in the landscape or vertical forms what depends on the 'landscape' variable.


plate96 <- function(x,landscape=TRUE){
    if(landscape==TRUE){
        m.ncol=12
        if(is.vector(x)==TRUE&length(x)==96){ #check if a vector or a matric was given
            plate<-matrix(x,ncol=m.ncol)
            colnames(plate)<- as.character(c(1:12))
            rownames(plate) <- LETTERS[1:8]
        }else if(is.matrix(x)==TRUE&length(x)==96){
            plate<-x
            colnames(plate)<- as.character(c(1:12))
            rownames(plate) <- LETTERS[1:8]
        }else{
            stop("Not a vector of length 96 nor a matrix")
        }
    }else{
        m.ncol=8
        if(is.vector(x)==TRUE&length(x)==96){ #check if a vector or a matric was given
            plate<-matrix(x,ncol=m.ncol)
            rownames(plate)<- as.character(c(1:12))
            colnames(plate) <- LETTERS[1:8]
        }else if(is.matrix(x)==T&length(x)==96){
            if(ncol(x)==12){
                plate <- t(x)
                rownames(plate)<- as.character(c(1:12))
                colnames(plate) <- LETTERS[1:8]
            }else if(ncol(x)==8){
                plate <- x
                rownames(plate)<- as.character(c(1:12))
                colnames(plate) <- LETTERS[1:8]
            }else{
                stop("Matrix not conformant with the plate size. make it either 8 or 12 colums/rows")
            }

        }
    }
    return(plate)

}
