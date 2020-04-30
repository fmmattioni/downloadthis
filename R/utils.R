encode_this <- function(.tmp_file) {
  ## encode file as a base64 string
  ## taken from https://yihui.org/en/2018/07/embed-file/
  base64enc::base64encode(.tmp_file)
}

add_fontawesome <- function(self_contained){
  if(self_contained) {
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

all_data_frame_from_list <- function(.list) {
  all(sapply(.list, is.data.frame))
}
