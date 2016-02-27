#!/usr/bin/env r

if (is.null(argv) | length(argv)<1) {
  cat("Usage: knitscript.r document\n")
  q()
}

library(knitr)
document <- argv[1]
knit(document)