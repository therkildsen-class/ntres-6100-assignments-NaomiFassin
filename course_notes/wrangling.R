library(tidyverse)
library(skimr)
install.packages("skimr")

coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

summary(coronavirus)
skim(coronavirus)
view(coronavirus)
head(coronavirus)
tail(coronavirus)


head(coronavirus$cases)



filter(coronavirus, cases > 0)

coronavirus_us <- filter(coronavirus, country == "US")
filter(coronavirus, country != "US")

filter(coronavirus, country == "US" | country == "Canada")
filter(coronavirus, country %in% c("US", "Canada"))


filter(coronavirus, country == "US" & type == "death")

filter(coronavirus, country %in% c("Denmark", "Italy", "Spain"), type == "death", date == "2021-09-16")

View(count(coronavirus, country))

select(coronavirus, date, country, type, cases)
select(coronavirus, -province)

select(coronavirus, country, lat, long)
select(coronavirus, date:cases)

select(coronavirus, 1:3)

select(coronavirus, contains("o"))

coronavirus_us <- filter (coronavirus, country == "US")

read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')
coronavirus_us2 <- select(coronavirus_us, -lat, -long, -province)

filter(coronavirus, country == "US")

coronavirus |> 
  filter(country == "US") |> 
  select(-lat, -long, -province)

coronavirus |> 
  filter(type == "death", country %in% c("US", "Canada", "Mexico")) |> 
  select(country, date, cases) |> 
  ggplot() + 
  geom_line(mapping = aes(x = date, y = cases, color = country))


coronavirus |> 
  count(country) |> 
  View()



# Vaccine data ------------------------------------------------------------

vacc <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/main/csv/covid19_vaccine.csv")

View (vacc)

max(vacc$date)

vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population) |> 
  mutate(vaxrate = round(people_at_least_one_dose / population, 1))

vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |>
  mutate(doses_per_vaxxed = doses_admin / people_at_least_one_dose) |> 
  ggplot() + 
  geom_histogram(mapping = aes(x = doses_per_vaxxed))

vacc |> 
  filter(date == max(date), doses_admin > 200 * 10^6) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |>
  mutate(doses_per_vaxxed = doses_admin / people_at_least_one_dose)

vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |>
  mutate(doses_per_vaxxed = doses_admin / people_at_least_one_dose) |> 
  filter(doses_per_vaxxed > 3) |> 
  arrange(-doses_per_vaxxed)

vr <- vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |>
  mutate(vaxxrate = people_at_least_one_dose / population) |> 
  filter (vaxxrate > 0.9) |> 
  arrange(-vaxxrate) |> 
  head(5)




# Summarize ---------------------------------------------------------------


