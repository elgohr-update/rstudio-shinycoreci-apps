library(shinytest2)

test_that("Migrated shinytest test: mytest.R", {
  app <- AppDriver$new(variant = shinycoreci::platform_rversion(),
    seed = 100, shiny_args = list(display.mode = "normal"))

  app$set_inputs(`reactlog_module-refresh` = "click")
  Sys.sleep(4)
  app$expect_values()
  app$expect_screenshot()

  app$set_inputs(bins = 8)
  app$set_inputs(`reactlog_module-refresh` = "click")
  Sys.sleep(4)
  app$expect_values()
  app$expect_screenshot()

  app$set_inputs(bins = 5)
  app$set_inputs(bins = 22)
  app$set_inputs(`reactlog_module-refresh` = "click")
  Sys.sleep(4)
  app$expect_values()
  app$expect_screenshot()
})
