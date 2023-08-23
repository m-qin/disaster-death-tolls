library(rvest)
library(readr)
library(data.table)
library(stringr)
library(ggplot2)

# Obtain 2020 and 2021 tables and merge them
wiki <- read_html("https://en.wikipedia.org/wiki/List_of_natural_disasters_by_death_toll")
tables <- wiki %>% html_nodes("table")
century20_nat_disasters <- tables %>% .[[2]] %>% html_table()
century21_nat_disasters <- tables %>% .[[3]] %>% html_table()
nat_disasters <- rbind(century20_nat_disasters, century21_nat_disasters)

# Express the death toll either as point estimate (boundary point if censored) or midpoint if given range
nat_disasters <- as.data.table(nat_disasters)
nat_disasters <- nat_disasters[, .(Year, `Death toll`, Type)]
nat_disasters[, Deaths_or_Lower_Bound := parse_number(`Death toll`)]
nat_disasters[, Deaths_Upper_Bound := str_remove_all(`Death toll`, ",")]
# nat_disasters[, Deaths_Upper_Bound := str_extract(Deaths_Upper_Bound, "-\\d+")] # doesn't work
nat_disasters[, Deaths_Upper_Bound := c(8000, NA, NA, NA, NA, NA, NA, 15000, 82000, 8000,
                                        NA, NA, 220000, NA, NA, NA, 10000, NA, NA, NA, 273400,
                                        NA, 100000, NA, NA, NA, NA, NA, NA, 3800, 8000, 4000000,
                                        NA, NA, 12000, 60000, NA, NA, NA, 32968, NA, NA, NA,
                                        NA, NA, NA, NA, NA, 110000, NA, NA, NA, NA, NA, NA, NA,
                                        NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, 3000, NA, NA,
                                        NA, NA, NA, NA, 2204, NA, NA, 655000, 50000, 25000, NA,
                                        NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
                                        NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
                                        NA, NA, NA, 316000, NA, NA, NA, NA, NA, NA, NA, NA, NA,
                                        NA, NA, NA, NA, NA)] # I hard-coded this because I couldn't figure out regex
nat_disasters[, Deaths_Midpoint := (Deaths_or_Lower_Bound + Deaths_Upper_Bound)/2]
nat_disasters[, Deaths := ifelse(is.na(Deaths_Midpoint), Deaths_or_Lower_Bound, Deaths_Midpoint)]
nat_disasters <- nat_disasters[, .(Year, Deaths, Type)]

# Plot death toll by year (with type color-coded) and save it to the repository
p <- ggplot(nat_disasters, aes(x = Year, y = Deaths, color = Type, group = Type)) +
  geom_point() +
  geom_line() +
  scale_y_continuous(labels = scales::comma)
ggsave("natural_disasters_century_20_21.png", p)
