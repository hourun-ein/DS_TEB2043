V1 <- c(2,3,1,5,4,6,8,7,9)

Matrix1 <- matrix(V1, nrow = 3, byrow = TRUE)
rownames(Matrix1) <- c("R1", "R2", "R3")
colnames(Matrix1) <- c("C1", "C2", "C3")

Matrix2 <- t(Matrix1)
rownames(Matrix2) <- c("R1", "R2", "R3")
colnames(Matrix2) <- c("C1", "C2", "C3")

Add_Result <- Matrix1 + Matrix2
Subtract_Result <- Matrix1 - Matrix2
Multiply_Element <- Matrix1 * Matrix2
Multiply_Matrix <- Matrix1 %*% Matrix2
Divide_Result <- Matrix1 / Matrix2

Matrix1
Matrix2
Add_Result
Subtract_Result
Multiply_Element
Multiply_Matrix
Divide_Result
