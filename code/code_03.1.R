here::i_am("code/code_03.1.R")

age_table <- readRDS(here::here("output/test1_table.rds"))

test1_result <- fisher.test(age_table)

saveRDS(test1_result, here::here("output/test1_result.rds"))
