get_csv_files <- function(path){
  dir(path, pattern = ".csv$",recursive = TRUE)
}


# find columns most likely to be breaking the imports
candidates_for_quotes <- function(path) {

  y <- read.csv(path, stringsAsFactors = FALSE, nrows = 30, header=TRUE)
  candidates_for_quotes <- names(y[sapply(y, class) ==  "character"])

  # is_enough_enquoted <- mean(stringi::stri_count_regex(x, "(\"(?!\"))|('(?!'))")) < 2*num_char
  if (length(candidates_for_quotes ) > 0 ) {

    cat(sprintf("One or more of these character columns lacks comma sense.\nThe import is breaking as a result;\nWrap them in quotes to eliminate the problem. \n\t--%s"
                , paste(candidates_for_quotes, collapse="\n\t--")
    ),"\n")
  } else {
    cat("Our analysis suggests non-character column(s) are most likely cause(s) of comma error(s).")
  }
}


is_csv <- function(path){
  tools::file_ext(path)=="csv"
}

is_csv_comma_broken <- function (path) {
	if (is_csv(path)) {
		x <- readLines(path)
		gsub("(\")(.*?)(\")", "[PLACE HOLDER]", x) -> reged
		stringi::stri_count_regex(reged, ",") -> y2
		which(y2 > as.numeric(names(which.max(table(y2))))) -> string_count 
		
		
		
		cat("############################################\n\t\t", 
			basename(path), "\n############################################\n\n")
		if (!length(unique(string_count))==1) {
			candidates_for_quotes(path)
			cat(sprintf("\n \n Out of %d total rows, the following %d rows have no comma sense:\n%s", 
						length(x), length(string_count), paste(string_count, 
															   collapse = ", ")), "\n\n\n\n")
		}
		else {
			cat("all systems a go \n\n")
		}
	}
	else {
		cat(sprintf("Error:  File %s is not a CSV file.\n\tPlease save it as a '.csv' file and try again.", 
					sQuote(path)))
	}
}




are_csv_comma_broken <- function(path){

  cat("############################################\n",
      "############################################\n\t\t",
      "Title: Comma-Broken Statuses of CSVs in following directory\n\t\t",
      "Path to CSVs: ", sQuote(path),
      "\n############################################\n",
      "############################################\n\n\n\n\n\n")

  invisible(lapply(file.path(path,get_csv_files(path)), is_csv_comma_broken))
}
