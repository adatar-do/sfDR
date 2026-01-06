# Load Dominican Republic Provinces Simple Features (sf) **\[experimental\]**

This function loads the Dominican Republic provinces simple features
(sf) and adds metadata for regions if required. It also optionally
converts the result to an `sf` object.

## Usage

``` r
dr_provinces(.sf = TRUE, .reg = FALSE, .uniques = TRUE)
```

## Format

A simple features collection with 32 features and 6 fields:

- PROV_ID:

  Province number (2 digits) based on the `División Territorial 2021`
  order

- PROV_CODE:

  Province code, a custom 2 or 3-letter abbreviation created for each
  province

- PROV_NAME:

  Full name of the province as defined in the
  `División Territorial 2021`

- REG_ID:

  Region number

- REG_NAME:

  Name of the region

- REG_CODE:

  Code of the region

- geometry:

  Polygon geometry representing each province

## Source

<https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_PROV>

<https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>

## Arguments

- .sf:

  Logical; if TRUE, converts the result to an `sf` object. Defaults to
  TRUE.

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
result <- dr_provinces(TRUE, TRUE)
print(result)
} # }
```
