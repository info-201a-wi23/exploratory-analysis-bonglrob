library(ggplot2)
library(dplyr)

deaths <- read.csv("us-deaths.csv", stringsAsFactors = FALSE)

state_shape <- map_data("state")

deaths <- deaths %>%
  mutate(state_name = tolower(State)) %>%
  filter(state_name != "united states")

# exploring top cause of death
# top_cause_per_state <- deaths %>%
#  group_by(Year) %>%
#  filter(Cause.Name != "All causes") %>%
#  filter(State != "united states") %>%
#  filter(Deaths == max(Deaths, na.rm = TRUE))

deaths_state_data <- deaths %>%
  filter(Year == 2017) %>%
  group_by(state_name) %>%
  filter(Cause.Name != "All causes") %>%
  filter(Deaths == max(Deaths, na.rm = TRUE)) %>%
  select(Cause.Name, state_name)

state_shape_data <- left_join(state_shape, deaths_state_data, by = c("region" = "state_name"))

blank_theme <- theme_bw() +
  theme(
    axis.line = element_blank(),
    axis.text = element_blank(),
    axis.ticks = element_blank(),
    axis.title = element_blank(),
    plot.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    panel.border = element_blank()
  )

ggplot(data = state_shape_data) +
  geom_polygon(mapping = aes(
    x = long,
    y = lat,
    group = group,
    fill = Cause.Name
  ), color = "black") +
  scale_fill_brewer(palette = "Reds") +
  coord_map() +
  labs(
    title = "Leading Cause of Death in US in 2017",
    fill = "Cause") +
  blank_theme
