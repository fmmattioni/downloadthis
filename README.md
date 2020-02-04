
<!-- README.md is generated from README.Rmd. Please edit that file -->

# downloadthis

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of `downloadthis` is to implement download buttons in HTML
output from RMarkdown without the need for `runtime:shiny`.

## Installation

You can install the development version of `downloadthis` from
[GitHub](https://github.com/) with:

``` r
remotes::install_github("fmmattioni/downloadthis")
```

## Introduction

This package builds the download button in RMarkdown using
[bsplus](https://github.com/ijlyttle/bsplus), and it was inspired on
[this post](https://yihui.org/en/2018/07/embed-file/) from [Yihui
Xie](https://github.com/yihui).

## Example

``` r
library(downloadthis)

mtcars %>% 
  download_this(
    output_name = "mtcars data set",
    output_extension = ".csv",
    button_label = "Download data",
    button_type = "warning"
  )
```

Please note that the ‘downloadthis’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
