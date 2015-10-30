#' Generates Report on Comma-Broken Status of CSV(s)
#'
#' Generates Report on Comma-Broken Status of CSV(s), including broken rows and potential offending columns needing to be quoted in file.
#'
#' If path param is a folder, for readability a report named \file{csv_comma_broken_report.txt} is dropped into path folder and opened automatically to source pane. But if path param is only a file, then the report is only printed to console.
#'
#' @param path path-to-file or path-to-folder
#' @return print report to console (and if multiple, \code{sink}s file to parent folder and opens report with \code{file.show()})
#' @export
#' @examples \dontrun{
#' comma_broken_csv(getwd())
#' # or
#' comma_broken_csv("path_to_file")
#'
#' # Or if you want to run a test on multiple files
#' # not contained in the same (grand)parent folder,
#' # then lapply over the file paths like so:
#' lapply(c("file.path1", "file.path2"), comma_broken_csv))
#' }
comma_broken_csv <- function(path) {
    if (file.info(path)[["isdir"]]) {
        sink("csv_comma_broken_report.txt", split = TRUE)
        are_csv_comma_broken(path)
        sink()
        file.show("csv_comma_broken_report.txt")
    }
    else {
        is_csv_comma_broken(path)
    }
}




