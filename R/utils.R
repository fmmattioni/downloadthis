encode_this <- function(.tmp_file) {
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
      version = "6.7.2",
      src = "assets",
      stylesheet = c("css/all.min.css", "css/v4-shims.min.css"),
      package = "downloadthis"
    )
  } else {
    htmltools::htmlDependency(
      name = "font-awesome",
      version = "6.7.2",
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
    onclick = create_blob(tmp_file = tmp_file, output_file = output_file),
    ...
  )

  if (has_icon) {
    button_out <- htmltools::attachDependencies(button_out, add_fontawesome(self_contained))
  }

  return(button_out)
}

create_blob <- function(tmp_file, output_file) {
  base64 <- get_data_uri(tmp_file)
  js_function <- paste0("
    async function downloadFile(event) {
      event.preventDefault();
      try {
        const response = await fetch('", base64, "');
        if (!response.ok) throw new Error('Network response failed');
        const blob = await response.blob();
        const blobUrl = window.URL.createObjectURL(blob);
        const a = document.createElement('a');
        a.href = blobUrl;
        a.download = '", output_file, "';
        a.style.display = 'none';
        document.body.appendChild(a);
        a.dispatchEvent(new MouseEvent('click'));
        document.body.removeChild(a);
        setTimeout(() => {
          window.URL.revokeObjectURL(blobUrl);
        }, 100);
        return false;
      } catch (error) {
        console.error('Download failed:', error);
        alert('Download failed. Please try again.');
      }
    }
    downloadFile(event);
  ")
  js_function
}
