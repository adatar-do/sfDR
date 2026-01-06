# Load Dominican Republic Sections Simple Features (sf) **\[experimental\]**

This function loads the Dominican Republic sections simple features (sf)
and adds metadata for municipal districts, municipalities, provinces,
and regions if required. It also optionally converts the result to an
`sf` object.

## Usage

``` r
dr_sections(
  .sf = TRUE,
  .dm = FALSE,
  .mun = FALSE,
  .prov = FALSE,
  .reg = FALSE,
  .uniques = TRUE
)
```

## Format

A simple features collection with 1,565 features and 12 fields:

- SEC_ID:

  Section number (8 digits) based on the `División Territorial 2021`
  order

- SEC_NAME:

  Full name of the section as defined in the `División Territorial 2021`

- MD_ID:

  Municipal district number (6 digits)

- MD_NAME:

  Full name of the municipal district

- MUN_ID:

  Municipality number (4 digits)

- MUN_NAME:

  Full name of the municipality

- PROV_ID:

  Province number (2 digits)

- PROV_CODE:

  Code of the province

- PROV_NAME:

  Full name of the province

- REG_ID:

  Region number

- REG_NAME:

  Name of the region

- REG_CODE:

  Code of the region

- geometry:

  Polygon geometry representing each section

## Source

<https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_SECCIONES>

<https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>

## Arguments

- .sf:

  Logical; if TRUE, converts the result to an `sf` object. Defaults to
  TRUE.

- .dm:

  Logical; if FALSE, removes columns related to municipal districts.
  Defaults to FALSE.

- .mun:

  Logical; if FALSE, removes columns related to municipalities. Defaults
  to FALSE.

- .prov:

  Logical; if FALSE, removes columns related to provinces. Defaults to
  FALSE.

- .reg:

  Logical; if FALSE, removes columns related to regions. Defaults to
  FALSE.

- .uniques:

  Logical; if TRUE, removes some duplicated IDs inserted to consider
  territories names changes over time. Defaults to TRUE.

## Value

A data frame or `sf` object (if .sf is TRUE) with the loaded and
processed data.

## Examples

``` r
if (FALSE) { # \dontrun{
# Load and process the data as sf object
result <- dr_sections(TRUE, TRUE, TRUE, TRUE, TRUE)
print(result)
} # }
```
