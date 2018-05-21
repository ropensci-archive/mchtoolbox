# Read in data
cdc_ref <- readr::read_csv("data-raw/cdcref_d.csv")

# Write data to package.
devtools::use_data(cdc_ref, overwrite = TRUE)
