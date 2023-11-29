library(sf)
library(dplyr)

dr_province <- dplyr::tribble(
  ~PROV_CODE, ~PROV_NAME, ~PROV_ID,
  "NA", "_NA_", "00",
  "DN", "Distrito Nacional", "01",
  "AZU", "Azua", "02",
  "BAH", "Baoruco", "03",
  "BAH", "Bahoruco", "03",
  "BAR", "Barahona", "04",
  "DAJ", "Dajabón", "05",
  "DUA", "Duarte", "06",
  "EP", "Elías Piña", "07",
  "ES", "El Seibo", "08",
  "ES", "El Seybo", "08",
  "ESP", "Espaillat", "09",
  "IND", "Independencia", "10",
  "LA", "La Altagracia", "11",
  "LR", "La Romana", "12",
  "LV", "La Vega", "13",
  "MTS", "María Trinidad Sánchez", "14",
  "MC", "Monte Cristi", "15",
  "PED", "Pedernales", "16",
  "PER", "Peravia", "17",
  "PP", "Puerto Plata", "18",
  "HMI", "Hermanas Mirabal", "19",
  "SAL", "Salcedo", "19",
  "SAM", "Samaná", "20",
  "SC", "San Cristóbal", "21",
  "SJ", "San Juan", "22",
  "SJ", "San Juan de la Maguana", "22",
  "SPM", "San Pedro de Macorís", "23",
  "SRA", "Sánchez Ramírez", "24",
  "SAN", "Santiago", "25",
  "SAN", "Santiago de los Caballeros", "25",
  "SRO", "Santiago Rodríguez", "26",
  "VAL", "Valverde", "27",
  "MN", "Monseñor Nouel", "28",
  "MP", "Monte Plata", "29",
  "HMA", "Hato Mayor", "30",
  "SJO", "San José de Ocoa", "31",
  "SD", "Santo Domingo", "32"
) %>%
  dplyr::relocate(PROV_ID, PROV_CODE, PROV_NAME)

dr_province <- dr_province %>%
  dplyr::mutate(PROV_NAME = iconv(PROV_NAME, from = "latin1", to = "UTF-8"))


DR_PROV <- sf::st_read("data-raw/shapes/RD_PROV_20211130/RD_PROV_20211130.shp", quiet = TRUE)
DR_PROV <- dplyr::select(DR_PROV, PROV_ID = PROV)

usethis::use_data(dr_province, DR_PROV, overwrite = TRUE)
