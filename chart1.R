library(ggplot2)

deaths <- read.csv("us-deaths.csv", stringsAsFactors = FALSE)

View(deaths)

state_shape <- map_data("state")

View(state_shape)

ggplot(data = state_shape) +
  geom_polygon(aes(x = long,
                   y = lat,
                   group = group)) +
  coord_map()
