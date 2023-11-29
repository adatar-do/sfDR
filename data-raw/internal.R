library(magrittr)
source("data-raw/dr_region.R", encoding = "utf8")
source("data-raw/dr_provinces.R", encoding = "utf8")
source("data-raw/dr_municipalities.R", encoding = "utf8")
source("data-raw/dr_dm.R", encoding = "utf8")
source("data-raw/dr_sections.R", encoding = "utf8")

dr_province %T>%
  readr::write_csv("data-raw/dr_province.csv") %>%
  mutate(across(where(is.character), ~iconv(.x, to = "utf8"))) -> dr_province

dr_munipality %T>%
  readr::write_csv("data-raw/dr_municipality.csv") %>%
  mutate(across(where(is.character), ~iconv(.x, to = "utf8"))) -> dr_munipality

dr_region %T>%
  readr::write_csv("data-raw/dr_region.csv") %>%
  mutate(across(where(is.character), ~iconv(.x, to = "utf8"))) -> dr_region

dr_dm %T>%
  readr::write_csv("data-raw/dr_dm.csv") %>%
  mutate(across(where(is.character), ~iconv(.x, to = "utf8"))) -> dr_dm

dr_sec %T>%
  readr::write_csv("data-raw/dr_sec.csv") %>%
  mutate(across(where(is.character), ~iconv(readr::parse_character(.x), to = "utf8"))) -> dr_sec


usethis::use_data(
  dr_province,
  DR_PROV,
  dr_munipality,
  DR_MUN,
  dr_region,
  DR_REG,
  dr_dm,
  DR_DM,
  dr_sec,
  DR_SEC,
  internal = TRUE,
  compress = "xz",
  overwrite = TRUE
)
