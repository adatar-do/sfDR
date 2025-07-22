library(magrittr)

dr_region <- tibble::tribble(
  ~REG_ID, ~REG_NAME, ~REG_CODE,
  "01", "Cibao Norte", "CNT",
  "02", "Cibao Sur", "CSR",
  "03", "Cibao Nordeste", "CND",
  "04", "Cibao Noroeste", "CNO",
  "05", "Valdesia", "VAL",
  "06", "Enriquillo", "ENR",
  "07", "El Valle", "EVA",
  "08", "Del Yuma", "YUM",
  "09", "Higuamo", "HIG",
  "10", "Ozama" , "OZM"
)



board <- pins::board_folder('inst/extdata/')
pins::pin_write(board, dr_region, 'DR_REG_METADATA', type = 'json')


DR_REG <- sf::st_read("data-raw/shapes/RD_REG_20211130/RD_REG_20211130.shp", quiet = TRUE)

DR_REG %>%
  dplyr::left_join(dr_region, ., by = c("REG_ID" = "CODREG")) %>%
  sf::st_as_sf() %>%
  dplyr::select(REG_ID) -> DR_REG

