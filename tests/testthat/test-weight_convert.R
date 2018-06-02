context("weight_convert.R")

test_that("Returns correct values", {
  weight <- 24.601
  weights <- c(3.314, 6,121, 8.547)
  expect_that(convert_kg_lbs(weight), is_a("numeric"))
  expect_that(convert_lbs_kg(weights), is_a("numeric"))
  expect_that(convert_kg_lbs(weight), is_a("numeric"))
  expect_that(convert_lbs_kg(weights), is_a("numeric"))
  expect_equal(convert_kg_lbs(weight), 54.23592, tolerance = .002)
  expect_equal(convert_lbs_kg(weight), 11.15883, tolerance = .002)
  expect_equal(convert_kg_lbs(weights), c(7.306119, 13.227736, 266.759337, 18.842910))
  expect_equal(convert_lbs_kg(weights), c(1.503205, 2.721554, 54.884677, 3.876854))
})
