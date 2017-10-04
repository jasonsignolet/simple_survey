#### Lesson 1.2: Manipulate survey ----
## Some data cleansing, wrangling and transformation on the survey responses

library(data.table)
library(magrittr)
library(ggplot2)

## Load the survey ----
survey <- fread("survey_responses_20171004145706.csv")

survey[]

## Clean the `temperature` column and set it to numeric ----

survey[, temperature := temperature %>%
         gsub("[^0-9.]", "", .) %>%
         as.numeric]

## Plot a histogram of responses ----

ggplot(survey, aes(temperature)) +
  geom_histogram(binwidth = 4)

## Remove rows where the respondent is suspected to have not taken the survey seriously ----

survey_good <- survey[select_b == "B"]

ggplot(survey_good, aes(temperature)) +
  geom_histogram(binwidth = 4)
