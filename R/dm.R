#' Load Dominican Republic Municipal Districts Simple Features (sf)
#' `r lifecycle::badge('experimental')`
#'
#' This function loads the Dominican Republic municipal districts simple features (sf)
#' and adds metadata for municipalities, provinces, and regions if required.
#' It also optionally converts the result to an `sf` object.
#'
#' @param .sf Logical; if TRUE, converts the result to an `sf` object. Defaults to TRUE.
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
#' A simple features collection with 393 features and 10 fields:
#' \describe{
#'   \item{MD_ID}{Municipal district number (6 digits) based on the `División Territorial 2021` order}
#'   \item{MD_NAME}{Full name of the municipal district as defined in the `División Territorial 2021`}
#'   \item{MUN_ID}{Municipality number (4 digits)}
#'   \item{MUN_NAME}{Full name of the municipality}
#'   \item{PROV_ID}{Province number (2 digits)}
#'   \item{PROV_CODE}{Code of the province}
#'   \item{PROV_NAME}{Full name of the province}
#'   \item{REG_ID}{Region number}
#'   \item{REG_NAME}{Name of the region}
#'   \item{REG_CODE}{Code of the region}
#'   \item{geometry}{Polygon geometry representing each municipal district}
#' }
#'
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_DM>
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
#'
#' @examples
#' \dontrun{
#' # Load and process the data as sf object
#' result <- dr_municipal_districts(TRUE, TRUE, TRUE, TRUE)
#' print(result)
#' }
#'
dr_municipal_districts <- function(.sf = TRUE, .mun = FALSE, .prov = FALSE, .reg = FALSE, .uniques = TRUE) {
  MD_ID <- NULL

  metadata <- pins::pin_read(
    pins::board_folder(system.file("extdata", package = "sfDR")),
    "DR_MD_METADATA"
  )

  if (.uniques) {
    metadata <- metadata %>%
      dplyr::distinct(MD_ID, .keep_all = T)
  }

  drmd <- DR_MUNICIPAL_DISTRICTS %>%
    sf::st_as_sf() %>%
    dplyr::left_join(metadata, by = dplyr::join_by(MD_ID)) %>%
    .add_mun(.prov, .reg)

  if (!.mun) {
    drmd <- drmd %>%
      dplyr::select(-dplyr::starts_with("MUN"))
  }

  if (!.prov) {
    drmd <- drmd %>%
      dplyr::select(-dplyr::starts_with("PROV"))
  }

  if (!.reg) {
    drmd <- drmd %>%
      dplyr::select(-dplyr::starts_with("REG"))
  }

  if (!.sf) {
    drmd <- drmd %>%
      sf::st_drop_geometry()
  }

  drmd
}


.add_mun <- function(drmd, .prov = FALSE, .reg = FALSE) {
  MD_ID <- NULL

  drmd %>%
    dplyr::mutate(MUN_ID = substr(MD_ID, 1, 4)) %>%
    dplyr::left_join(
      dr_municipalities(FALSE, .prov, .reg),
      by = "MUN_ID"
    )
}
