
<!-- README.md is generated from README.Rmd. Please edit that file -->

# downloadthis <img src='man/figures/logo.png' align="right" height="240" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version-ago/downloadthis)](https://CRAN.R-project.org/package=downloadthis)
[![R build
status](https://github.com/fmmattioni/downloadthis/workflows/R-CMD-check/badge.svg)](https://github.com/fmmattioni/downloadthis)
[![Monthly downloads
badge](https://cranlogs.r-pkg.org/badges/last-month/downloadthis?color=blue)](https://CRAN.R-project.org/package=downloadthis)
[![Total downloads
badge](https://cranlogs.r-pkg.org/badges/grand-total/downloadthis?color=blue)](https://CRAN.R-project.org/package=downloadthis)
<br>
<a href="https://www.buymeacoffee.com/XQauwUWGm" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 30px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
<!-- badges: end -->

The goal of `downloadthis` is to implement download buttons in HTML
output from RMarkdown without the need for `runtime:shiny`.

## Installation

You can install the released version of `downloadthis` from
[CRAN](https://CRAN.R-project.org/package=downloadthis) with:

``` r
install.packages("downloadthis")
```

You can install the development version of `downloadthis` from
[GitHub](https://github.com/fmmattioni/downloadthis/) with:

``` r
# install.packages("remotes")
remotes::install_github("fmmattioni/downloadthis")
```

## Introduction

This package builds the download button in R Markdown using
[bsplus](https://github.com/ijlyttle/bsplus), and it was inspired on
[this post](https://yihui.org/en/2018/07/embed-file/) from [Yihui
Xie](https://github.com/yihui).

✅ `{downloadthis}` now uses [font-awesome icons
v.5.13.0](https://fontawesome.com/)

## Usage

### Data frames, lists, or any R object

``` r
library(downloadthis)

mtcars %>% 
  download_this(
    output_name = "mtcars data set",
    output_extension = ".csv",
    button_label = "Download data",
    button_type = "warning",
    has_icon = TRUE,
    icon = "fa fa-save"
  )
```

``` r
vector_example <- 1:10
linear_model <- lm(mpg ~ gear, data = mtcars)

list(mtcars, iris, vector_example, linear_model) %>%
  download_this(
    output_name = "datasets, vector, and linear model",
    output_extension = ".rds",
    button_label = "Download as rds",
    button_type = "success",
    has_icon = TRUE,
    icon = "fa fa-save"
  )
```

### Web address

``` r
## Link in Github repo
download_link(
  link = "https://github.com/fmmattioni/downloadthis/raw/master/inst/example/file_1.pdf",
  button_label = "Download pdf file",
  button_type = "danger",
  has_icon = TRUE,
  icon = "fa fa-save",
  self_contained = FALSE
)
```

### Local files

``` r
## One file example
download_file(
  path = system.file("assets/css/all.min.css", package = "downloadthis"),
  output_name = "CSS file from downloadthis",
  button_label = "Download css file",
  button_type = "danger",
  has_icon = TRUE,
  icon = "fa fa-save",
  self_contained = FALSE
)
```

### Local directory

``` r
## Directory path as an example
download_dir(
  path = system.file("assets", package = "downloadthis"),
  output_name = "example dir",
  button_label = "Download directory",
  button_type = "success",
  has_icon = TRUE,
  icon = "fa fa-save",
  self_contained = FALSE
)
```

## Vignettes

  - [Introduction to
    downloadthis](https://fmmattioni.github.io/downloadthis/articles/downloadthis.html)
  - [Button
    types](https://fmmattioni.github.io/downloadthis/articles/button_types.html)
  - [Customizing buttons with
    css](https://fmmattioni.github.io/downloadthis/articles/customization.html)

## Related work

  - [xfun](https://github.com/yihui/xfun): The `xfun` package provides
    links instead of buttons for local files and directories.

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](https://www.contributor-covenant.org/version/1/0/0/code-of-conduct.html).
By participating in this project you agree to abide by its
terms.

## Support

<a href="https://www.buymeacoffee.com/XQauwUWGm" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
