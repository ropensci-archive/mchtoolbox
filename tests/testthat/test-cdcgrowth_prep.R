context("test-cdcgrowth_prep.R")

test_that("Returns data.frame", {
  expect_is(cdcgrowth_prep(nhanes_data), "data.frame")
})
