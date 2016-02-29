#!/usr/bin/env r
#This is a basic R script that comes with littlr.  It's been included here for convenience.
if (is.null(argv) | length(argv)<1) {
  cat("Usage: installr.r pkg1 [pkg2 pkg3 ...]\n")
  q()
}

repos <- "http://cran.rstudio.com"

lib.loc <- "/usr/local/lib/R/site-library"

install.packages(argv, lib.loc, repos)