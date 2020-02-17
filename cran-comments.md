## Test environments
* local R installation, R 3.6.1
* ubuntu 16.04 (on travis-ci), R 3.6.1
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a resubmission.

Comments from previous submission:

> Please do not write to the user filespace. If you really have to write out something, use tempdir() if the user is not asked and in examples.

I now explicitly added `tempdir()` to the `fs::file_temp()` function. The following was added:

> ## generate temporary file in temporary folder
> tmp_file <- fs::file_temp(ext = output_extension, tmp_dir = tempdir())

I added a note in the function `description`:

> Internally, the function writes the file to 'tempdir()', encodes it, and produces the download button.

And I also added a `warning` section before `examples`:

> Warning
> This example will write the 'mtcars' dataset to 'tempdir()' and produce the download button for the file 'mtcars dataset.csv' with the 'fa fa-save' icon on the 'Download data' label.
