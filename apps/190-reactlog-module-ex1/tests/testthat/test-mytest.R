library(shinytest2)

test_that("Migrated shinytest test: mytest.R", {
  app <- AppDriver$new(variant = shinycoreci::platform_rversion(),
    seed = 54322)

  app$set_inputs(`reactlog_module-refresh` = "click")
  Sys.sleep(4)
  app$expect_values()
  app$expect_screenshot()

  app$set_inputs(`reactlog_module-refresh` = "click")
  Sys.sleep(4)
  app$expect_values()
  app$expect_screenshot()

  app$set_inputs(obs = 9)
  app$set_inputs(obs = 8)

  app$set_inputs(`reactlog_module-refresh` = "click")
  Sys.sleep(4)
  app$expect_values()
  app$expect_screenshot()

  app$set_inputs(`reactlog_module-refresh` = "click")
  Sys.sleep(4)
  app$expect_values()
  app$expect_screenshot()
})
