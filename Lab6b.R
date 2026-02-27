#Q1: Create table in data frame 
names = c("Anastasia", "Dima", "Micheal", "Matthew", "Laura", "Kevin", "Jonas")
store = c(12.5, 9.0, 16.5, 12.0, 9.0, 8.0, 19.0)
attempts = c(1, 3, 2, 3, 2, 1, 2)
df = data.frame(names, store, attempts)
print(df)

#Q2: To add new colums "qualify"
df$qualify <- c("yes","no", "yes", "no", "no","no","yes")
newDf <- df
print(newDf)

#Q3: To add new row "Emily"
newDF = rbind(newDf, data.frame(names = "Emily",
                                store = 14.5,
                                attempts = 1,
                                qualify = "yes"))
print(newDF)

#Q4: Display summary
str(newDF) #Internal structure
summary(newDF) #Statistical summary
dim(newDF) #No. of rows and columns

# Convert character columns to Factors to get a better summary
newDF$qualify <- as.factor(newDF$qualify)

# Now check the summary again
summary(newDF)
