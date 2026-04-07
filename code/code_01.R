source(here::here("code/library.R"))

here::i_am("code/code_01.R")

music_data <- read_excel(
  here::here("raw_data/music_mental_data.xlsx"), 
  skip = 1
)

music_genre <- music_data %>% 
  rename( `Favorite Genre` = `Fav genre`) %>% #renaming fav genre to make it look nicer in the end table
  group_by(`Favorite Genre`) %>% #groups my data into rows for comparison in the table
  summarise(
    "Mean Anxiety" = mean(Anxiety),
    "Mean Depression" = mean(Depression),
    "Mean Insomnia" = mean(Insomnia),
    "Mean OCD" = mean(OCD)
  ) #created new variables for the table based on the calculation I wanted to do - in this case averages 
table1 <- knitr::kable(
  music_genre,
  digits = 4, #how many decimals do I want?
  caption = "Mean Mental Health Outcomes by Favorite Music Genres" #title
)

saveRDS(
  table1, 
  file = here::here("output/table1.rds")
)

