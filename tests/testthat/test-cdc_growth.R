context("test-cdc_growth.R")

test_that("Returns data.frame", {
  expect_is(create_cdc_growth(nhanes_data), "data.frame")
})
