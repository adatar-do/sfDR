hojas <- readxl::excel_sheets("data-raw/division_territorial/Division Territorial 2016 D20220701.xlsx")

dt_2016 <- hojas %>%
  #.[1:4] %>%
  purrr::map(\(.x){
    readxl::read_excel(
      "data-raw/division_territorial/Division Territorial 2016 D20220701.xlsx",
      sheet = .x,
      skip = 3,
      .name_repair = janitor::make_clean_names,
      col_types = "text"
    )
  }) %>%
  bind_rows() %>%
  drop_na()

dt_2016 %>%
  count(region)

dt_2016 %>%
  count(provincia)

dt_2016 %>%
  count(provincia, municipio) %>%
  filter(municipio != "00")

dt_2016 %>%
  count(provincia, municipio, distrito_municipal) %>%
  filter(municipio != "00") %>%
  filter(distrito_municipal != "00")

dt_2016 %>%
  count(provincia, municipio, distrito_municipal, seccion) %>%
  filter(municipio != "00") %>%
  filter(distrito_municipal != "00") %>%
  filter(seccion != "00")

dt_2016 %>%
  count(provincia, municipio, distrito_municipal, seccion, barrio_paraje) %>%
  filter(municipio != "00") %>%
  filter(distrito_municipal != "00") %>%
  filter(seccion != "00") %>%
  filter(barrio_paraje != "00")

dt_2016 %>%
  count(provincia, municipio, distrito_municipal, seccion, barrio_paraje, sub_barrio) %>%
  filter(municipio != "00") %>%
  filter(distrito_municipal != "00") %>%
  filter(seccion != "00") %>%
  filter(barrio_paraje != "00") %>%
  filter(sub_barrio != "00")
