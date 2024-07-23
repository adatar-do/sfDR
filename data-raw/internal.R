library(magrittr)
source("data-raw/dr_region.R", encoding = "utf8")
source("data-raw/dr_provinces.R", encoding = "utf8")
source("data-raw/dr_municipalities.R", encoding = "utf8")
source("data-raw/dr_dm.R", encoding = "utf8")
source("data-raw/dr_sections.R", encoding = "utf8")



usethis::use_data(
  DR_REG,
  DR_PROV,
  DR_MUN,
  DR_MUNICIPAL_DISTRICTS,
  DR_SECTIONS,
  internal = TRUE,
  compress = "xz",
  overwrite = TRUE
)
