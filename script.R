library(tidyverse)
library(ggmap)

locations = read.csv(file = "./locations.csv", header = TRUE);

svg("/output/stargazer-map.svg", width = 8, height = 4)

map_world <- map_data("world")
ggplot() +
  geom_polygon(data = map_world, aes(x = long, y = lat, group = group), fill="white") +
  borders("world", colour = "black", size = 0.1) +
  geom_point(data = locations, aes(x = Lon, y = Lat)) +
  labs(
    title = "Project popularity",
    subtitle = "Stargazers location",
    x = "",
    y = "",
    caption = "(GitHub)"
  ) +
  theme_minimal() +
  theme(panel.background = element_rect(fill = "lightblue")) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  theme(axis.text.x=element_blank(),
        axis.text.y=element_blank())

dev.off()
