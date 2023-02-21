# A function that takes in a dataset and returns a list of info about it:
library(dplyr)

deaths <- read.csv("us-deaths.csv", stringsAsFactors = FALSE)

View(deaths)

summary_info <- list()
summary_info$num_observations <- nrow(deaths)
summary_info$most_US_deaths <- deaths %>%
  filter(Deaths == max(Deaths, na.rm = TRUE)) %>%
  select(Deaths)
summary_info$most_deaths_state_count <- deaths %>%
  filter(State != "United States") %>%
  filter(Deaths == max(Deaths, na.rm = TRUE)) %>%
  select(Deaths)
summary_info$most_deaths_state <- deaths %>%
  filter(State != "United States") %>%
  filter(Deaths == max(Deaths, na.rm = TRUE)) %>%
  select(State)
summary_info$most_death_rate <- deaths %>%
  filter(State != "United States") %>%
  filter(Age.adjusted.Death.Rate == max(Age.adjusted.Death.Rate, na.rm = TRUE)) %>%
  select(Age.adjusted.Death.Rate)
summary_info$most_death_rate_state <- deaths %>%
  filter(State != "United States") %>%
  filter(Age.adjusted.Death.Rate == max(Age.adjusted.Death.Rate, na.rm = TRUE)) %>%
  select(State)
summary_info$US_leading_cause_death <- deaths %>%
  filter(Year == 2017) %>%
  filter(Cause.Name != "All causes") %>%
  filter(State == "United States") %>%
  filter(Deaths == max(Deaths, na.rm = TRUE)) %>%
  select(Cause.Name)
