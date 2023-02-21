library(dplyr)

deaths <- read.csv("us-deaths.csv", stringsAsFactors = FALSE)

table <- deaths %>%
  filter(State != "United States") %>%
  filter(Cause.Name != "All causes") %>%
  group_by(Year, State) %>%
  filter(Deaths == max(Deaths, na.rm = TRUE)) %>%
  select(Year, Cause.Name, State, Deaths, Age.adjusted.Death.Rate)

head(table)
