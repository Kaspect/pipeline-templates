#!/usr/bin/env r
#This is a basic R script that runs knitr on a file.
if (is.null(argv) | length(argv)<1) {
  cat("Usage: knitscript.r document\n")
  q()
}

#this loads knitr, gets the document from the arguments and knits it.
library(knitr)
document <- argv[1]
knit(document)