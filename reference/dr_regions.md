# Load Dominican Republic Development Regions Simple Features (sf) **\[experimental\]**

This function loads the Dominican Republic development regions simple
features (sf) and adds metadata. It also optionally converts the result
to an `sf` object.

## Usage

``` r
dr_regions(.sf = TRUE, .uniques = TRUE)
```

## Format

A simple features collection with 10 features and 3 fields:

- REG_ID:

  Region number (2 digits) based on the `Decreto 710-04` order

- REG_NAME:

  Full name of the region as defined in the `Decreto 710-04`

- REG_CODE:

  Region code (3 letters). Abbreviation of the full region name

- geometry:

  Polygon geometry representing each region

## Source

<https://geoportal.iderd.gob.do/layers/geonode_data:geonode:RD_REG_20220630>

<https://www.one.gob.do/publicaciones/2021/division-territorial-2021/>

## Arguments

- .sf:

  Logical; if TRUE, converts the result to an `sf` object. Defaults to
  TRUE.

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
result <- dr_regions()
print(result)
} # }
```
