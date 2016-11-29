source("https://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)

## Reading from HDF5
created <- h5createFile("h5examp.h5")
created <- h5createGroup("h5examp.h5","wut")
created <- h5createGroup("h5examp.h5","hmone")
created <- h5createGroup("h5examp.h5","wut/hlaing")

try_matrix <- matrix(1:10, nrow = 5, ncol = 1)
h5write(try_matrix,"h5examp.h5","wut/try_matrix")
try_matrix1 <- array(seq(0.1,2.0, by=0.1), dim=c(5,2,2))
attr(try_matrix1,"scale") <- "liter"
h5write(try_matrix1,"h5examp.h5","wut/hlaing/try_matrix1")

readtry_matirx <- h5read("h5examp.h5", "wut/try_matrix")
readtry_matirx