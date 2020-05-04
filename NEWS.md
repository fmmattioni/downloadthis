# downloadthis 0.2.0

* Removed `rmarkdown` dependency and moved it to 'Suggests'.

* Font-awesome dependency is now correctly added to the `head` tag (Thanks @AmitLevinson).

* Added `self_contained` option.

* Removed `purrr` dependency.

* Added `.rds` support - now any R object can be used for downloading as an `.rds` file.

* Added `download_link()`, `download_file()`, and `download_dir()` for downloading from web links, and local file(s) and directory.

# downloadthis 0.1.3

* Fixed bug that fontawesome dependency was not being correctly added to the HTML output.

* Now fontawesome icons are external, which makes the HTML output file much lighter.

# downloadthis 0.1.2

* Fixed warning when checking for list inputs.

* Now the `.csv` export option uses `readr::read_csv2()`.

* Added more details to the documentation.

# downloadthis 0.1.1

* Now it is possible to pass a list of (named) data frames to the function to be written in separate sheets in '.xlsx'.

* Created vignette to show how the download button can be customized.

* Updated vignettes.

# downloadthis 0.1.0

* Added a `NEWS.md` file to track changes to the package.

* Added fontawesome icons to button label.
