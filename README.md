# Plotting the Annual Deadliest Natural Disaster from 1900 to 2023
Author: Michelle Qin

Date: August 21, 2023

## Description
Each year, natural disasters kill hundreds, thousands, or, sometimes, millions of people worldwide. [Wikipedia](https://en.wikipedia.org/wiki/List_of_natural_disasters_by_death_toll) has compiled a list of the largest number of people killed by a single natural disaster for each year from 1900 to 2023. (Since 2023 is ongoing, the 2023 data is tentative.) I have written [some code](https://github.com/m-qin/disaster-death-tolls/blob/main/webscrape_and_plot_disasters.R) to plot the death tolls from these record-breaking disasters over time.

![Death toll versus year of each year's deadliest natural disaster from 1900 to today](https://github.com/m-qin/disaster-death-tolls/blob/main/natural_disasters_century_20_21.png)

The death toll from a natural disaster is almost always an estimate, especially if the disaster occurred in a time or place that had limited data-collecting, data-processing, or data-storing capacity. The death tolls shown on this graph are either a single number or the midpoint of a range provided by the Wikipedia page.

Using Wikipedia's data, this graph sorts each disaster by what type of natural disaster it was, for example, a tornado, an earthquake, or a combination of multiple types such as the 1992 Flores earthquake and tsunami in Indonesia. Different types of disasters are displayed in different colors and as different lines on the graph.

As you can see, the deadliest natural disaster in the last 124 years was a flood (or more accurately, a set of floods between July and November) in China in 1931, which killed between 422,499 and 4 million people. On this graph, the death toll is represented as 2,211,249.5, which is the midpoint of the very wide range of possible deaths. Observe also that a single earthquake or tropical cyclone has also killed hundreds of thousands of people several times in the current and last century. But most years do not see a natural disaster that kills more than 6,000 people.

It is a little hard to conclude any time trend from just 124 points of data. If we exclude the 1931 China floods as an outlier, it looks like large-scale natural disasters may have been more common after 1970 than before 1970. But even if this is a trend, it could have many possible explanations, from the global population increasing over time to data collection becoming more extensive over time (which would imply that later years may report more deaths than earlier years even if the actual number of deaths were similar). Clearly, there are many important and interesting questions to investigate about natural disasters and their impact on humans.

## Acknowledgements
This was my first web scraping project. I used [this website](https://scrapingbee.com/blog/web-scraping-r/) as well as the [rvest package in R](https://rvest.tidyverse.org/reference/index.html) to help me get started with this project.

The data used in this project are from [Wikipedia](https://en.wikipedia.org/wiki/List_of_natural_disasters_by_death_toll).
