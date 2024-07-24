#' Load Dominican Republic Development Regions Simple Features (sf)
#' `r lifecycle::badge('experimental')`
#'
#' This function loads the Dominican Republic development regions simple features (sf)
#' and adds metadata. It also optionally converts the result to an `sf` object.
#'
#' @param .sf Logical; if TRUE, converts the result to an `sf` object. Defaults to TRUE.
#' @param .uniques Logical; if TRUE, removes some duplicated IDs inserted to consider
#'  territories names changes over time. Defaults to TRUE.
#'
#' @return A data frame or `sf` object (if .sf is TRUE) with the loaded and processed data.
#' @export
#'
#' @format
#' A simple features collection with 10 features and 3 fields:
#' \describe{
#'   \item{REG_ID}{Region number (2 digits) based on the `Decreto 710-04` order}
#'   \item{REG_NAME}{Full name of the region as defined in the `Decreto 710-04`}
#'   \item{REG_CODE}{Region code (3 letters). Abbreviation of the full region name}
#'   \item{geometry}{Polygon geometry representing each region}
#' }
#'
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_REG_20220630>
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
#'
#' @examples
#' \dontrun{
#' # Load and process the data as sf object
#' result <- dr_regions()
#' print(result)
#' }
#'
dr_regions <- function(.sf = TRUE, .uniques = TRUE) {
  REG_ID <- NULL
  geometry <- NULL

  metadata <- pins::pin_read(
    pins::board_folder(system.file("extdata", package = "sfDR")),
    "DR_REG_METADATA"
  )

  if (.uniques) {
    metadata <- metadata %>%
      dplyr::distinct(REG_ID, .keep_all = T)
  }

  drr <- DR_REG %>%
    sf::st_as_sf() %>%
    dplyr::left_join(metadata, by = dplyr::join_by(REG_ID)) %>%
    dplyr::relocate(geometry, .after = dplyr::last_col())

  if (!.sf) {
    drr <- drr %>%
      sf::st_drop_geometry()
  }

  drr
}
