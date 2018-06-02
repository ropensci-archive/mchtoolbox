context("launch_mchtoolbox.R")

test_that("Shiny app loads", {
  expect_error(launch_mchtoolbox(test), "unused argument (test)", fixed=TRUE)
  #expect_message(launch_mchtoolbox(), "Loading mchtoolbox shiny interface for local use.")

})

