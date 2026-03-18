library(dplyr)
library(lubridate)
library(ggplot2)
coal <- read.csv('Haryana_Coal_Dataset.csv')

# Summarize by the total for each month across all plants
clean <- coal %>%
  group_by(Period) %>%
  summarize(
    Monthly_Consumption = sum(Total.Consumption, na.rm = TRUE),
  )

# Use lubridate to force "April 2023" to "2023-04-01"
clean$Period <- my(clean$Period)

# Simple Time Series Plot
ggplot(clean, aes(x = Period, y = Monthly_Consumption)) +
  geom_line(color = "lightblue", linewidth = 1) +
  geom_point(color = "steelblue", size = 3) +
  scale_x_date(date_labels = "%b %Y", date_breaks = "4 months") +
  labs(title = "Coal Consumption Over Time in Haryana Plants", x = "Date", y = "Total Coal Consumption ('000 tons)") +
  theme_minimal()

