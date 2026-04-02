# Input vector of exam scores
scores <- c(33, 24, 54, 94, 16, 89, 60, 6, 77, 61, 13, 44, 26, 24, 73, 73, 90, 39, 90, 54)

# Define the grade categories
grades <- cut(scores, 
              breaks = c(-Inf, 49, 59, 69, 79, 89, 100), 
              labels = c("F", "E", "D", "C", "B", "A"),
              include.lowest = TRUE)

# Count the number of students per grade
grade_counts <- table(grades)
print(grade_counts)

# Check if score is > 49
pass_status <- scores > 49

# Display the results alongside the scores
results <- data.frame(Score = scores, Grade = grades, Passed = pass_status)
print(results)
