
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

:white\_check\_mark: `{downloadthis}` now uses [font-awesome icons
v.5.13.0](https://fontawesome.com/)

## Example

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

<!--html_preserve-->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" integrity="sha256-h20CPZ0QyXlBuAw7A+KluUYx/3pK+c7lYEpqLTlxjYQ=" crossorigin="anonymous" />
<a href="data:text/csv;base64,bXBnO2N5bDtkaXNwO2hwO2RyYXQ7d3Q7cXNlYzt2czthbTtnZWFyO2NhcmIKMjEsMDs2OzE2MCwwOzExMDszLDkwOzIsNjIwOzE2LDQ2OzA7MTs0OzQKMjEsMDs2OzE2MCwwOzExMDszLDkwOzIsODc1OzE3LDAyOzA7MTs0OzQKMjIsODs0OzEwOCwwOyA5MzszLDg1OzIsMzIwOzE4LDYxOzE7MTs0OzEKMjEsNDs2OzI1OCwwOzExMDszLDA4OzMsMjE1OzE5LDQ0OzE7MDszOzEKMTgsNzs4OzM2MCwwOzE3NTszLDE1OzMsNDQwOzE3LDAyOzA7MDszOzIKMTgsMTs2OzIyNSwwOzEwNTsyLDc2OzMsNDYwOzIwLDIyOzE7MDszOzEKMTQsMzs4OzM2MCwwOzI0NTszLDIxOzMsNTcwOzE1LDg0OzA7MDszOzQKMjQsNDs0OzE0Niw3OyA2MjszLDY5OzMsMTkwOzIwLDAwOzE7MDs0OzIKMjIsODs0OzE0MCw4OyA5NTszLDkyOzMsMTUwOzIyLDkwOzE7MDs0OzIKMTksMjs2OzE2Nyw2OzEyMzszLDkyOzMsNDQwOzE4LDMwOzE7MDs0OzQKMTcsODs2OzE2Nyw2OzEyMzszLDkyOzMsNDQwOzE4LDkwOzE7MDs0OzQKMTYsNDs4OzI3NSw4OzE4MDszLDA3OzQsMDcwOzE3LDQwOzA7MDszOzMKMTcsMzs4OzI3NSw4OzE4MDszLDA3OzMsNzMwOzE3LDYwOzA7MDszOzMKMTUsMjs4OzI3NSw4OzE4MDszLDA3OzMsNzgwOzE4LDAwOzA7MDszOzMKMTAsNDs4OzQ3MiwwOzIwNTsyLDkzOzUsMjUwOzE3LDk4OzA7MDszOzQKMTAsNDs4OzQ2MCwwOzIxNTszLDAwOzUsNDI0OzE3LDgyOzA7MDszOzQKMTQsNzs4OzQ0MCwwOzIzMDszLDIzOzUsMzQ1OzE3LDQyOzA7MDszOzQKMzIsNDs0OyA3OCw3OyA2Njs0LDA4OzIsMjAwOzE5LDQ3OzE7MTs0OzEKMzAsNDs0OyA3NSw3OyA1Mjs0LDkzOzEsNjE1OzE4LDUyOzE7MTs0OzIKMzMsOTs0OyA3MSwxOyA2NTs0LDIyOzEsODM1OzE5LDkwOzE7MTs0OzEKMjEsNTs0OzEyMCwxOyA5NzszLDcwOzIsNDY1OzIwLDAxOzE7MDszOzEKMTUsNTs4OzMxOCwwOzE1MDsyLDc2OzMsNTIwOzE2LDg3OzA7MDszOzIKMTUsMjs4OzMwNCwwOzE1MDszLDE1OzMsNDM1OzE3LDMwOzA7MDszOzIKMTMsMzs4OzM1MCwwOzI0NTszLDczOzMsODQwOzE1LDQxOzA7MDszOzQKMTksMjs4OzQwMCwwOzE3NTszLDA4OzMsODQ1OzE3LDA1OzA7MDszOzIKMjcsMzs0OyA3OSwwOyA2Njs0LDA4OzEsOTM1OzE4LDkwOzE7MTs0OzEKMjYsMDs0OzEyMCwzOyA5MTs0LDQzOzIsMTQwOzE2LDcwOzA7MTs1OzIKMzAsNDs0OyA5NSwxOzExMzszLDc3OzEsNTEzOzE2LDkwOzE7MTs1OzIKMTUsODs4OzM1MSwwOzI2NDs0LDIyOzMsMTcwOzE0LDUwOzA7MTs1OzQKMTksNzs2OzE0NSwwOzE3NTszLDYyOzIsNzcwOzE1LDUwOzA7MTs1OzYKMTUsMDs4OzMwMSwwOzMzNTszLDU0OzMsNTcwOzE0LDYwOzA7MTs1OzgKMjEsNDs0OzEyMSwwOzEwOTs0LDExOzIsNzgwOzE4LDYwOzE7MTs0OzIK" download="mtcars data set.csv">
<button class="btn btn-warning"><i class="fa fa-save"></i> Download
data</button> </a><!--/html_preserve-->

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](https://www.contributor-covenant.org/version/1/0/0/code-of-conduct.html).
By participating in this project you agree to abide by its
terms.

## Support

<a href="https://www.buymeacoffee.com/XQauwUWGm" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png" alt="Buy Me A Coffee" style="height: 41px !important;width: 174px !important;box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 3px 2px 0px rgba(190, 190, 190, 0.5) !important;" ></a>
