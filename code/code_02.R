library(dplyr) #loading packages in that I will need to use later on to make sure code runs.
library(ggplot2)
library(readxl)
here::i_am("code/code_02.R")

music_data <- read_excel(
  here::here("raw_data/music_mental_data.xlsx"), 
  skip = 1
)

boxplot <- ggplot(music_data %>% filter(!is.na(`Music effects`)), 
       aes(x = `Music effects`, y = `Hours per day`))+
  geom_boxplot(na.rm = TRUE)+ 
  labs(
    title = "Hours of Music per Day by Music Effect on Mental Health",
    x = "Music Effect on Mental Health",
    y = "Hours per Day"
  )

saveRDS(
  boxplot,
  file = here::here("output/figure1.rds")
)

