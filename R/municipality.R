#' Simple features for the "Municipalities of the Dominican Republic"
#'
#' This dataset contains simple features polygons representing the 158 municipalities
#' of the Dominican Republic, as defined in the `División Territorial 2021`.
#'
#' @format ## `DR_MUN`
#' A simple features collection with 158 features and 2 fields:
#' \describe{
#'   \item{MUN_ID}{Municipality number (3 digits) based on the `División Territorial 2021` order}
#'   \item{geometry}{Polygon geometry representing each municipality}
#' }
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_MUNICIPIOS>
'DR_MUN'


#' Metadata for the "Municipalities of the Dominican Republic"
#'
#' This dataset contains the metadata for the 158 municipalities of the Dominican
#' Republic as defined in the `División Territorial 2021`. Note that due to historical
#' name changes, some municipalities may have duplicate IDs. Users should consider this
#' when working with the data.
#'
#' @format ## `dr_municipality`
#' A data frame with 158 rows and 3 variables:
#' \describe{
#'   \item{MUN_ID}{Municipality number (3 digits) based on the `División Territorial 2021` order}
#'   \item{MUN_NAME}{Full name of the municipality as defined in the `División Territorial 2021`}
#' }
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
'dr_municipality'
