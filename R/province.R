#' Simple features for the "Provinces of the Dominican Republic"
#'
#' This dataset contains simple features polygons representing the 32 provinces
#' of the Dominican Republic, as defined in the `División Territorial 2021`.
#'
#' @format ## `DR_PROV`
#' A simple features collection with 32 features and 2 fields:
#' \describe{
#'   \item{PROV_ID}{Province number (2 digits) based on the `División Territorial 2021` order}
#'   \item{geometry}{Polygon geometry representing each province}
#' }
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_PROV>
'DR_PROV'


#' Metadata for the "Provinces of the Dominican Republic"
#'
#' This dataset contains the metadata for the 32 provinces of the Dominican
#' Republic as defined in the `División Territorial 2021`. Note that some
#' provinces have undergone name changes over time, leading to potential
#' duplicates in province IDs. Users should be aware of this when analyzing
#' the data.
#'
#' @format ## `dr_province`
#' A data frame with 32 rows and 3 variables:
#' \describe{
#'   \item{PROV_ID}{Province number (2 digits) based on the `División Territorial 2021` order}
#'   \item{PROV_NAME}{Full name of the province as defined in the `División Territorial 2021`}
#'   \item{PROV_CODE}{Province code, a custom 2 or 3-letter abbreviation created for each province}
#' }
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
'dr_province'
