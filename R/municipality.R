#' Load Dominican Republic Municipalities Simple Features (sf)
#' `r lifecycle::badge('experimental')`
#'
#' This function loads the Dominican Republic municipalities simple features (sf)
#' and adds metadata for provinces and regions if required.
#' It also optionally converts the result to an `sf` object.
#'
#' @param .sf Logical; if TRUE, converts the result to an `sf` object. Defaults to TRUE.
#' @param .prov Logical; if FALSE, removes columns related to provinces. Defaults to FALSE.
#' @param .reg Logical; if FALSE, removes columns related to regions. Defaults to FALSE.
#'
#' @return A data frame or `sf` object (if .sf is TRUE) with the loaded and processed data.
#' @export
#'
#' @format
#' A simple features collection with 158 features and 8 fields:
#' \describe{
#'   \item{MUN_ID}{Municipality number (3 digits) based on the `División Territorial 2021` order}
#'   \item{MUN_NAME}{Full name of the municipality as defined in the `División Territorial 2021`}
#'   \item{PROV_ID}{Province number (2 digits)}
#'   \item{PROV_CODE}{Code of the province}
#'   \item{PROV_NAME}{Full name of the province}
#'   \item{REG_ID}{Region number}
#'   \item{REG_NAME}{Name of the region}
#'   \item{REG_CODE}{Code of the region}
#'   \item{geometry}{Polygon geometry representing each municipality}
#' }
#'
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_MUNICIPIOS>
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
#'
#' @examples
#' \dontrun{
#'   # Load and process the data as sf object
#'   result <- dr_municipalities(TRUE, TRUE, TRUE)
#'   print(result)
#' }
#'
dr_municipalities <- function(.sf = TRUE, .prov = FALSE, .reg = FALSE){
  MUN_ID <- NULL

  drm <- DR_MUN %>%
    dplyr::left_join(
      pins::pin_read(
        pins::board_folder(system.file('extdata', package = 'sfDR')),
        'DR_MUN_METADATA'
      ) %>%
        dplyr::distinct(MUN_ID, .keep_all = T),
      by = dplyr::join_by(MUN_ID)
    ) %>%
    .add_prov(.reg)

  if(!.prov){
    drm <- drm %>%
      dplyr::select(-dplyr::starts_with("PROV"))
  }
  if(!.reg){
    drm <- drm %>%
      dplyr::select(-dplyr::starts_with("REG"))
  }
  if(!.sf){
    drm <- drm %>%
      sf::st_drop_geometry()
  }
  drm
}



.add_prov <- function(drm, .reg = FALSE){
  MUN_ID <- NULL

  drm %>%
    dplyr::mutate(PROV_ID = substr(MUN_ID, 1, 2)) %>%
    dplyr::left_join(
      dr_provinces(FALSE, .reg),
      by = "PROV_ID"
    )
}
