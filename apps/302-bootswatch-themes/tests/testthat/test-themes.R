library(shinytest2)
library(bslib)

themes <-
  list(
    list(version = 4L, bootswatch = "cerulean"),
    list(version = 4L, bootswatch = "cosmo"),
    list(version = 4L, bootswatch = "cyborg"),
    list(version = 4L, bootswatch = "darkly"),
    list(version = 4L, bootswatch = "flatly"),
    list(version = 4L, bootswatch = "journal"),
    list(version = 4L, bootswatch = "litera"),
    list(version = 4L, bootswatch = "lumen"),
    list(version = 4L, bootswatch = "lux"),
    list(version = 4L, bootswatch = "materia"),
    list(version = 4L, bootswatch = "minty"),
    list(version = 4L, bootswatch = "pulse"),
    list(version = 4L, bootswatch = "sandstone"),
    list(version = 4L, bootswatch = "simplex"),
    list(version = 4L, bootswatch = "sketchy"),
    list(version = 4L, bootswatch = "slate"),
    list(version = 4L, bootswatch = "solar"),
    list(version = 4L, bootswatch = "spacelab"),
    list(version = 4L, bootswatch = "superhero"),
    list(version = 4L, bootswatch = "united"),
    list(version = 4L, bootswatch = "yeti"),

    list(version = 3L, bootswatch = "cerulean"),
    list(version = 3L, bootswatch = "cosmo"),
    list(version = 3L, bootswatch = "cyborg"),
    list(version = 3L, bootswatch = "darkly"),
    list(version = 3L, bootswatch = "flatly"),
    list(version = 3L, bootswatch = "journal"),
    list(version = 3L, bootswatch = "lumen"),
    list(version = 3L, bootswatch = "paper"),
    list(version = 3L, bootswatch = "readable"),
    list(version = 3L, bootswatch = "sandstone"),
    list(version = 3L, bootswatch = "simplex"),
    list(version = 3L, bootswatch = "slate"),
    list(version = 3L, bootswatch = "spacelab"),
    list(version = 3L, bootswatch = "superhero"),
    list(version = 3L, bootswatch = "united"),
    list(version = 3L, bootswatch = "yeti")
  )

# ~ 2 mins
pb <- progress::progress_bar$new(
  format = "\n:name [:bar] :current/:total eta::eta\n",
  total = length(themes),
  show_after = 0
)
for (theme in themes) {
  version <- theme$version
  bootswatch <- theme$bootswatch
  name <- paste0(bootswatch, version)

  pb$tick(tokens = list(name = name))

  test_that(paste0("theme: ", name), {

    app <- AppDriver$new(
      name = name,
      variant = shinycoreci::platform_rversion(),
      seed = 101,
      options = list(
        # The bslib themer-demo app listens to this option through
        # bslib::bs_global_get()
        bslib_theme = bs_theme(
          version = version,
          bootswatch = bootswatch
        )
      )
    )
    withr::defer({ app$stop() })

    app$expect_values()
    app$expect_screenshot()
  })
}
