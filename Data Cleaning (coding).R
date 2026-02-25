# Load required libraries
library(dplyr)
library(lubridate)
library(stringr)
library(ggplot2)

# Load dataset
df <- read.csv("C:/Users/hourun ein/OneDrive - Universiti Teknologi PETRONAS/Documents/Desktop/DS_TEB2043/online_retail_real_world.csv", stringAsFactors = FALSE)

# Remove duplicate OrderID
df_clean <- df %>% distinct(OrderID, .keep_all = TRUE)

# Convert OrderDate to Date format
df_clean$OrderDate <- mdy(df_clean$OrderDate)

# Handle missing value
df_clean <- df_clean %>% 
  mutate(
    ProdutName = ifelse(is.na(ProductName)|ProductName == "", "Unknown", ProductName),
    Brand = ifelse(is.na(Brand)|Brand == "", "Unknown", Brand)
  )%>%
  filter(!is.na(UnitPrice))

# Clean Raw weight to numeric grams
df_clean <- df_clean %>%
  mutate(
    Weight_Numeric = as.numeric(str_extract(Raw_Weight, "[0-9.]+")),
    Weight_Unit = str_extract(Raw_Weight, "[a-zA-Z]+"),
    Weight_grams = case_when(
      str_detect(Weight_Unit, "kg") ~ Weight_Numeric * 1000,
      str_detect(Weight_Unit, "mg") ~ Weight_Numeric / 1000,
      TRUE ~ Weight_Numeric
    )
  )

# Standardize Country
df_clean$Main_Country <- sapply(strsplit(as.character(df_clean$Country), ","), `[`, 1)

# Save cleaned file
write.csv(df_clean, "cleaned_online_retail.csv", row.names = FALSE)

# Visualization: Top  10 Brands by Avg Unit Price
top_brands <- df_clean %>%
  filter(Brand != "Unknown") %>%
  group_by(Brand) %>%
  summarize(Avg_Price = mean(UnitPrice, na.rm = TRUE)) %>%
  arrange(desc(Avg_Price)) %>%
  head(10)

ggplot(top_brands, aes(x = reorder(Brand, -Avg_Price), y = Avg_Price)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  theme_minimal() +
  labs(title = "Top 10 Brands by Average Unit Price",
       x = "Brand",
       y = "Average Unit Price") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Save the plot
ggsave("top_brands_price_r.png")
