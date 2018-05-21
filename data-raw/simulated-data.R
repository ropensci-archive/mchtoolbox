# Read data into object so we can write it.
sim_data <- readr::read_csv("data-raw/simulated_data.csv")

# Write data to package.
devtools::use_data(sim_data, overwrite = TRUE)
