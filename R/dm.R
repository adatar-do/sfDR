#' Simple features for the "Municipal Districts of the Dominican Republic"
#'
#' This dataset contains simple features polygons representing the 393 municipal districts
#' of the Dominican Republic, as defined in the `División Territorial 2021`.
#'
#' @format ## `DR_DM`
#' A simple features collection with 393 features and 2 fields:
#' \describe{
#'   \item{DM_ID}{Municipal district number (6 digits) based on the `División Territorial 2021` order}
#'   \item{geometry}{Polygon geometry representing each municipal district}
#' }
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_DM>
'DR_DM'


#' Metadata for the "Municipal Districts of the Dominican Republic"
#'
#' This dataset contains the metadata for the 393 municipal districts of the Dominican
#' Republic as defined in the `División Territorial 2021`. Due to historical name changes,
#' some municipal districts may have duplicate IDs. Users should be aware of this when
#' analyzing the data.
#'
#' @format ## `dr_municipal_district`
#' A data frame with 393 rows and 3 variables:
#' \describe{
#'   \item{DM_ID}{Municipal district number (6 digits) based on the `División Territorial 2021` order}
#'   \item{DM_NAME}{Full name of the municipal district as defined in the `División Territorial 2021`}
#' }
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
'dr_municipal_district'
