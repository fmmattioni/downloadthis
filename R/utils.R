encode_this <- function(.tmp_file) {
  ## encode file as a base64 string
  ## taken from https://yihui.org/en/2018/07/embed-file/
  base64enc::base64encode(.tmp_file)
}

get_data_uri <- function(tmp_file) {
  paste0(
    "data:",
    mime::guess_type(file = tmp_file),
    ";base64,",
    encode_this(.tmp_file = tmp_file)
  )
}

add_fontawesome <- function(self_contained) {
  if (self_contained) {
    htmltools::htmlDependency(
      name = "font-awesome",
      version = "5.13.0",
      src = "assets",
      stylesheet = c("css/all.min.css", "css/v4-shims.min.css"),
      package = "downloadthis"
    )
  } else {
    htmltools::htmlDependency(
      name = "font-awesome",
      version = "5.13.0",
      src = "assets",
      script = "js/script.js",
      package = "downloadthis"
    )
  }
}

create_button <- function(button_label, button_type, output_file, tmp_file, self_contained, icon, ...) {
  has_icon <- !is.null(icon)

  if (has_icon) {
    button_label <- htmltools::HTML(paste(htmltools::tags$i(class = icon), button_label))
  }

  button_out <- bsplus::bs_button(
    label = button_label,
    button_type = button_type,
    ...
  ) %>%
    htmltools::a(
      onclick = create_blob(tmp_file = tmp_file, output_file = output_file)
    )

  if (has_icon) {
    button_out <- htmltools::attachDependencies(button_out, add_fontawesome(self_contained))
  }

  return(button_out)
}

create_blob <- function(tmp_file, output_file) {
  base64 <- get_data_uri(tmp_file)
  ## produce js function
  js_function <- paste0("fetch('", base64, "').then(res => res.blob()).then(blob => {
      const downloadURL = window.URL.createObjectURL(blob);
      const a = document.createElement('a');
      document.body.appendChild(a);
      a.href = downloadURL;
      a.download = '", output_file, "'; a.click();
      window.URL.revokeObjectURL(downloadURL);
      document.body.removeChild(a);
    });"
  )
  js_function
}
