here::i_am("code/code_03.1.R")

musician_table <- readRDS(here::here("output/test1_table.rds"))

test2_result <- fisher.test(musician_table, workspace = 2e8)

saveRDS(
  test2_result,
  file = here::here("output/test2_result.rds")
)
