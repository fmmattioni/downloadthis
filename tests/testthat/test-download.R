test_that("data frame works", {
  x <- mtcars %>%
    download_this()

  expect_s3_class(x, "shiny.tag")
})

test_that("list works", {
  x <- list(mtcars, iris) %>%
    download_this()

  expect_s3_class(x, "shiny.tag")
})

test_that("ggplot2 works", {
  x <- ggplot2::ggplot(mtcars, ggplot2::aes(mpg, hp)) +
    ggplot2::geom_point()

  x <- download_this(x)

  expect_s3_class(x, "shiny.tag")
})

test_that("csv works", {
  x <- mtcars %>%
    download_this(output_extension = ".csv")

  expect_s3_class(x, "shiny.tag")
})

test_that("xlsx works", {
  x <- mtcars %>%
    download_this(output_extension = ".xlsx")

  expect_s3_class(x, "shiny.tag")
})

test_that("list xlsx works", {
  x <- list("Dataset 1" = mtcars, "Dataset 2" = iris) %>%
    download_this(output_extension = ".xlsx")

  expect_s3_class(x, "shiny.tag")
})

test_that("list rds works", {
  vector_example <- 1:10
  linear_model <- lm(mpg ~ gear, data = mtcars)

  x <- list(mtcars, iris, vector_example, linear_model) %>%
    download_this(output_extension = ".rds")

  expect_s3_class(x, "shiny.tag")
})

test_that("web address works", {
  x <- download_link(link = "https://github.com/fmmattioni/downloadthis/raw/master/inst/example/file_1.pdf")

  expect_s3_class(x, "shiny.tag.list")
})

test_that("local single file works", {
  x <- download_file(path = system.file("assets/css/all.min.css", package = "downloadthis"))

  expect_s3_class(x, "shiny.tag")
})

test_that("local multiple files works", {
  path_files <- list.files(path = system.file("assets/css", package = "downloadthis"), full.names = TRUE)

  x <- download_file(path_files, output_name = "Multiple files")

  expect_s3_class(x, "shiny.tag")
})

test_that("local directory works", {
  x <- download_dir(path = system.file("assets", package = "downloadthis"), output_name = "example dir")

  expect_s3_class(x, "shiny.tag")
})
