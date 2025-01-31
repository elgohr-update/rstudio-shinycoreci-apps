library(shinytest2)

test_that("Migrated shinytest test: mytest.R", {
  app <- AppDriver$new(variant = shinycoreci::platform_rversion(),
    seed = 100, shiny_args = list(display.mode = "normal"))

  app$upload_file(file1 = "mtcars.csv")
  app$set_inputs(header = FALSE)
  app$set_inputs(quote = "")
  app$expect_values()
  app$expect_screenshot()
})
