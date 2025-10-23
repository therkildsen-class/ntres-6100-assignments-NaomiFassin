library(tidyverse)

view(mtcars)

mtcars_6cyl <- mtcars  |> 
  filter(cyl == 6)

mtcars_4cyl <- mtcars  |> 
  filter(cyl == 4)
View(mtcars_4cyl)




library(palmerpenguins)
View(penguins)

#explore penguin dataset
glimpse(penguins)
View(penguins)

#visualize bill length by species
ggplot(data = penguins) +
  geom_boxplot(mapping = aes(x = species, y = bill_length_mm, fill = species)) +
  labs(title = "Bill Length by Species",
       x = "Species",
       y = "Bill Length (mm)") +
  theme_minimal()

#what is the relationship between body mass and flipper length? 
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_length_mm, y = body_mass_g, color = species)) +
  labs(title = "Body Mass vs Flipper Length",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)") +
  theme_minimal()



library(gapminder)
library(knitr)
library(janitor)

head(gapminder) |> kable()

gapminder_clean <- gapminder |> 
  clean_names()

glimpse(gapminder_clean)

#create a plot of gdp_per_cap vs year for each country use for 