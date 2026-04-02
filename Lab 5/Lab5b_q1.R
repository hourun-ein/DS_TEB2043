# Q1: Leap Year Check 
year <- as.integer(readline("Input year: "))

if ((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) {
  cat(year, "is a leap year.\n")
} else {
  cat(year, "is not a leap year.\n")
}

# Q2: Cubes
n <- as.integer(readline("Input an integer: "))

for (i in 1:n) {
  cube <- i^3
  cat("Number is:", i, "and cube of", i, "is:", cube, "\n")
}

# Q3: Armstrong Number
num <- as.integer(readline("Input an integer: "))
temp <- num
total_sum <- 0 

# Count digits accurately
digits <- nchar(abs(num)) 

while (temp > 0) {
  digit <- temp %% 10
  total_sum <- total_sum + (digit ^ digits)
  temp <- temp %/% 10 # Integer division
}

if (total_sum == num) {
  cat(num, "is an Armstrong number.\n")
} else {
  cat(num, "is not an Armstrong number.\n")
}
