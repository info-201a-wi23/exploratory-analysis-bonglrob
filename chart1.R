library(ggplot2)
library(dplyr)

deaths <- read.csv("us-deaths.csv", stringsAsFactors = FALSE)

View(deaths)

state_shape <- map_data("state")

View(state_shape)

ggplot(data = state_shape) +
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group)) +
  coord_map()

deaths <- deaths %>%
  mutate(state_name = tolower(State))

deaths_state_data <- deaths %>%
  filter(Year == 2017) %>%
  group_by(state_name) %>%
  filter(Cause.Name != "All causes") %>%
  filter(Deaths == max(Deaths, na.rm = TRUE))

View(deaths_state_data)

joined_table <- left_join(state_shape, deaths by = c(region = state_name))
