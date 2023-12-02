library(dplyr)
library(tidyr)

remittance_by_province <- readxl::read_excel('data-raw/Remesas_PR.xlsx', skip = 6) %>%
  select(1:2) %>%
  drop_na() %>%
  setNames(c('province', 'percentage')) %>%
  filter(percentage != 1)


usethis::use_data(remittance_by_province, overwrite = TRUE)
