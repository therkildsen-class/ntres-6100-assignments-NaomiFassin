library(tidyverse)
library(gapminder)


# Clean up variable names
gapminder <- gapminder |> 
  rename("life_exp" = lifeExp, "gdp_per_cap" = gdpPercap)


cntry <- "Afghanistan"
country_list <- c("Albenia", "Canada", "Spain")

dir.create("figures")
dir.create("figures/europe")

for (cntry in country_list) {

gap_to_plot <- gapminder_est |> 
  filter(country == cntry)

my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
  geom_point() +
  labs(title = str_c(cntry, "GDP", sep = " "))


ggsave(filename = str_c("figures/europe/", cntry, "_gdp_per_cap.png", sep = ""), plot = my_plot)

}

# The Europe loop
cntry <- "Belgium"
country_list <- c("Albania", "Canada", "Spain")

dir.create("figures")
dir.create("figures/europe")

country_list <- unique(gapminder$country)
gap_europe <- gapminder |>
  filter(continent == "Europe") |>
  mutate(gdp_tot = gdp_per_cap * pop)
country_list <- unique(gap_europe$country)
length(country_list)

for (cntry in country_list) {
  gap_to_plot <- gap_europe |>
    filter(country == cntry)
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "))
  print(str_c("Plotting ", cntry))
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.png", sep = ""), plot = my_plot)
}



est <- read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')

gapminder_est <- gapminder |> 
  left_join(est)

print(str_c("Plotting"))  
gap_europe <- gapminder_est |>
  filter(continent == "Europe") |>
  mutate(gdp_tot = gdp_per_cap * pop)

my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
  geom_point() +
  labs(title = str_c(cntry, "GDP", sep = " "))

if (any(gap_to_plot$estimated == "yes")) {
  print(str_c(cntry, "data are estimated")) 
  my_plot <- my_plot + 
    labs(subtitle = "Estimated data")
}



gap_europe <- gapminder_est |>
  filter(continent=="Europe") |>
  mutate(gdp=gdp_per_cap*pop)
country_list <- unique(gap_europe$country)
dir.create("figures/europe/")

for (cntry in country_list) {
  print(str_c("plotting",cntry))

  gap_to_plot <- gap_europe |>
    filter(country == cntry)
 
  my_plot <- ggplot(data = gap_to_plot, aes(x = year, y = gdp)) +
    geom_point() +

    labs(title = str_c(cntry, "GDP", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated == "yes"), "Estimated data", "Reported data"))
  
  
  if (any(gapminder_est$estimated == "yes")) {
    print(str_c(cntry, "data is estimated"))
    my_plot <-my_plot + labs(subtitle = "Estimated data")
    } else (any(gapminder_est$estimated == "no")){
    print(str_c(cntry, "data are reported"))
    my_plot <- my_plot +
      labs(subtitle = "Reported data")
    } 
  ## add the gap_figs/ folder
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp.png", sep = ""), plot = my_plot)
}






