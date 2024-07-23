#' Load Dominican Republic Provinces Simple Features (sf)
#' `r lifecycle::badge('experimental')`
#'
#' This function loads the Dominican Republic provinces simple features (sf)
#' and adds metadata for regions if required.
#' It also optionally converts the result to an `sf` object.
#'
#' @param .sf Logical; if TRUE, converts the result to an `sf` object. Defaults to TRUE.
#' @param .reg Logical; if FALSE, removes columns related to regions. Defaults to FALSE.
#'
#' @return A data frame or `sf` object (if .sf is TRUE) with the loaded and processed data.
#' @export
#'
#' @format
#' A simple features collection with 32 features and 6 fields:
#' \describe{
#'   \item{PROV_ID}{Province number (2 digits) based on the `División Territorial 2021` order}
#'   \item{PROV_CODE}{Province code, a custom 2 or 3-letter abbreviation created for each province}
#'   \item{PROV_NAME}{Full name of the province as defined in the `División Territorial 2021`}
#'   \item{REG_ID}{Region number}
#'   \item{REG_NAME}{Name of the region}
#'   \item{REG_CODE}{Code of the region}
#'   \item{geometry}{Polygon geometry representing each province}
#' }
#'
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_PROV>
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
#'
#' @examples
#' \dontrun{
#'   # Load and process the data as sf object
#'   result <- dr_provinces(TRUE, TRUE)
#'   print(result)
#' }
#'
dr_provinces <- function(.sf = TRUE, .reg = FALSE){
  PROV_ID <- NULL

  drp <- DR_PROV %>%
    dplyr::left_join(
      pins::pin_read(
        pins::board_folder(system.file('extdata', package = 'sfDR')),
        'DR_PROV_METADATA'
      ) %>%
        dplyr::distinct(PROV_ID, .keep_all = T),
      by = dplyr::join_by(PROV_ID)
    ) %>%
    .add_reg()

  if(!.reg){
    drp <- drp %>%
      dplyr::select(-dplyr::starts_with("REG"))
  }
  if(!.sf){
    drp <- drp %>%
      sf::st_drop_geometry()
  }
  drp
}



.add_reg <- function(drp){
  drp = drp %>%
    dplyr::mutate(
      REG_ID = dplyr::case_when(
        as.numeric(PROV_ID) %in% c(25, 18, 9) ~ '01',
        as.numeric(PROV_ID) %in% c(13, 24, 28) ~ '02',
        as.numeric(PROV_ID) %in% c(6, 19, 14, 20) ~ '03',
        as.numeric(PROV_ID) %in% c(27, 15, 5, 26) ~ '04',
        as.numeric(PROV_ID) %in% c(21, 2, 17, 31) ~ '05',
        as.numeric(PROV_ID) %in% c(4, 3, 16, 10) ~ '06',
        as.numeric(PROV_ID) %in% c(22, 7) ~ '07',
        as.numeric(PROV_ID) %in% c(12, 11, 8) ~ '08',
        as.numeric(PROV_ID) %in% c(23, 30, 29) ~ '09',
        as.numeric(PROV_ID) %in% c(1, 32) ~ '10'
      )
    ) %>%
    dplyr::left_join(
      dr_regions(FALSE),
      by = "REG_ID"
    )
}


#' Deprecated function: get_dr_provinces
#' `r lifecycle::badge('deprecated')`
#'
#' This function is deprecated. Use `dr_provinces()` instead.
#'
#' @param ... Arguments to pass to `dr_provinces()`.
#' @export
get_dr_provinces <- function(...){
  lifecycle::deprecate_warn("0.1.0", "get_dr_provinces()", "dr_provinces()")
  dr_provinces(...)
}


