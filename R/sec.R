#' Load Dominican Republic Sections Simple Features (sf)
#' `r lifecycle::badge('experimental')`
#'
#' This function loads the Dominican Republic sections simple features (sf)
#' and adds metadata for municipal districts, municipalities, provinces, and regions if required.
#' It also optionally converts the result to an `sf` object.
#'
#' @param .sf Logical; if TRUE, converts the result to an `sf` object. Defaults to TRUE.
#' @param .dm Logical; if FALSE, removes columns related to municipal districts. Defaults to FALSE.
#' @param .mun Logical; if FALSE, removes columns related to municipalities. Defaults to FALSE.
#' @param .prov Logical; if FALSE, removes columns related to provinces. Defaults to FALSE.
#' @param .reg Logical; if FALSE, removes columns related to regions. Defaults to FALSE.
#' @param .uniques Logical; if TRUE, removes some duplicated IDs inserted to consider
#'  territories names changes over time. Defaults to TRUE.
#'
#' @return A data frame or `sf` object (if .sf is TRUE) with the loaded and processed data.
#' @export
#'
#' @format
#' A simple features collection with 1,565 features and 12 fields:
#' \describe{
#'   \item{SEC_ID}{Section number (8 digits) based on the `División Territorial 2021` order}
#'   \item{SEC_NAME}{Full name of the section as defined in the `División Territorial 2021`}
#'   \item{MD_ID}{Municipal district number (6 digits)}
#'   \item{MD_NAME}{Full name of the municipal district}
#'   \item{MUN_ID}{Municipality number (4 digits)}
#'   \item{MUN_NAME}{Full name of the municipality}
#'   \item{PROV_ID}{Province number (2 digits)}
#'   \item{PROV_CODE}{Code of the province}
#'   \item{PROV_NAME}{Full name of the province}
#'   \item{REG_ID}{Region number}
#'   \item{REG_NAME}{Name of the region}
#'   \item{REG_CODE}{Code of the region}
#'   \item{geometry}{Polygon geometry representing each section}
#' }
#'
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_SECCIONES>
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
#'
#' @examples
#' \dontrun{
#' # Load and process the data as sf object
#' result <- dr_sections(TRUE, TRUE, TRUE, TRUE, TRUE)
#' print(result)
#' }
#'
dr_sections <- function(.sf = TRUE, .dm = FALSE, .mun = FALSE, .prov = FALSE, .reg = FALSE, .uniques = TRUE) {
  SEC_ID <- NULL

  metadata <- pins::pin_read(
    pins::board_folder(system.file("extdata", package = "sfDR")),
    "DR_SECTIONS_METADATA"
  )

  if (.uniques) {
    metadata <- metadata %>%
      dplyr::distinct(SEC_ID, .keep_all = T)
  }

  drs <- DR_SECTIONS %>%
    sf::st_as_sf() %>%
    dplyr::left_join(metadata, by = dplyr::join_by(SEC_ID)) %>%
    .add_dm(.mun, .prov, .reg)

  if (!.dm) {
    drs <- drs %>%
      dplyr::select(-dplyr::starts_with("MD"))
  }

  if (!.mun) {
    drs <- drs %>%
      dplyr::select(-dplyr::starts_with("MUN"))
  }

  if (!.prov) {
    drs <- drs %>%
      dplyr::select(-dplyr::starts_with("PROV"))
  }

  if (!.reg) {
    drs <- drs %>%
      dplyr::select(-dplyr::starts_with("REG"))
  }

  if (!.sf) {
    drs <- drs %>%
      sf::st_drop_geometry()
  }

  drs
}



.add_dm <- function(drsec, .mun = FALSE, .prov = FALSE, .reg = FALSE) {
  SEC_ID <- NULL

  drsec %>%
    dplyr::mutate(MD_ID = substr(SEC_ID, 1, 6)) %>%
    dplyr::left_join(
      dr_municipal_districts(FALSE, .mun, .prov, .reg),
      by = "MD_ID"
    )
}
