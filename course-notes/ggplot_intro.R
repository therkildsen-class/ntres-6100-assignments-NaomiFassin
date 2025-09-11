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



