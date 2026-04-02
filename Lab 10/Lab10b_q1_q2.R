# Q1
# Load dataset
data(Theoph)

# View data
head(Theoph)

# Create linear model (Dose vs Weight)
model <- lm(Dose ~ Wt, data = Theoph)

# Summary
summary(model)

# Plot regression
plot(Theoph$Wt, Theoph$Dose,
     main = "Dose vs Weight",
     xlab = "Weight",
     ylab = "Dose",
     col = "blue",
     pch = 16)

abline(model, col = "red", lwd = 2)

# Prediction
new_data <- data.frame(Wt = c(90, 95, 100))
predicted_dose <- predict(model, new_data)

print(predicted_dose)

# Q2
library(class)

# Load dataset
data(ChickWeight)

# Prepare data
df <- ChickWeight

# Use only numeric features
features <- df[, c("weight", "Time")]

# Normalize (IMPORTANT)
features_scaled <- scale(features)

# Target variable
target <- df$Diet

# Split data (70% train, 30% test)
set.seed(123)
train_index <- sample(1:nrow(df), 0.7 * nrow(df))

train_x <- features_scaled[train_index, ]
test_x <- features_scaled[-train_index, ]

train_y <- target[train_index]
test_y <- target[-train_index]

# Try different K values
accuracy <- c()

for (k in 1:10) {
  pred <- knn(train = train_x, test = test_x, cl = train_y, k = k)
  acc <- mean(pred == test_y)
  accuracy <- c(accuracy, acc)
}

# Find best K
best_k <- which.max(accuracy)
cat("Best K:", best_k, "\n")

# Final prediction
final_pred <- knn(train_x, test_x, train_y, k = best_k)

# Confusion matrix
table(Predicted = final_pred, Actual = test_y)

