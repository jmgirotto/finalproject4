library(dplyr) #loading packages in that I will need to use later on to make sure code runs.
library(ggplot2)
library(readxl)
here::i_am("code/code_03.R")

music_data <- read_excel(
  here::here("raw_data/music_mental_data.xlsx"), 
  skip = 1
)

age_music <- music_data %>% 
  mutate(
    age_group = case_when(
      Age <= 12 ~ "Children",
      Age <= 19 ~ "Teenager",
      Age <= 40 ~ "Young Adult",
      Age <= 59 ~ "Middle Aged",
      Age > 59 ~ "Older Adult"
    ) 
  )

age_table <- table(age_music$age_group, age_music$`Music effects`)

saveRDS(
 age_table,
  file = here::here("output/test1_table.rds")
)



