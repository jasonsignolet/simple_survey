#### Lesson 1.1: Download survey ----
## Download the survey hosted on
## "https://docs.google.com/spreadsheets/d/1A4lIT_MPjTk7dv3-26mYlFpxdwnPFbkssrgz3Mv6yvw/edit#gid=384569321"
## and save it to csv

library(googlesheets)
library(magrittr)
library(data.table)

my_sheets <- gs_ls()
my_sheets

## Obselete code ----
# survey_url <- "https://docs.google.com/spreadsheets/d/1A4lIT_MPjTk7dv3-26mYlFpxdwnPFbkssrgz3Mv6yvw/edit#gid=384569321"
# survey_key <- extract_key_from_url(survey_url)
# survey <- gs_key(survey_key)
# gs_ws_ls(survey)
#
# survey_responses <- gs_read(survey, ws = "Form responses 1")

## Download the responses ----
survey_key <- "1A4lIT_MPjTk7dv3-26mYlFpxdwnPFbkssrgz3Mv6yvw"
timestring <- Sys.time() %>% as.character %>% gsub("[^[:alnum:]]", "", .)

survey_key %>%
  gs_key %>%
  gs_read(ws = "Form responses 1") %>%
  setDT %>%
  setnames(c("timestamp", "temperature", "colour", "select_b", "yes_no")) %>%
  fwrite(sprintf("data/survey_responses_%s.csv", timestring))

