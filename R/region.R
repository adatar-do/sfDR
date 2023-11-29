#' Simple features for the "Development Regions of the Dominican Republic"
#'
#' This dataset contains the simple features polygons for the development
#' regions of the Dominican Republic. These regions correspond to the 10
#' development regions as defined in `Decreto 710-04`.
#'
#' @format ## `DR_REG`
#' A simple features collection with 10 features and 2 fields:
#' \describe{
#'   \item{REG_ID}{Region number (2 digits) based on the `Decreto 710-04` order}
#'   \item{geometry}{Polygon geometry}
#' }
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_REG_20220630>
'DR_REG'


#' Metadata for the "Development Regions of the Dominican Republic"
#'
#' This dataset contains the metadata for the development regions of the
#' Dominican Republic. The regions correspond to the 10 development regions
#' defined in `Decreto 710-04`.
#'
#' @format ## `dr_region`
#' A data frame with 10 rows and 3 variables:
#' \describe{
#'   \item{REG_ID}{Region number (2 digits) based on the `Decreto 710-04` order}
#'   \item{REG_NAME}{Full name of the region as defined in the `Decreto 710-04`}
#'   \item{REG_CODE}{Region code (3 letters). Abbreviation of the full region name}
#' }
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
'dr_region'
