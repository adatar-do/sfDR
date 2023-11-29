
DR_DM <- sf::st_read("data-raw\\shapes\\RD_DM_20211130\\RD_DM_20211130.shp")


dt_2021  <- purrr::map(
    readxl::excel_sheets("data-raw\\division_territorial\\División territorial  2021 .xlsx"),
    \(sheet) {
        readxl::read_excel(
            "data-raw\\division_territorial\\División territorial  2021 .xlsx", 
            sheet,
            skip = 5,
            .name_repair = janitor::make_clean_names
        ) |>
        dplyr::mutate(dplyr::across(.fns = as.character))
    }
)


dt_2021 <- dt_2021 |>
    dplyr::bind_rows() |>
    dplyr::select(1:8)

dt_2021 |>
    dplyr::filter(
        municipio != "00",
        distrito_municipal != "00",
        seccion == "00",
        stringr::str_detect(toponimia_o_nombre, "DM")
    )

