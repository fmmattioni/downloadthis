#' Download data frames, lists, or any R object
#'
#' Wrapper around `bsplus::bs_button()` to provide a download button for HTML
#' outputs in R Markdown. Internally, the function writes the file to
#' `tempdir()`, encodes it, and produces the download button. Currently,
#' Internet Explorer does not support downloading embedded files. For
#' downloading links, files, or directories, see `download_link()`,
#' `download_file()`, and `download_dir()`.
#'
#' @param .data A data frame or (named) list to write to disk. See 'Examples'
#'   for more details.
#' @param output_name Name of of the output file, if `NULL` uses the deparsed
#'   `.data` object.
#' @param output_extension Extension of the output file. Currently,  `.csv`,
#'   `.xlsx`, and `.rds` are supported. If a (named) list is passed to the
#'   function, only `.xlsx` and `.rds` are supported.
#' @param button_label Character (HTML), button label
#' @param button_type Character, one of the standard Bootstrap types
#' @param icon Fontawesome tag e.g.: "fa fa-save", set to `NULL` to not show any icon.
#' @param self_contained A boolean to specify whether your HTML output is
#'   self-contained. Default to `FALSE`.
#' @param csv2 A boolean to specify whether to use `readr::write_csv2()` in case
#'   the `output_extension` is chosen as '.csv'. If `FALSE`,
#'   `readr::write_csv()` will be used instead. Default to `TRUE`.
#' @param ggsave_args List of arguments to pass to `ggplot2::ggsave`, e.g.:
#'   `list(height = 5)`.
#' @param ... attributes (named arguments) and children (unnamed arguments) of
#'   the button, passed to `htmltools::tag()`.
#'
#' @return \code{htmltools::\link[htmltools]{tag}}, \code{<button>}
#' @export
#'
#' @section Warning:
#' This example will write the `mtcars` dataset to `tempdir()` and produce the
#' download button for the file `mtcars dataset.csv` with the `fa fa-save` icon
#' on the `Download data` label.
#'
#' @examples
#' \dontrun{
#' # Passing a data frame to the function
#' mtcars %>%
#'   download_this(
#'     output_name = "mtcars dataset",
#'     output_extension = ".csv",
#'     button_label = "Download data",
#'     button_type = "warning",
#'     icon = "fa fa-save"
#'   )
#'
#' # Passing a list with data frames to the function
#' list(mtcars, iris) %>%
#'   download_this(
#'     output_name = "mtcars and iris datasets",
#'     output_extension = ".xlsx",
#'     button_label = "Download data",
#'     button_type = "warning",
#'     icon = "fa fa-save"
#'   )
#'
#' # Passing a named list with data frames to the function
#' list("mtcars dataset" = mtcars, "iris dataset" = iris) %>%
#'   download_this(
#'     output_name = "mtcars and iris datasets",
#'     output_extension = ".xlsx",
#'     button_label = "Download data",
#'     button_type = "warning",
#'     icon = "fa fa-save"
#'   )
#'
#' # Passing any R object to the function
#' vector_example <- 1:10
#' linear_model <- lm(mpg ~ gear, data = mtcars)
#'
#' list(mtcars, iris, vector_example, linear_model) %>%
#'   download_this(
#'     output_name = "datasets, vector, and linear model",
#'     output_extension = ".rds",
#'     button_label = "Download as rds",
#'     button_type = "warning",
#'     icon = "fa fa-save"
#'   )
#' }
download_this <- function(.data,
                          ...,
                          output_name = NULL,
                          output_extension = c(".csv", ".xlsx", ".rds"),
                          button_label = "Download data",
                          button_type = c("default", "primary", "success", "info", "warning", "danger"),
                          icon = "fa fa-save",
                          self_contained = FALSE,
                          csv2 = TRUE,
                          ggsave_args = list()) {
  UseMethod("download_this")
}

#' @export
download_this.default <- function(.data,
                                  ...,
                                  output_name = NULL,
                                  output_extension = ".rds",
                                  button_label = "Download data",
                                  button_type = c("default", "primary", "success", "info", "warning", "danger"),
                                  icon = "fa fa-save",
                                  self_contained = FALSE,
                                  csv2 = TRUE) {
  button_type <- match.arg(button_type)

  if (is.null(output_name)) {
    output_name <- deparse(substitute(.data))
  }

  ## name of the final output file
  output_file <- paste0(output_name, output_extension)

  ## generate temporary file in temporary folder
  tmp_file <- fs::file_temp(ext = output_extension, tmp_dir = tempdir())

  # clean up after
  # on.exit = tmp is deleted even if function errors
  on.exit({
    fs::file_delete(tmp_file)
  })

  switch(output_extension,
    ".csv" = ifelse(csv2, readr::write_csv2(x = .data, file = tmp_file), readr::write_csv(x = .data, file = tmp_file)),
    ".xlsx" = writexl::write_xlsx(x = .data, path = tmp_file),
    ".rds" = readr::write_rds(x = .data, file = tmp_file)
  )

  # create button
  create_button(button_label, button_type, output_file, tmp_file, self_contained, icon, ...)
}

#' @export
#' @method download_this data.frame
download_this.data.frame <- function(.data,
                                     ...,
                                     output_name = NULL,
                                     output_extension = c(".csv", ".xlsx", ".rds"),
                                     button_label = "Download data",
                                     button_type = c("default", "primary", "success", "info", "warning", "danger"),
                                     icon = "fa fa-save",
                                     self_contained = FALSE,
                                     csv2 = TRUE) {
  output_extension <- match.arg(output_extension)
  button_type <- match.arg(button_type)

  if (is.null(output_name)) {
    output_name <- deparse(substitute(.data))
  }

  ## name of the final output file
  output_file <- paste0(output_name, output_extension)

  ## generate temporary file in temporary folder
  tmp_file <- fs::file_temp(ext = output_extension, tmp_dir = tempdir())

  # clean up after
  # on.exit = tmp is deleted even if function errors
  on.exit({
    fs::file_delete(tmp_file)
  })

  switch(output_extension,
    ".csv" = ifelse(csv2, readr::write_csv2(x = .data, file = tmp_file), readr::write_csv(x = .data, file = tmp_file)),
    ".xlsx" = writexl::write_xlsx(x = .data, path = tmp_file),
    ".rds" = readr::write_rds(x = .data, file = tmp_file)
  )

  # create button
  create_button(button_label, button_type, output_file, tmp_file, self_contained, icon, ...)
}

#' @export
#' @method download_this ggplot
download_this.ggplot <- function(.data,
                                 ...,
                                 output_name = NULL,
                                 output_extension = ".png",
                                 button_label = "Download plot",
                                 button_type = c("default", "primary", "success", "info", "warning", "danger"),
                                 icon = "fa fa-save",
                                 self_contained = FALSE,
                                 ggsave_args = list()) {
  button_type <- match.arg(button_type)

  if (is.null(output_name)) {
    output_name <- deparse(substitute(.data))
  }

  ## name of the final output file
  output_file <- paste0(output_name, output_extension)

  ## generate temporary file in temporary folder
  tmp_file <- fs::file_temp(ext = output_extension, tmp_dir = tempdir())

  # clean up after
  # on.exit = tmp is deleted even if function errors
  on.exit({
    fs::file_delete(tmp_file)
  })

  # to allow additional arguments to ggsave
  ggsave_args$device <- gsub("\\.", "", output_extension)
  ggsave_args$plot <- .data
  ggsave_args$filename <- tmp_file
  do.call(ggplot2::ggsave, ggsave_args)

  # create button
  create_button(button_label, button_type, output_file, tmp_file, self_contained, icon, ...)
}

#' Download file from a web address
#'
#' It associates your download button to a web link. This might be an
#' alternative when your file is too big for being handled by `download_this()`.
#'
#' @param link A web address for downloadthing the file.
#' @param button_label Character (HTML), button label
#' @param button_type Character, one of the standard Bootstrap types
#' @param has_icon Specify whether to include fontawesome icons in the button
#'   label
#' @param icon Fontawesome tag e.g.: "fa fa-save"
#' @param self_contained A boolean to specify whether your HTML output is
#'   self-contained. Default to `FALSE`.
#' @param ... attributes (named arguments) and children (unnamed arguments) of
#'   the button, passed to `htmltools::tag()`.
#'
#' @return \code{htmltools::\link[htmltools]{tag}}, \code{<button>}
#' @export
#'
#' @examples
#' \dontrun{
#' ## Link in Github repo
#' download_link(
#'   link = "https://github.com/fmmattioni/downloadthis/raw/master/inst/example/file_1.pdf",
#'   button_label = "Download pdf file",
#'   button_type = "danger",
#'   has_icon = TRUE,
#'   icon = "fa fa-save",
#'   self_contained = FALSE
#' )
#' }
download_link <- function(link,
                          button_label = "Download data",
                          button_type = c("default", "primary", "success", "info", "warning", "danger"),
                          has_icon = TRUE,
                          icon = "fa fa-save",
                          self_contained = FALSE,
                          ...) {
  button_type <- match.arg(button_type)

  ## create button label with icon
  if (has_icon) {
    button_label <- htmltools::HTML(paste(htmltools::tags$i(class = icon), button_label))
  }

  ## generate download button
  button_out <- bsplus::bs_button(
    label = button_label,
    button_type = button_type,
    ... = ...
  ) %>%
    htmltools::a(
      href = link
    )

  htmltools::tagList(
    if (has_icon) {
      add_fontawesome(self_contained)
    },
    button_out
  )
}


#' Download a local file or multiple files
#'
#' In case multiple files are chosen, the files will be converted to a `.zip`
#' file.
#'
#' @param path Path to the file(s). If multiple files are chosen, a vector must
#'   be passed to this argument.
#' @param output_name Name of of the output file. If not specified, it will take
#'   the source file's name if one file is specified. In case of multiple files,
#'   the `output_name` must be specified.
#' @param button_label Character (HTML), button label
#' @param button_type Character, one of the standard Bootstrap types
#' @param has_icon Specify whether to include fontawesome icons in the button
#'   label
#' @param icon Fontawesome tag e.g.: "fa fa-save"
#' @param self_contained A boolean to specify whether your HTML output is
#'   self-contained. Default to `FALSE`.
#' @param ... attributes (named arguments) and children (unnamed arguments) of
#'   the button, passed to `htmltools::tag()`.
#'
#' @return \code{htmltools::\link[htmltools]{tag}}, \code{<button>}
#' @export
#'
#' @examples
#' \dontrun{
#' ## One file example
#' download_file(
#'   path = system.file("assets/css/all.min.css", package = "downloadthis"),
#'   output_name = "CSS file from downloadthis",
#'   button_label = "Download css file",
#'   button_type = "danger",
#'   has_icon = TRUE,
#'   icon = "fa fa-save",
#'   self_contained = FALSE
#' )
#'
#' ## Multiple files example
#' path_files <- list.files(
#'   path = system.file("assets/css", package = "downloadthis"),
#'   full.names = TRUE
#' )
#'
#' download_file(
#'   path = path_files,
#'   output_name = "Files from downloadthis",
#'   button_label = "Download files",
#'   button_type = "danger",
#'   has_icon = TRUE,
#'   icon = "fa fa-save",
#'   self_contained = FALSE
#' )
#' }
download_file <- function(path,
                          output_name,
                          button_label = "Download data",
                          button_type = c("default", "primary", "success", "info", "warning", "danger"),
                          has_icon = TRUE,
                          icon = "fa fa-save",
                          self_contained = FALSE,
                          ...) {
  if (!is.atomic(path)) {
    stop("You should pass your files paths as an atomic vector.", call. = FALSE)
  }

  button_type <- match.arg(button_type)

  ## check for multiple files
  multiple_files <- ifelse(length(path) > 1, TRUE, FALSE)

  if (missing(output_name) & !multiple_files) {
    output_file <- fs::path_file(path = path)
  } else if (missing(output_name) & multiple_files) {
    stop("You must specifiy the output name for multiple files.", call. = FALSE)
  } else if (!missing(output_name) & !multiple_files) {
    output_file <- paste0(output_name, ".", fs::path_ext(path = path))
  }

  if (multiple_files) {
    ## set output file name
    output_file <- paste0(output_name, ".zip")

    ## generate temporary file in temporary folder
    tmp_file <- fs::file_temp(ext = ".zip", tmp_dir = tempdir())

    zip::zipr(zipfile = tmp_file, files = path)
  } else {
    tmp_file <- path
  }

  # create button
  create_button(button_label, button_type, output_file, tmp_file, self_contained, icon, ...)
}


#' Download a directory
#'
#' The path is converted into a `.zip` file.
#'
#' @param path Path to directory.
#' @param output_name Name of of the output file.
#' @param button_label Character (HTML), button label
#' @param button_type Character, one of the standard Bootstrap types
#' @param has_icon Specify whether to include fontawesome icons in the button
#'   label
#' @param icon Fontawesome tag e.g.: "fa fa-save"
#' @param self_contained A boolean to specify whether your HTML output is
#'   self-contained. Default to `FALSE`.
#' @param ... attributes (named arguments) and children (unnamed arguments) of
#'   the button, passed to `htmltools::tag()`.
#'
#' @return \code{htmltools::\link[htmltools]{tag}}, \code{<button>}
#' @export
#'
#' @examples
#' \dontrun{
#' ## Directory path as an example
#' download_dir(
#'   path = system.file("assets", package = "downloadthis"),
#'   output_name = "example dir",
#'   button_label = "Download directory",
#'   button_type = "success",
#'   has_icon = TRUE,
#'   icon = "fa fa-save",
#'   self_contained = FALSE
#' )
#' }
download_dir <- function(path,
                         output_name,
                         button_label = "Download data",
                         button_type = c("default", "primary", "success", "info", "warning", "danger"),
                         has_icon = TRUE,
                         icon = "fa fa-save",
                         self_contained = FALSE,
                         ...) {

  ## check if path is a directory
  if (!fs::is_dir(path = path)) {
    stop("It looks like your path is not a directory. Have you tried passing a file path to the function?", call. = FALSE)
  }

  if (missing(output_name)) {
    stop("You must specifiy the output name.", call. = FALSE)
  }

  button_type <- match.arg(button_type)

  ## set output file name
  output_file <- paste0(output_name, ".zip")

  ## generate temporary file in temporary folder
  tmp_file <- fs::file_temp(ext = ".zip", tmp_dir = tempdir())

  zip::zipr(zipfile = tmp_file, files = path)

  # create button
  create_button(button_label, button_type, output_file, tmp_file, self_contained, icon, ...)
}
