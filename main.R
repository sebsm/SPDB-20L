library(readr)
library(ggplot2)
library(maps)
library(GISTools)
cliwoc <- read_csv("CLIWOC15.csv")[,c("Lon3","Lat3","Nationality")]
Latlon <- read_csv("CLIWOC15.csv")[,c("Lon3","Lat3")]

# some entries for the British have trailing whitespaces, we need to clean them up
cliwoc$Nationality <- replace (cliwoc$Nationality, which (cliwoc$Nationality == "British "), "British")
cliwoc$Nationality <- factor (cliwoc$Nationality, levels = c    ("American", "British", "Danish", "Dutch",
                                                                 "French", "Hamburg",  "Spanish", "Swedish"))

# world map
world <- map_data ("world")

ggplot() +
  geom_point(data = cliwoc, mapping = aes(Lon3,Lat3,color=Nationality), alpha=0.01,size=1) +
  geom_path(data = world, mapping = aes (long, lat, group=group), size = 0.2) +
  coord_map() +
  scale_y_continuous(expand = c(0,0), limits = c (-64,64)) +
  scale_x_continuous(expand = c(0,0)) +
  guides(colour = guide_legend(override.aes = list(alpha = 1, size = 5))) +
  scale_colour_brewer(palette="Set1")


















