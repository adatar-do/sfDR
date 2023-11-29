library(sf)
library(dplyr)
library(tidyr)
source("data-raw/division_territorial/dt_2016.R")


dt_2016 %>%
  filter(
    municipio != "00",
    distrito_municipal != "00",
    seccion == "00",
    barrio_paraje == "000",
    sub_barrio == "00"
  ) %>%
  select(provincia, municipio, distrito_municipal, DM_NAME = toponimia_o_nombre) %>%
  unite("DM_ID", c(provincia, municipio, distrito_municipal), sep = "") -> dr_dm

dr_dm %>%
  count(DM_NAME) %>%
  arrange(desc(n))


DR_DM <- sf::st_read("data-raw/shapes/RD_DM_20211130/RD_DM_20211130.shp")


DR_DM %>%
  st_drop_geometry() %>%
  left_join(dr_dm, by = c("ENLACE" = "DM_ID")) %>%
  View()

DR_DM %>%
  st_drop_geometry() %>%
  count(ENLACE) %>%
  arrange(desc(n))

DR_DM %>%
  st_drop_geometry() %>%
  select(DM_ID = ENLACE, DM_NAME = TOPO2) %>%
  as_tibble() %>%
  arrange(DM_ID) -> dr_dm

dr_municipal_district <- dr_dm %>%
  dplyr::bind_rows(
    dplyr::tribble(
      ~"DM_ID", ~"DM_NAME",
      "000000", "_NA_",
      "020107", "Doña Emma Balaguer",
      "040901", "Salinas",
      "060701", "Hostos",
      "110102", "Nisibón",
      "110201", "Yuma"
    )
  )

dr_municipal_district <- dr_municipal_district %>%
  dplyr::mutate(DM_NAME = iconv(DM_NAME, from = "latin1", to = "UTF-8"))

DR_DM %>%
  select(DM_ID = ENLACE) -> DR_DM

usethis::use_data(dr_municipal_district, DR_DM, overwrite = TRUE)
