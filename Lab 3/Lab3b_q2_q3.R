# Question 2

# Creating named list for student names and their scores
student_record <- list(
  names = c("Robert", "Hemsworth", "Scarlett", "Evans", "Pratt", 
            "Larson", "Holland", "Paul", "Simu", "Renner"),
  scores = c(59, 71, 83, 68, 65, 57, 62, 92, 92, 59)
)

# Extract scores from the list
exam_scores <- student_record$scores

# Perform calculations
highest_val <- max(exam_scores)
lowest_val  <- min(exam_scores)
average_val <- mean(exam_scores)

# Find the indices of highest and lowest scores
high_index <- which.max(exam_scores)
low_index  <- which.min(exam_scores)

# Retrieve names using those indices
top_student <- student_record$names[high_index]
bottom_student <- student_record$names[low_index]

# Results
cat("Highest Score:", highest_val, "\n")
cat("Lowest Score:", lowest_val, "\n")
cat("Average Score:", round(average_val, 2), "\n")
cat("Student with highest score:", top_student, "\n")
cat("Student with lowest score:", bottom_student, "\n")

# Question 3

# Add a new element to the list 
student_record$physics <- c(89, 86, 65, 52, 60, 67, 40, 77, 90, 61)
names(student_record)[2] <- "chemistry"

# Count failures (<= 49)
fail_chem <- sum(student_record$chemistry <= 49)
fail_phys <- sum(student_record$physics <= 49)

cat("Number of students who failed Chemistry:", fail_chem, "\n")
cat("Number of students who failed Physics:", fail_phys, "\n")

# Highest in Chemistry
top_chem_idx <- which.max(student_record$chemistry)
top_chem_name <- student_record$names[top_chem_idx]

# Highest in Physics
top_phys_idx <- which.max(student_record$physics)
top_phys_name <- student_record$names[top_phys_idx]

cat("Student with the highest Chemistry score:", top_chem_name, "(", max(student_record$chemistry), ")\n")
cat("Student with the highest Physics score:", top_phys_name, "(", max(student_record$physics), ")\n")

# Finds all names score = max
all_top_chem <- student_record$names[student_record$chemistry == max(student_record$chemistry)]
cat("All students with the best Chemistry score:", paste(all_top_chem, collapse = ", "))
