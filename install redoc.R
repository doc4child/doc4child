list.of.packages <- c(
  "tidyverse",
  "timetk",
  "tibbletime",
  "tidyquant",
  "xts",
  "lubridate",
  "R6",
  "here",
  "rprojroot")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, repos='https://cran.rstudio.com/ ', dependencies = TRUE)

for (i.pack in 1:length(list.of.packages)){
  suppressMessages(require(list.of.packages[i.pack], character.only = TRUE, quietly = TRUE, warn.conflicts = FALSE))
}

update.packages(ask = FALSE)
remotes::install_github("noamross/redoc")


redoc::dedoc("R:/R/Bookdown/Manuscript.docx")
