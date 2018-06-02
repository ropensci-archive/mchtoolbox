context("launch_mchtoolbox.R")

test_that("Shiny app loads", {
  expect_error(launch_mchtoolbox(test), "unused argument (test)", fixed=TRUE)

})
