
<!-- README.md is generated from README.Rmd. Please edit that file -->

# downloadthis <img src='man/figures/logo.png' align="right" height="240" />

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
[![CRAN
status](https://www.r-pkg.org/badges/version/downloadthis)](https://CRAN.R-project.org/package=downloadthis)
[![R build
status](https://github.com/fmmattioni/downloadthis/workflows/R-CMD-check/badge.svg)](https://github.com/fmmattioni/downloadthis)
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

This package builds the download button in R Markdown using
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
    button_type = "warning",
    has_icon = TRUE,
    icon = "fa fa-save"
  )
```

<!--html_preserve-->

<a href="data:text/csv;base64,bXBnLGN5bCxkaXNwLGhwLGRyYXQsd3QscXNlYyx2cyxhbSxnZWFyLGNhcmIKMjEsNiwxNjAsMTEwLDMuOSwyLjYyLDE2LjQ2LDAsMSw0LDQKMjEsNiwxNjAsMTEwLDMuOSwyLjg3NSwxNy4wMiwwLDEsNCw0CjIyLjgsNCwxMDgsOTMsMy44NSwyLjMyLDE4LjYxLDEsMSw0LDEKMjEuNCw2LDI1OCwxMTAsMy4wOCwzLjIxNSwxOS40NCwxLDAsMywxCjE4LjcsOCwzNjAsMTc1LDMuMTUsMy40NCwxNy4wMiwwLDAsMywyCjE4LjEsNiwyMjUsMTA1LDIuNzYsMy40NiwyMC4yMiwxLDAsMywxCjE0LjMsOCwzNjAsMjQ1LDMuMjEsMy41NywxNS44NCwwLDAsMyw0CjI0LjQsNCwxNDYuNyw2MiwzLjY5LDMuMTksMjAsMSwwLDQsMgoyMi44LDQsMTQwLjgsOTUsMy45MiwzLjE1LDIyLjksMSwwLDQsMgoxOS4yLDYsMTY3LjYsMTIzLDMuOTIsMy40NCwxOC4zLDEsMCw0LDQKMTcuOCw2LDE2Ny42LDEyMywzLjkyLDMuNDQsMTguOSwxLDAsNCw0CjE2LjQsOCwyNzUuOCwxODAsMy4wNyw0LjA3LDE3LjQsMCwwLDMsMwoxNy4zLDgsMjc1LjgsMTgwLDMuMDcsMy43MywxNy42LDAsMCwzLDMKMTUuMiw4LDI3NS44LDE4MCwzLjA3LDMuNzgsMTgsMCwwLDMsMwoxMC40LDgsNDcyLDIwNSwyLjkzLDUuMjUsMTcuOTgsMCwwLDMsNAoxMC40LDgsNDYwLDIxNSwzLDUuNDI0LDE3LjgyLDAsMCwzLDQKMTQuNyw4LDQ0MCwyMzAsMy4yMyw1LjM0NSwxNy40MiwwLDAsMyw0CjMyLjQsNCw3OC43LDY2LDQuMDgsMi4yLDE5LjQ3LDEsMSw0LDEKMzAuNCw0LDc1LjcsNTIsNC45MywxLjYxNSwxOC41MiwxLDEsNCwyCjMzLjksNCw3MS4xLDY1LDQuMjIsMS44MzUsMTkuOSwxLDEsNCwxCjIxLjUsNCwxMjAuMSw5NywzLjcsMi40NjUsMjAuMDEsMSwwLDMsMQoxNS41LDgsMzE4LDE1MCwyLjc2LDMuNTIsMTYuODcsMCwwLDMsMgoxNS4yLDgsMzA0LDE1MCwzLjE1LDMuNDM1LDE3LjMsMCwwLDMsMgoxMy4zLDgsMzUwLDI0NSwzLjczLDMuODQsMTUuNDEsMCwwLDMsNAoxOS4yLDgsNDAwLDE3NSwzLjA4LDMuODQ1LDE3LjA1LDAsMCwzLDIKMjcuMyw0LDc5LDY2LDQuMDgsMS45MzUsMTguOSwxLDEsNCwxCjI2LDQsMTIwLjMsOTEsNC40MywyLjE0LDE2LjcsMCwxLDUsMgozMC40LDQsOTUuMSwxMTMsMy43NywxLjUxMywxNi45LDEsMSw1LDIKMTUuOCw4LDM1MSwyNjQsNC4yMiwzLjE3LDE0LjUsMCwxLDUsNAoxOS43LDYsMTQ1LDE3NSwzLjYyLDIuNzcsMTUuNSwwLDEsNSw2CjE1LDgsMzAxLDMzNSwzLjU0LDMuNTcsMTQuNiwwLDEsNSw4CjIxLjQsNCwxMjEsMTA5LDQuMTEsMi43OCwxOC42LDEsMSw0LDIK" download="mtcars data set.csv">
<button class="btn btn-warning"><i class="fa fa-save"></i> Download
data</button> </a><!--/html_preserve-->

Please note that the ‘downloadthis’ project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its
terms.

## Support

<style>.bmc-button img{height: 34px !important;width: 35px !important;margin-bottom: 1px !important;box-shadow: none !important;border: none !important;vertical-align: middle !important;}.bmc-button{padding: 7px 10px 7px 10px !important;line-height: 35px !important;height:51px !important;min-width:217px !important;text-decoration: none !important;display:inline-flex !important;color:#FFFFFF !important;background-color:#FF813F !important;border-radius: 5px !important;border: 1px solid transparent !important;padding: 7px 10px 7px 10px !important;font-size: 22px !important;letter-spacing: 0.6px !important;box-shadow: 0px 1px 2px rgba(190, 190, 190, 0.5) !important;-webkit-box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;margin: 0 auto !important;font-family:'Cookie', cursive !important;-webkit-box-sizing: border-box !important;box-sizing: border-box !important;-o-transition: 0.3s all linear !important;-webkit-transition: 0.3s all linear !important;-moz-transition: 0.3s all linear !important;-ms-transition: 0.3s all linear !important;transition: 0.3s all linear !important;}.bmc-button:hover, .bmc-button:active, .bmc-button:focus {-webkit-box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;text-decoration: none !important;box-shadow: 0px 1px 2px 2px rgba(190, 190, 190, 0.5) !important;opacity: 0.85 !important;color:#FFFFFF !important;}</style>

<link href="https://fonts.googleapis.com/css?family=Cookie" rel="stylesheet"><a class="bmc-button" target="_blank" href="https://www.buymeacoffee.com/XQauwUWGm"><img src="https://cdn.buymeacoffee.com/buttons/bmc-new-btn-logo.svg" alt="Buy me a coffee"><span style="margin-left:15px;font-size:28px !important;">Buy
me a
coffee</span></a>

<br>

<form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">

<input type="hidden" name="cmd" value="_s-xclick" />
<input type="hidden" name="hosted_button_id" value="9Y82QGUZAX6RE" />
<input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_donate_LG.gif" border="0" name="submit" title="PayPal - The safer, easier way to pay online!" alt="Donate with PayPal button" />
<img alt="" border="0" src="https://www.paypal.com/en_DE/i/scr/pixel.gif" width="1" height="1" />

</form>
