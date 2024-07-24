library(sf)
library(dplyr)
library(tidyr)
source("data-raw/division_territorial/dt_2016.R")


dt_2016 %>%
  filter(
    seccion != "00",
    barrio_paraje == "000",
    sub_barrio == "00"
  ) %>%
  select(provincia, municipio, distrito_municipal, seccion, SEC_NAME = toponimia_o_nombre) %>%
  unite("SEC_ID", c(provincia, municipio, distrito_municipal, seccion), sep = "") -> dr_sec

dr_sec %>%
  count(SEC_NAME) %>%
  arrange(desc(n))

dr_sec <- dr_sec %>%
  dplyr::bind_rows(
    dplyr::tribble(
      ~"SEC_ID", ~"SEC_NAME",
      "00000000", "_NA_",
      "02010701", "Doña Emma Balaguer",
      "02010101", "Azua",
      "03020103", "El Rodeo",
      "03020103", "Majagual",
      "22010804", "El Cerro",
      "07050105", "Nicolás",
    )
  )



board <- pins::board_folder('inst/extdata/')
pins::pin_write(board, dr_sec, 'DR_SECTIONS_METADATA', type = 'json')



DR_SECTIONS <- sf::st_read("data-raw/shapes/ShapeFilesCenso2010/SECCenso2010.shp")
DR_SECTIONS %>%
  mutate(SEC_ID = stringr::str_c(PROV, MUN, DM, SECC)) %>% select(SEC_ID) -> DR_SECTIONS


