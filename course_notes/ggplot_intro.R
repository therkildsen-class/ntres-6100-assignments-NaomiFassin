library(tidyverse)

mpg
?mpg

?cars
cars

View(mpg)

head(cars, 4)
tail(cars)


ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy))

ggplot(data = mpg)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = cyl, y = hwy), colour = "blue")

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class, size = cyl), shape = 1)

?geom_point

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(x = displ, y = hwy, colour = class, size = cyl), shape = 1) + 
  geom_smooth()  + 
  facet_wrap(~ year, nrow = 2) +
  theme_light()

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class)

plot1 <- ggplot(data=mpg, mapping = aes(x=displ, y=hwy)) +
  geom_point(mapping=aes (color=class, size=cyl), shape=1) +
  geom_smooth() +
  facet_wrap(~year, nrow=2) +
  theme_minimal()

plot1

ggsave(filename = "Plots/hwy_vs_displ.png", plot = plot1, width = 8, height = 4)

?ggsave


