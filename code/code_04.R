source(here::here("code/library.R"))

here::i_am("code/code_03.R")

music_data <- read_excel(
  here::here("raw_data/music_mental_data.xlsx"), 
  skip = 1
)

instrument_composer <- music_data %>% 
  mutate(
    musician_type = case_when(
      Instrumentalist == "Yes" & Composer == "Yes" ~ "Both",
      Instrumentalist == "Yes" & Composer == "No" ~ "Instrumentalist",
      Instrumentalist == "No" & Composer == "Yes" ~ "Composer",
      Instrumentalist == "No" & Composer == "No" ~ "Neither"
    ) # create new variable names/categories for my table so I can look at musician identification. Basically saying that if these conditions are true ~ assign this name/title
  ) %>% 
  rename("Musician Type" = musician_type) #making the name prettier

musician_table <- instrument_composer %>% 
  filter(!is.na(`Music effects`)) %>%  #remove empty/NA answers
  select(`Musician Type`, `Music effects`) %>% 
  table() 

saveRDS(
  musician_table,
  file = here::here("output/test2_table.rds")
)


