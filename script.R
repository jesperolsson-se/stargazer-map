library(tidyverse)
library(ggmap)

locations = read.csv(file = "./locations.csv", header = TRUE);

svg("example-plot.svg")

map_world <- map_data("world")
ggplot() +
  geom_polygon(data = map_world, aes(x = long, y = lat, group = group), fill="white") +
  borders("world", colour = "black", size = 0.1) +
  geom_point(data = locations, aes(x = Lon, y = Lat))

dev.off()
