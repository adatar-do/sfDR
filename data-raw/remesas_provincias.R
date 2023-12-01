library(dplyr)
library(tidyr)

remesas_provincias <- readxl::read_excel('data-raw/Remesas_PR.xlsx', skip = 6) %>%
  select(1:2) %>%
  drop_na() %>%
  setNames(c('province', 'percentage')) %>%
  filter(percentage != 1)


usethis::use_data(remesas_provincias, overwrite = TRUE)
