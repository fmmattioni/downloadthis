#' Download button
#'
#' Wrapper around \code{bsplus::\link[bsplus]{bs_button}} to provide a download button for HTML outputs in R Markdown.
#' Internally, the function writes the file to `tempdir()`, encodes it, and produces the download button.
#'
#' @param .data A data frame to write to disk.
#' @param output_name Name of of the output file.
#' @param output_extension Extension of the output file. Currently, only  \code{.csv} and  \code{.xlsx} are supported.
#' @param button_label character (HTML), button label
#' @param button_type character, one of the standard Bootstrap types
#' @param has_icon specify whether to include fontawesome icons in the button label
#' @param icon fontawesome tag e.g.: "fa fa-save"
#' @param ... attributes (named arguments) and children (unnamed arguments)
#'   of the button, passed to \code{htmltools::\link[htmltools]{tag}}
#'
#' @return \code{htmltools::\link[htmltools]{tag}}, \code{<button/>}
#' @export
#'
#' @section Warning:
#' This example will write the `mtcars` dataset to `tempdir()` and produce the download button for the file `mtcars dataset.csv` with the `fa fa-save` icon on the `Download data` label.
#'
#' @examples
#' mtcars %>%
#'   download_this(
#'     output_name = "mtcars dataset",
#'     output_extension = ".csv",
#'     button_label = "Download data",
#'     button_type = "warning",
#'     has_icon = TRUE,
#'     icon = "fa fa-save"
#'   )
download_this <- function(
  .data,
  output_name,
  output_extension = c(".csv", ".xlsx"),
  button_label = "Download data",
  button_type = c("default", "primary", "success", "info", "warning", "danger"),
  has_icon = TRUE,
  icon = "fa fa-save",
  ...
){

  if(!is.data.frame(.data))
    stop("You must pass a data frame to the function.", call. = FALSE)

  ## add fontawesome
  add_fontawesome()

  output_extension <- match.arg(output_extension)
  button_type <- match.arg(button_type)

  ## name of the final output file
  output_file <- paste0(output_name, output_extension)

  ## generate temporary file in temporary folder
  tmp_file <- fs::file_temp(ext = output_extension, tmp_dir = tempdir())

  if(output_extension == ".csv") {
    readr::write_csv(x = .data, path = tmp_file)
  } else {
    writexl::write_xlsx(x = .data, path = tmp_file)
  }

  ## create button label
  if(has_icon) {
    button_label <- htmltools::HTML(paste(htmltools::tags$i(class = icon), button_label))
  } else {
    button_label
  }

  ## generate download button
  bsplus::bs_button(
    label = button_label,
    button_type = button_type,
    ... = ...
  ) %>%
    htmltools::a(
      href = paste0(
        "data:",
        mime::guess_type(file = tmp_file),
        ";base64,",
        encode_this(.tmp_file = tmp_file)
      ),
      download = output_file
    )
}

encode_this <- function(.tmp_file) {
  ## encode file as a base64 string
  ## taken from https://yihui.org/en/2018/07/embed-file/
  base64enc::base64encode(.tmp_file)
}

add_fontawesome <- function(){
  ## this will ensure that fontawesome is added
  ## https://github.com/rstudio/rmarkdown/issues/813

  htmltools::tagList(rmarkdown::html_dependency_font_awesome())
}
