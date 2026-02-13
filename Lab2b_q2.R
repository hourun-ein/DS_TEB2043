# Question 2
str1 <- readline("Enter string 1: ")
str2 <- readline("Enter string 2: ")

str1_lower <- tolower(str1)
str2_lower <- tolower(str2)

result <- str1_lower == str2_lower

cat("This program compare 2 strings. Both inputs are similar:", result)