test_that("estimate area input",{
  expect_error(estimate_area(B = "Helloo"))
  expect_error(estimate_area(B = -25))
  expect_error(estimate_area(B = 55, seed = "Helloo"))
})
test_that("estimate area output",{
  expect_type(estimate_area(B = 85), "list")
})
