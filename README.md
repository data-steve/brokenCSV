
**brokenCSV** generates a report on comma-broken status of CSV(s), including broken rows and potential offending columns needing to be quoted in file. If path param is a folder, for readability a report named \file{csv_comma_broken_report.txt} is dropped into path folder and opened automatically to source pane. But if path param is only a file, then the report is only printed to console.

Installation
============

To download the development version of **brokenCSV**:

Download the [zip
ball](https://github.com/data-steve/brokenCSV/zipball/master) or
[tar ball](https://github.com/data-steve/brokenCSV/tarball/master),
decompress and run `R CMD INSTALL` on it, or use the **pacman** package
to install the development version:

    if (!require("pacman")) install.packages("pacman")
    pacman::p_load_gh("data-steve/brokenCSV")

Contact
=======

You are welcome to: 
- submit suggestions and bug-reports at: <https://github.com/data-steve/brokenCSV/issues> 
- send a pull request on: <https://github.com/data-steve/brokenCSV/> 
- compose a friendly e-mail to: <steven.troy.simpson@gmail.com>
