install.packages(c("fastDummies","ggplot2", "dplyr", "lubridate", "caret", "randomForest"))
library(fastDummies)
library(ggplot2)
library(dplyr)
library(lubridate)
library(caret)
library(randomForest)

# Load the data
data <- read.csv("Metro_Interstate_Traffic_Volume.csv")


# 2 - Choose a relevant encoding technique to transform the categorical data to numeric format. 
data2<- data
# Using fastDummies to create dummy variables
traffic_data_dummy <- dummy_cols(data2, select_columns = c("holiday", "weather_main", "weather_description"))

dummy_holiday <- model.matrix(~holiday - 1, data = data2)
dummy_weather_main <- model.matrix(~weather_main - 1, data = data2)
dummy_weather_description <- model.matrix(~weather_description - 1, data = data2)

# Dropping the original categorical columns
traffic_data_cleaned <- traffic_data_dummy %>%
  select(-holiday, -weather_main, -weather_description)

# 5Prepare the data for the machine learning model after encoding and feature selection, predict the
#traffic volume using the machine learning model for regression.


# Splitting data into training and test sets
set.seed(123)  # Setting seed for reproducibility
index <- createDataPartition(data$traffic_volume, p = .8, list = FALSE)
train_data <- data[index, ]
test_data <- data[-index, ]

# Model Training: Using Random Forest as an example of a regression model
model <- randomForest(traffic_volume ~ temp + rain_1h + snow_1h + weather_main, data = train_data)

# Predicting Traffic Volume
predictions <- predict(model, test_data)

# Evaluate model performance
performance <- postResample(predictions, test_data$traffic_volume)
print(performance)

# 3 - Use EDA to formulate questions about the data
# Parse the date_time to R date-time object
data$date_time <- ymd_hms(data$date_time)

# Extract hour and day of the week
data$hour <- hour(data$date_time)
data$dayOfWeek <- wday(data$date_time, label = TRUE)

# Define if it's a weekend or a weekday
data$dayType <- ifelse(data$dayOfWeek %in% c("Sat", "Sun"), "Weekend", "Weekday")

# Calculate the average traffic volume per hour for weekdays and weekends
avg_traffic <- data %>%
  group_by(dayType, hour) %>%
  summarise(avg_volume = mean(traffic_volume))

# Plotting the graph with ggplot2
ggplot(avg_traffic, aes(x = hour, y = avg_volume, color = dayType)) +
  geom_line() +
  labs(title = "Average Traffic Volume per Hour", x = "Hour of the Day", y = "Average Traffic Volume") +
  scale_x_continuous(breaks = 0:23) +
  theme_minimal()



# Calculate the median traffic volume for each weather condition
median_traffic <- data %>%
  group_by(weather_main) %>%
  summarise(median_volume = median(traffic_volume)) %>%
  arrange(desc(median_volume))  # Use desc for descending order or remove it for ascending

# Joining the median traffic data back to the main data for ordering purposes
data <- data %>%
  left_join(median_traffic, by = "weather_main") %>%
  mutate(weather_main = factor(weather_main, levels = median_traffic$weather_main))  # Ordering factor levels

# Create the boxplot with ordered weather conditions and color gradient
ggplot(data, aes(x = weather_main, y = traffic_volume, fill = median_volume)) +
  geom_boxplot(show.legend = FALSE) +
  scale_fill_gradient(low = "lightblue", high = "lightgreen") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  labs(title = "Traffic Volume by Weather Conditions",
       x = "Ordered Weather Conditions",
       y = "Traffic Volume")




