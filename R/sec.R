#' Simple features for the "Sections of the Dominican Republic"
#'
#' This dataset contains simple features polygons representing the 1,565 sections
#' of the Dominican Republic, as defined in the `División Territorial 2021`.
#'
#' @format ## `DR_SEC`
#' A simple features collection with 1,565 features and 2 fields:
#' \describe{
#'   \item{SEC_ID}{Section number (8 digits) based on the `División Territorial 2021` order}
#'   \item{geometry}{Polygon geometry representing each section}
#' }
#' @source <https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_SECCIONES>
'DR_SEC'


#' Metadata for the "Sections of the Dominican Republic"
#'
#' This dataset contains the metadata for the 1,565 sections of the Dominican
#' Republic as defined in the `División Territorial 2021`. Due to historical name changes,
#' some sections may have duplicate IDs. Users should consider this when working with the data.
#'
#' @format ## `dr_section`
#' A data frame with 1,565 rows and 3 variables:
#' \describe{
#'   \item{SEC_ID}{Section number (8 digits) based on the `División Territorial 2021` order}
#'   \item{SEC_NAME}{Full name of the section as defined in the `División Territorial 2021`}
#' }
#' @source <https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>
'dr_section'
