library(shinytest2)

test_that("Migrated shinytest test: mytest.R", {
  app <- AppDriver$new(variant = shinycoreci::platform_rversion(),
    load_timeout = 10000, seed = 100, shiny_args = list(display.mode = "normal"))

  Sys.sleep(2)
  app$expect_values()
  app$expect_screenshot()
})
