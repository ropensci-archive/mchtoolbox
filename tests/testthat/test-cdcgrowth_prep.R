context("test-cdcgrowth_prep.R")

test_that("Returns data.frame", {
  expect_is(cdcgrowth_prep(nhanes_data), "data.frame")
  expect_is(cdcgrowth_prep(nhanes_data), "tbl_df")
  expect_length(cdcgrowth_prep(nhanes_data), 75)
})

test_that("Returns errors", {

  expect_error(cdcgrowth_prep(1), "`data` must include columns `agemos`, `weight`, and `height`", fixed=TRUE)
})
