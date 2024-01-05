# Load the data
tb <- read.csv("Tb.csv")

# a) i) Calculate the mean income before pre-processing
mean_income_before <- mean(data$Income)

# Print the result
print(mean_income_before)

data <- tb

# a) iii) Calculate the mean income for the three values left after pre-processing.
#Remove rows with any missing values
data <- na.omit(data)

# Convert all negative values in the 'Income' column to positive
#Left code as comment for analysis using both cases
#data$Income <- abs(data$Income) 

# Ensure that 'Income' and 'Age' are numeric and remove rows with non-numeric values in these columns
data <- subset(data, !is.na(as.numeric(as.character(data$Income))))
data <- subset(data, !is.na(as.numeric(as.character(data$Age))))

# Convert 'Income' and 'Age' to numeric after ensuring they are not factors
data$Income <- as.numeric(as.character(data$Income))
data$Age <- as.numeric(as.character(data$Age))

# Remove rows with negative income or age
data <- subset(data, Income > 0 & Age > 0)

# Remove obvious outliers: age over 100 or under 18, extremely high or low income
# Define the income thresholds as per your understanding of what is too high or too low
low_income_threshold <- 1000 # example threshold
high_income_threshold <- 1000000 # example threshold

data <- subset(data, Age <= 100 & Age >= 18 & Income <= high_income_threshold & Income >= low_income_threshold)

# mean after cleaning data
mean_income_after <- mean(data$Income)

# View the cleaned data
print(data)

# c) Identify which columns are suitable for the categorical data types in the 
#Table 2.1 and provide the appropriate encoding scheme to replace the variables with numeric data. 

data2 <- tb

# Assuming 'Gender' and 'Marital Status' are the only categorical columns
data2$Gender <- as.numeric(factor(data$Gender))
data2$Marital.Status <- as.numeric(factor(data$Marital.Status))

