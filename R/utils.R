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
  ## get type of file
  type_file <- mime::guess_type(file = tmp_file)
  ## read bin
  bin_file <- readBin(tmp_file, "raw", 10e6)
  bin_file <- jsonlite::toJSON(bin_file, raw = "js")
  ## produce js function
  js_function <- glue::glue(
    "
    const myBlob = new Blob([{{bin_file}}], { type: '{{type_file}}' });
    const downloadURL = window.URL.createObjectURL(myBlob);
    const a = document.createElement('a');
    document.body.appendChild(a);
    a.href = downloadURL;
    a.download = '{{output_file}}';
    a.click();
    window.URL.revokeObjectURL(downloadURL);
    document.body.removeChild(a);
    ",
    .open = "{{",
    .close = "}}"
  )
  js_function
}
