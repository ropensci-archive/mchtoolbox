# Read data into object so we can write it.
nhanes_data <- readr::read_csv("data-raw/nhanes.csv")

# Rename "gender" to "sex" to match definition/CDC data
names(nhanes_data) <- gsub("gender", "sex", names(nhanes_data))

# Write data to package.
devtools::use_data(nhanes_data, overwrite = TRUE)
