
#' Download button
#'
#' Wrapper around \code{bsplus::\link[bsplus]{bs_button}} to provide a download button for HTML outputs in RMarkdown
#'
#' @param .data A data frame to write to disk.
#' @param output_name Name of of the output file.
#' @param output_extension Extension of the output file. Currently, only  \code{.csv} and  \code{.xlsx} are supported.
#' @param button_label character (HTML), button label
#' @param button_type character, one of the standard Bootstrap types
#' @param ... attributes (named arguments) and children (unnamed arguments)
#'   of the button, passed to \code{htmltools::\link[htmltools]{tag}}
#'
#' @return \code{htmltools::\link[htmltools]{tag}}, \code{<button/>}
#' @export
#'
#' @examples
#'
#' mtcars %>%
#'   download_this(
#'     output_name = "mtcars data set",
#'     output_extension = ".csv",
#'     button_label = "Download data",
#'     button_type = "warning",
#'   )
download_this <- function(
  .data,
  output_name,
  output_extension = c(".csv", ".xlsx"),
  button_label,
  button_type = c("default", "primary", "success", "info", "warning", "danger"),
  ...
){

  if(!is.data.frame(.data))
    stop("You must pass a data frame to the function.", call. = FALSE)

  output_extension <- match.arg(output_extension)
  button_type <- match.arg(button_type)

  ## name of the final output file
  output_file <- paste0(output_name, output_extension)

  ## generate temporary file
  tmp_file <- fs::file_temp(ext = output_extension)

  if(output_extension == ".csv") {
    readr::write_csv(x = .data, path = tmp_file)
  } else {
    writexl::write_xlsx(x = .data, path = tmp_file)
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
