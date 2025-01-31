library(shinytest2)

test_that("Migrated shinytest test: mytest.R", {
  app <- AppDriver$new(variant = shinycoreci::platform_rversion(),
    seed = 100, shiny_args = list(display.mode = "normal"))

  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(n = 10)
  app$expect_values()
  app$expect_screenshot()
  app$set_inputs(n = 200)
  app$set_inputs(n = 80)
  app$set_inputs(n = 130)
  app$expect_values()
  app$expect_screenshot()
})
