context("test-cdc_growth.R")

test_that("Returns data.frame", {

  expect_is(create_cdc_growth(nhanes_data), "data.frame")
  expect_is(create_cdc_growth(nhanes_data), "tbl_df")
  expect_length(create_cdc_growth(nhanes_data), 79)

})

test_that("Returns errors", {

  expect_error(create_cdc_growth(1), "`data` must include columns `agemos`, `weight`, and `height`", fixed=TRUE)

})

test_that("Function returns correct results", {

  test_data <- create_cdc_growth(nhanes_data)
  data_test_1 <- as.numeric(test_data[2,37])
  expect_true(test_data[2,2] == 1)
  expect_equal(data_test_1, 48.72065, tolerance = .002)

})
