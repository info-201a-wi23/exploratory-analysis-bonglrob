library(dplyr)
library(ggplot2)

# Load the US population data
deaths <- read.csv("us-deaths.csv", stringsAsFactors = FALSE)

death_rates_2017 <- deaths %>%
  filter(Year == 2017) %>%
  select(Cause.Name, Age.adjusted.Death.Rate)

# Select the top 10 causes of death
top_10_causes <- death_rates_2017 %>%
  arrange(desc(Age.adjusted.Death.Rate)) %>%
  slice_head(n = 10) %>%
  pull(Cause.Name)

# Filter the data for the top 10 causes of death
top_10_death_rates <- deaths %>%
  filter(Cause.Name %in% top_10_causes)

# Create the line graph
ggplot(top_10_death_rates, aes(x = Year, y = Age.adjusted.Death.Rate, color = Cause.Name)) +
  geom_line() +
  labs(title = "Age-Adjusted Death Rates for Top 10 Leading Causes of Death in the US",
       x = "Year",
       y = "Death Rate (per 100,000 population)") +
  scale_y_continuous(labels = scales::comma_format()) +
  theme_bw()
