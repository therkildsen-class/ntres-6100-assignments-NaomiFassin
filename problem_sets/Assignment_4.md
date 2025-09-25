# assignment_1
NF

# Assignment 4

## Load packages

To start, load all the required packages with the following code.
Install them if they are not installed yet.

``` r
library(tidyverse)
```

    ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ✔ forcats   1.0.0     ✔ stringr   1.5.1
    ✔ ggplot2   3.5.2     ✔ tibble    3.3.0
    ✔ lubridate 1.9.4     ✔ tidyr     1.3.1
    ✔ purrr     1.1.0     
    ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ✖ dplyr::filter() masks stats::filter()
    ✖ dplyr::lag()    masks stats::lag()
    ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

``` r
library(knitr)
```

## Exercise 1. Corruption and human development

This exercise explores a dataset containing the human development index
(`HDI`) and corruption perception index (`CPI`) of 173 countries across
6 different regions around the world: Americas, Asia Pacific, Eastern
Europe and Central Asia (`East EU Cemt`), Western Europe
(`EU W. Europe`), Middle East and North Africa and Noth Africa (`MENA`),
and Sub-Saharan Africa (`SSA`). (Note: the larger `CPI` is, the less
corrupted the country is perceived to be.)

First, we load the data using the following code.

#### 1.1 Show the first few rows of `economist_data`.

``` r
kable(head(economist_data))
```

|  …1 | Country     | HDI.Rank |   HDI | CPI | Region            |
|----:|:------------|---------:|------:|----:|:------------------|
|   1 | Afghanistan |      172 | 0.398 | 1.5 | Asia Pacific      |
|   2 | Albania     |       70 | 0.739 | 3.1 | East EU Cemt Asia |
|   3 | Algeria     |       96 | 0.698 | 2.9 | MENA              |
|   4 | Angola      |      148 | 0.486 | 2.0 | SSA               |
|   5 | Argentina   |       45 | 0.797 | 3.0 | Americas          |
|   6 | Armenia     |       86 | 0.716 | 2.6 | East EU Cemt Asia |

#### 1.2 Expore the relationship between human development index (`HDI`) and corruption perception index (`CPI`) with a scatter plot as the following.

``` r
ggplot(data = economist_data) +
  geom_point(mapping = aes(x = CPI, y = HDI))
```

![](Assignment_4_files/figure-commonmark/unnamed-chunk-4-1.png)

#### 1.3 Make the color of all points in the previous plot red.

``` r
ggplot(data = economist_data) +
  geom_point(mapping = aes(x = CPI, y = HDI), color = "red")
```

![](Assignment_4_files/figure-commonmark/unnamed-chunk-5-1.png)

#### 1.4 Color the points in the previous plot according to the `Region` variable, and set the size of points to 2.

``` r
ggplot(economist_data) +
  geom_point(mapping = aes(x = CPI, y = HDI, color = Region), size = 2)
```

![](Assignment_4_files/figure-commonmark/unnamed-chunk-6-1.png)

#### 1.5 Set the size of the points proportional to `HDI.Rank`

``` r
ggplot(economist_data) +
  geom_point(mapping = aes(x = CPI, y = HDI, color = Region, size = HDI.Rank))
```

![](Assignment_4_files/figure-commonmark/unnamed-chunk-7-1.png)

#### 1.6 Fit a **smoothing line** to **all** the data points in the scatter plot from Excercise 1.4

``` r
ggplot(economist_data, mapping = aes(x = CPI, y = HDI)) +
  geom_point(mapping = aes(x = CPI, y = HDI, color = Region), size = 2) + 
  geom_smooth()
```

    `geom_smooth()` using method = 'loess' and formula = 'y ~ x'

![](Assignment_4_files/figure-commonmark/unnamed-chunk-8-1.png)

#### 1.7 Fit a separate **straight line** for **each region** instead, and turn off the confidence interval.

``` r
ggplot(economist_data, mapping = aes(x = CPI, y = HDI, color = Region)) +
  geom_point(size = 2) + 
  geom_smooth(method = "lm", se = FALSE)
```

    `geom_smooth()` using formula = 'y ~ x'

![](Assignment_4_files/figure-commonmark/unnamed-chunk-9-1.png)

#### 1.8 Building on top of the previous plot, show each `Region` in a different facet.

``` r
ggplot(economist_data, mapping = aes(x = CPI, y = HDI, color = Region)) +
  geom_point(size = 2) + 
  geom_smooth(method = "lm", se = FALSE) + 
  facet_wrap(~Region)
```

    `geom_smooth()` using formula = 'y ~ x'

![](Assignment_4_files/figure-commonmark/unnamed-chunk-10-1.png)

#### 1.9 Show the distribution of `HDI` in each region using density plot. Set the transparency to 0.5

``` r
ggplot(economist_data) +
  geom_density(mapping = aes(x = HDI,  fill = Region), alpha = 0.5)
```

![](Assignment_4_files/figure-commonmark/unnamed-chunk-11-1.png)

#### 1.10 Show the distribution of `HDI` in each region using histogram and facetting.

``` r
ggplot(economist_data) + 
  geom_histogram(mapping = aes(x = HDI, color = Region, fill = Region)) + 
  facet_wrap(~ Region)
```

    `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](Assignment_4_files/figure-commonmark/unnamed-chunk-12-1.png)

#### 1.11 Show the distribution of `HDI` in each region using a box plot. Set the transparency of these boxes to 0.5 and do not show outlier points with the box plot. Instead, show all data points for each country in the same plot. (Hint: `geom_jitter()` or `position_jitter()` might be useful.)

``` r
ggplot(economist_data, mapping = aes(x = Region, y = HDI, color = Region)) + 
  geom_boxplot(mapping = aes(fill = Region), alpha = 0.5) + 
  geom_jitter()
```

![](Assignment_4_files/figure-commonmark/unnamed-chunk-13-1.png)

#### 1.12 Show the count of countries in each region using a bar plot.

``` r
ggplot(economist_data) + 
  geom_bar(mapping = aes(x = Region))
```

![](Assignment_4_files/figure-commonmark/unnamed-chunk-14-1.png)

#### 1.13 You have now created a variety of different plots of the same dataset. Which of your plots do you think are the most informative? Describe briefly the major trends that you see in the data.

The most informative might be the plot for 1.7 or 1.8, since it computes
CPI and HDI, and clearly shows the trends in different regions of the
world. It seems like there is a correlation of lower the CPI, lower the
HDI, across all region. SSA seems to have both lowest CPI and HDI, and
EU W. Europe has the highest.

## Exercise 2. Theophylline experiment

This exercise uses the `Theoph` data frame (comes with your R
installation), which has 132 rows and 5 columns of data from an
experiment on the pharmacokinetics of the anti-asthmatic drug
theophylline. Twelve subjects were given oral doses of theophylline then
serum concentrations were measured at 11 time points over the next 25
hours. You can learn more about this dataset by running `?Theoph`

Have a look at the data structure

``` r
kable(view(Theoph))
```

| Subject |   Wt | Dose |  Time |  conc |
|:--------|-----:|-----:|------:|------:|
| 1       | 79.6 | 4.02 |  0.00 |  0.74 |
| 1       | 79.6 | 4.02 |  0.25 |  2.84 |
| 1       | 79.6 | 4.02 |  0.57 |  6.57 |
| 1       | 79.6 | 4.02 |  1.12 | 10.50 |
| 1       | 79.6 | 4.02 |  2.02 |  9.66 |
| 1       | 79.6 | 4.02 |  3.82 |  8.58 |
| 1       | 79.6 | 4.02 |  5.10 |  8.36 |
| 1       | 79.6 | 4.02 |  7.03 |  7.47 |
| 1       | 79.6 | 4.02 |  9.05 |  6.89 |
| 1       | 79.6 | 4.02 | 12.12 |  5.94 |
| 1       | 79.6 | 4.02 | 24.37 |  3.28 |
| 2       | 72.4 | 4.40 |  0.00 |  0.00 |
| 2       | 72.4 | 4.40 |  0.27 |  1.72 |
| 2       | 72.4 | 4.40 |  0.52 |  7.91 |
| 2       | 72.4 | 4.40 |  1.00 |  8.31 |
| 2       | 72.4 | 4.40 |  1.92 |  8.33 |
| 2       | 72.4 | 4.40 |  3.50 |  6.85 |
| 2       | 72.4 | 4.40 |  5.02 |  6.08 |
| 2       | 72.4 | 4.40 |  7.03 |  5.40 |
| 2       | 72.4 | 4.40 |  9.00 |  4.55 |
| 2       | 72.4 | 4.40 | 12.00 |  3.01 |
| 2       | 72.4 | 4.40 | 24.30 |  0.90 |
| 3       | 70.5 | 4.53 |  0.00 |  0.00 |
| 3       | 70.5 | 4.53 |  0.27 |  4.40 |
| 3       | 70.5 | 4.53 |  0.58 |  6.90 |
| 3       | 70.5 | 4.53 |  1.02 |  8.20 |
| 3       | 70.5 | 4.53 |  2.02 |  7.80 |
| 3       | 70.5 | 4.53 |  3.62 |  7.50 |
| 3       | 70.5 | 4.53 |  5.08 |  6.20 |
| 3       | 70.5 | 4.53 |  7.07 |  5.30 |
| 3       | 70.5 | 4.53 |  9.00 |  4.90 |
| 3       | 70.5 | 4.53 | 12.15 |  3.70 |
| 3       | 70.5 | 4.53 | 24.17 |  1.05 |
| 4       | 72.7 | 4.40 |  0.00 |  0.00 |
| 4       | 72.7 | 4.40 |  0.35 |  1.89 |
| 4       | 72.7 | 4.40 |  0.60 |  4.60 |
| 4       | 72.7 | 4.40 |  1.07 |  8.60 |
| 4       | 72.7 | 4.40 |  2.13 |  8.38 |
| 4       | 72.7 | 4.40 |  3.50 |  7.54 |
| 4       | 72.7 | 4.40 |  5.02 |  6.88 |
| 4       | 72.7 | 4.40 |  7.02 |  5.78 |
| 4       | 72.7 | 4.40 |  9.02 |  5.33 |
| 4       | 72.7 | 4.40 | 11.98 |  4.19 |
| 4       | 72.7 | 4.40 | 24.65 |  1.15 |
| 5       | 54.6 | 5.86 |  0.00 |  0.00 |
| 5       | 54.6 | 5.86 |  0.30 |  2.02 |
| 5       | 54.6 | 5.86 |  0.52 |  5.63 |
| 5       | 54.6 | 5.86 |  1.00 | 11.40 |
| 5       | 54.6 | 5.86 |  2.02 |  9.33 |
| 5       | 54.6 | 5.86 |  3.50 |  8.74 |
| 5       | 54.6 | 5.86 |  5.02 |  7.56 |
| 5       | 54.6 | 5.86 |  7.02 |  7.09 |
| 5       | 54.6 | 5.86 |  9.10 |  5.90 |
| 5       | 54.6 | 5.86 | 12.00 |  4.37 |
| 5       | 54.6 | 5.86 | 24.35 |  1.57 |
| 6       | 80.0 | 4.00 |  0.00 |  0.00 |
| 6       | 80.0 | 4.00 |  0.27 |  1.29 |
| 6       | 80.0 | 4.00 |  0.58 |  3.08 |
| 6       | 80.0 | 4.00 |  1.15 |  6.44 |
| 6       | 80.0 | 4.00 |  2.03 |  6.32 |
| 6       | 80.0 | 4.00 |  3.57 |  5.53 |
| 6       | 80.0 | 4.00 |  5.00 |  4.94 |
| 6       | 80.0 | 4.00 |  7.00 |  4.02 |
| 6       | 80.0 | 4.00 |  9.22 |  3.46 |
| 6       | 80.0 | 4.00 | 12.10 |  2.78 |
| 6       | 80.0 | 4.00 | 23.85 |  0.92 |
| 7       | 64.6 | 4.95 |  0.00 |  0.15 |
| 7       | 64.6 | 4.95 |  0.25 |  0.85 |
| 7       | 64.6 | 4.95 |  0.50 |  2.35 |
| 7       | 64.6 | 4.95 |  1.02 |  5.02 |
| 7       | 64.6 | 4.95 |  2.02 |  6.58 |
| 7       | 64.6 | 4.95 |  3.48 |  7.09 |
| 7       | 64.6 | 4.95 |  5.00 |  6.66 |
| 7       | 64.6 | 4.95 |  6.98 |  5.25 |
| 7       | 64.6 | 4.95 |  9.00 |  4.39 |
| 7       | 64.6 | 4.95 | 12.05 |  3.53 |
| 7       | 64.6 | 4.95 | 24.22 |  1.15 |
| 8       | 70.5 | 4.53 |  0.00 |  0.00 |
| 8       | 70.5 | 4.53 |  0.25 |  3.05 |
| 8       | 70.5 | 4.53 |  0.52 |  3.05 |
| 8       | 70.5 | 4.53 |  0.98 |  7.31 |
| 8       | 70.5 | 4.53 |  2.02 |  7.56 |
| 8       | 70.5 | 4.53 |  3.53 |  6.59 |
| 8       | 70.5 | 4.53 |  5.05 |  5.88 |
| 8       | 70.5 | 4.53 |  7.15 |  4.73 |
| 8       | 70.5 | 4.53 |  9.07 |  4.57 |
| 8       | 70.5 | 4.53 | 12.10 |  3.00 |
| 8       | 70.5 | 4.53 | 24.12 |  1.25 |
| 9       | 86.4 | 3.10 |  0.00 |  0.00 |
| 9       | 86.4 | 3.10 |  0.30 |  7.37 |
| 9       | 86.4 | 3.10 |  0.63 |  9.03 |
| 9       | 86.4 | 3.10 |  1.05 |  7.14 |
| 9       | 86.4 | 3.10 |  2.02 |  6.33 |
| 9       | 86.4 | 3.10 |  3.53 |  5.66 |
| 9       | 86.4 | 3.10 |  5.02 |  5.67 |
| 9       | 86.4 | 3.10 |  7.17 |  4.24 |
| 9       | 86.4 | 3.10 |  8.80 |  4.11 |
| 9       | 86.4 | 3.10 | 11.60 |  3.16 |
| 9       | 86.4 | 3.10 | 24.43 |  1.12 |
| 10      | 58.2 | 5.50 |  0.00 |  0.24 |
| 10      | 58.2 | 5.50 |  0.37 |  2.89 |
| 10      | 58.2 | 5.50 |  0.77 |  5.22 |
| 10      | 58.2 | 5.50 |  1.02 |  6.41 |
| 10      | 58.2 | 5.50 |  2.05 |  7.83 |
| 10      | 58.2 | 5.50 |  3.55 | 10.21 |
| 10      | 58.2 | 5.50 |  5.05 |  9.18 |
| 10      | 58.2 | 5.50 |  7.08 |  8.02 |
| 10      | 58.2 | 5.50 |  9.38 |  7.14 |
| 10      | 58.2 | 5.50 | 12.10 |  5.68 |
| 10      | 58.2 | 5.50 | 23.70 |  2.42 |
| 11      | 65.0 | 4.92 |  0.00 |  0.00 |
| 11      | 65.0 | 4.92 |  0.25 |  4.86 |
| 11      | 65.0 | 4.92 |  0.50 |  7.24 |
| 11      | 65.0 | 4.92 |  0.98 |  8.00 |
| 11      | 65.0 | 4.92 |  1.98 |  6.81 |
| 11      | 65.0 | 4.92 |  3.60 |  5.87 |
| 11      | 65.0 | 4.92 |  5.02 |  5.22 |
| 11      | 65.0 | 4.92 |  7.03 |  4.45 |
| 11      | 65.0 | 4.92 |  9.03 |  3.62 |
| 11      | 65.0 | 4.92 | 12.12 |  2.69 |
| 11      | 65.0 | 4.92 | 24.08 |  0.86 |
| 12      | 60.5 | 5.30 |  0.00 |  0.00 |
| 12      | 60.5 | 5.30 |  0.25 |  1.25 |
| 12      | 60.5 | 5.30 |  0.50 |  3.96 |
| 12      | 60.5 | 5.30 |  1.00 |  7.82 |
| 12      | 60.5 | 5.30 |  2.00 |  9.72 |
| 12      | 60.5 | 5.30 |  3.52 |  9.75 |
| 12      | 60.5 | 5.30 |  5.07 |  8.57 |
| 12      | 60.5 | 5.30 |  7.07 |  6.59 |
| 12      | 60.5 | 5.30 |  9.03 |  6.11 |
| 12      | 60.5 | 5.30 | 12.05 |  4.57 |
| 12      | 60.5 | 5.30 | 24.15 |  1.17 |

For the following exercise, **transform the data as instructed**. Try to
use `tidyverse` functions even if you are more comfortable with base-R
solutions. Show the **first 6 lines** of the transformed data in a table
through RMarkdown **using the kable() function**, as shown above.

#### 2.1 Select columns that contain a lower case “t” in the `Theoph` dataset. Do not manually list all the columns to include.

``` r
## Write your code here
```

#### 2.2 Rename the `Wt` column to `Weight` and `conc` column to `Concentration` in the `Theoph` dataset.

``` r
## Write your code here
```

#### 2.3 Extract the `Dose` greater than 4.5 and `Time` greater than the mean `Time`.

``` r
## Write your code here
```

#### 2.4 Sort the `Theoph` dataset by `Wt` from smallest to largest and secondarily by Time from largest to smallest.

``` r
## Write your code here
```

#### 2.5 Create a new column called `Quantity` that equals to `Wt` x `Dose` in the `Theoph` dataset. This will tell you the absolute quantity of drug administered to the subject (in mg). Replace the `Dose` variable with `Quantity`.

``` r
## Write your code here
```

#### 2.6 Find the mean `conc` and sum of the `Dose` received by each test subject.

Show data for the 6 subjects with the smallest sum of `Dose` as below.
**Do not define new intermediate objects for this exercise; use pipes to
chain together functions.**

``` r
## Write your code here
```

## Exercise 3. Unemployment in the US 1967-2015 (**OPTIONAL**)

This excercise uses the dataset `economics` from the ggplot2 package. It
was produced from US economic time series data available from
<http://research.stlouisfed.org/fred2>. It descibes the number of
unemployed persons (`unemploy`), among other variables, in the US from
1967 to 2015.

``` r
head(economics) %>% kable()
```

| date       |   pce |    pop | psavert | uempmed | unemploy |
|:-----------|------:|-------:|--------:|--------:|---------:|
| 1967-07-01 | 506.7 | 198712 |    12.6 |     4.5 |     2944 |
| 1967-08-01 | 509.8 | 198911 |    12.6 |     4.7 |     2945 |
| 1967-09-01 | 515.6 | 199113 |    11.9 |     4.6 |     2958 |
| 1967-10-01 | 512.2 | 199311 |    12.9 |     4.9 |     3143 |
| 1967-11-01 | 517.4 | 199498 |    12.8 |     4.7 |     3066 |
| 1967-12-01 | 525.1 | 199657 |    11.8 |     4.8 |     3018 |

| date       |   pce |    pop | psavert | uempmed | unemploy |
|:-----------|------:|-------:|--------:|--------:|---------:|
| 1967-07-01 | 506.7 | 198712 |    12.6 |     4.5 |     2944 |
| 1967-08-01 | 509.8 | 198911 |    12.6 |     4.7 |     2945 |
| 1967-09-01 | 515.6 | 199113 |    11.9 |     4.6 |     2958 |
| 1967-10-01 | 512.2 | 199311 |    12.9 |     4.9 |     3143 |
| 1967-11-01 | 517.4 | 199498 |    12.8 |     4.7 |     3066 |
| 1967-12-01 | 525.1 | 199657 |    11.8 |     4.8 |     3018 |

#### 3.1 Plot the trend in number of unemployed persons (`unemploy`) though time using the economics dataset shown above. And for this question only, **hide your code and only show the plot**.

``` r
## Write your code here
```

#### 3.2 Edit the plot title and axis labels of the previous plot appropriately. Make y axis start from 0. Change the background theme to what is shown below. (Hint: search for help online if needed)

``` r
## Write your code here
```
