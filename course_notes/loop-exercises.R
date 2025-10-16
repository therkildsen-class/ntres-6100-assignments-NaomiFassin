library(tidyverse)
library(gapminder)


cntry <- "Afghanistan"
country_list <- c("Albenia", "Canada", "Spain")

dir.create("figures")
dir.create("figures/europe")

for (cntry in country_list) {

gap_to_plot <- gapminder |> 
  filter(country == cntry)

my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
  geom_point() +
  labs(title = str_c(cntry, "GDP", sep = " "))


ggsave(filename = str_c("figures/europe/", cntry, "_gdp_per_cap.png", sep = ""), plot = my_plot)

}

