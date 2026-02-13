# Create Array1
Array1 <- array(1:24, dim = c(2,4,3))

Array1

# Create Array2
Array2 <- array(25:54, dim = c(3,2,5))

Array2

cat("The second row of the second matrix of the array:\n")
Array1[2, , 2]

cat("The element in the 3rd row and 3rd column of the 1st matrix:\n")
Array2[3,2,1]