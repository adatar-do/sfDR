# Load Dominican Republic Municipalities Simple Features (sf) **\[experimental\]**

This function loads the Dominican Republic municipalities simple
features (sf) and adds metadata for provinces and regions if required.
It also optionally converts the result to an `sf` object.

## Usage

``` r
dr_municipalities(.sf = TRUE, .prov = FALSE, .reg = FALSE, .uniques = TRUE)
```

## Format

A simple features collection with 158 features and 8 fields:

- MUN_ID:

  Municipality number (3 digits) based on the
  `División Territorial 2021` order

- MUN_NAME:

  Full name of the municipality as defined in the
  `División Territorial 2021`

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

  Polygon geometry representing each municipality

## Source

<https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_MUNICIPIOS>

<https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>

## Arguments

- .sf:

  Logical; if TRUE, converts the result to an `sf` object. Defaults to
  TRUE.

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
result <- dr_municipalities(TRUE, TRUE, TRUE)
print(result)
} # }
```
