# Read data into object so we can write it.
nhanes_data <- readr::read_csv("data-raw/nhanes.csv")

# Write data to package.
devtools::use_data(nhanes_data, overwrite = TRUE)
